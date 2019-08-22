package share.conn.Order;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.annotation.Resource;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import share.conn.Cart.CartService;
import share.conn.giftcon.CommandMap;

@Controller

public class OrderController {

	@Resource(name="orderService")
	private OrderService orderService;
	
	@Resource(name="cartService")
	private CartService cartService;
	
	
	
	//상세보기에서 주문
	@RequestMapping("/orderForm.conn")
	public ModelAndView orderForm(CommandMap commandMap, HttpSession session, HttpServletRequest request, RedirectAttributes redirectAttribute) throws Exception{
		ModelAndView mv = new ModelAndView("/order/orderForm");
		int totalPrice = 0;
		int price = 0;
		
		//멤버id, 굿즈넘
		String MEMBER_ID = (String) session.getAttribute("MEMBER_ID");
		commandMap.put("MEMBER_ID",MEMBER_ID );
//		System.out.println("굿즈넘:::::::::::" + commandMap.get("GOODS_NUM"));
		int qq = orderService.goodsAmount(commandMap.getMap());
//		System.out.println("수량 체크:::::::::::::" + qq);

		if(qq > 1) {
			if(commandMap.get("MEMBER_NUM") == null) {
				System.out.println("MEMBER_NUM NULL ****************************************");
				//멤버 정보
				Map<String, Object> member = orderService.memberInfo(commandMap.getMap());
				//상품정보
				Map<String, Object> goods = orderService.goodsInfo(commandMap.getMap());
				List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
				list.add(goods);
				mv.addObject("member",member);
				mv.addObject("list",list);

				if(goods.get("GOODS_DCPRICE") == null) {
					totalPrice = (Integer) Integer.parseInt(goods.get("GOODS_PRICE").toString());
				}
				if(goods.get("GOODS_DCPRICE") != null) {
					if(Integer.parseInt(goods.get("GOODS_DCPRICE").toString()) > 0)
						totalPrice = Integer.parseInt(goods.get("GOODS_DCPRICE").toString());
					else
						totalPrice = Integer.parseInt(goods.get("GOODS_PRICE").toString());
				}
				price = Integer.parseInt(goods.get("GOODS_PRICE").toString());
				mv.addObject("price",price);
				mv.addObject("totalPrice",totalPrice);
				mv.addObject("MEMBER_ID",MEMBER_ID);
				mv.addObject("GOODS_NUM",request.getParameter("GOODS_NUM"));
				mv.addObject("AMOUNT", 1);		 //****상품 수량 받아와야함

			}else {
				System.out.println("MEMBER_NUM NOT NULL ****************************************");
				List<Map<String, Object>> list = orderService.cartOrderList(commandMap.getMap());
				Map<String, Object> member = orderService.memberInfo(commandMap.getMap());

				for(int i=0; i <list.size(); i++) {
					Map<String, Object> goods = list.get(i);
					if(goods.get("GOODS_DCPRICE") == null) {
						totalPrice += (Integer) Integer.parseInt(goods.get("GOODS_PRICE").toString()) * Integer.parseInt((goods.get("CART_AMOUNT").toString()));
					}
					if(goods.get("GOODS_DCPRICE") != null) {
						if(Integer.parseInt(goods.get("GOODS_DCPRICE").toString()) > 0)
							totalPrice += Integer.parseInt(goods.get("GOODS_DCPRICE").toString()) * Integer.parseInt((goods.get("CART_AMOUNT").toString()));
						else
							totalPrice += Integer.parseInt(goods.get("GOODS_PRICE").toString()) * Integer.parseInt((goods.get("CART_AMOUNT").toString()));
					}
					price += Integer.parseInt(goods.get("GOODS_PRICE").toString()) * Integer.parseInt((goods.get("CART_AMOUNT").toString()));
				}

				mv.addObject("price", price);
				mv.addObject("totalPrice",totalPrice);
				mv.addObject("member",member);
				mv.addObject("list",list);
				mv.addObject("GOODS_NUM",request.getParameter("GOODS_NUM"));
				mv.addObject("MEMBER_ID",MEMBER_ID);
			}
		}else {
			//상품수량이 1개보다 작으면 이전페이지로 돌아옴
			String viewName ="redirect:" + request.getHeader("Referer");
			StringBuffer soldOut = new StringBuffer();
			soldOut.append("<script language='javascript'>");
			soldOut.append("alert('품절된 상품입니다.');");
			soldOut.append("</script>");
			redirectAttribute.addFlashAttribute("soldOut", soldOut);
			mv.setViewName(viewName);
		}
		
		return mv;
	}
	
	@RequestMapping("/insertCartOrder.conn")
	public void insertCartOrder(CommandMap commandMap,HttpServletResponse response) throws Exception{
		System.out.println("-------------------------"+commandMap.get("CART_NUM")+"----------------------------"+commandMap.get("ORDER_PRICE"));
		cartService.addOrderToCart(commandMap.getMap());
	}
	
	
	@RequestMapping("/insertOrder.conn")
	public void insertOrder(CommandMap commandMap,HttpServletResponse response)throws Exception{
		orderService.insertOrder(commandMap.getMap());
	}
	
	@RequestMapping("/orderList.conn")
	public ModelAndView orderList(CommandMap commandMap, HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView("/mypage/userOrderList");
		commandMap.put("MEMBER_NUM", request.getSession().getAttribute("MEMBER_NUM"));
		List<Map<String, Object>> list = orderService.findmemberOrderList(commandMap.getMap());
		
		mv.addObject("list",list);
		
		return mv;
		
	}
	
	@RequestMapping("/send_email.conn")
	public void sendEmail(HttpServletResponse response, HttpServletRequest request, CommandMap commandMap, HttpSession session) throws Exception{

		String host = "smtp.gmail.com";//이메일 호스트
		String subject = "giftcon 기프티콘 바코드 전달";
		String fromName = "giftcon 관리자";
		String from = "ezenyoon2@gmail.com"; //보내는 사람
		commandMap.put("MEMBER_ID", session.getAttribute("MEMBER_ID"));
		String to1 = orderService.memberInfo(commandMap.getMap()).get("MEMBER_EMAIL").toString();
		File file = new File(request.getSession().getServletContext().getRealPath("/images/barcode/barcode.jpg"));

		Multipart mp = new MimeMultipart();

		MimeBodyPart attachFile = new MimeBodyPart(); //String content = "인증번호[" + authNum + "]";
		attachFile.setFileName("barcode.jpg");

		FileDataSource filedata = new FileDataSource(file);
		DataHandler dataHandler = new DataHandler(filedata);
		attachFile.setDataHandler(dataHandler);

		Path path = Paths.get(file.getCanonicalPath());
		String type = Files.probeContentType(path);
		attachFile.setHeader("Content-Type", type);
		
		attachFile.setDescription(file.getName().split("\\.")[0], "UTF-8");
		mp.addBodyPart(attachFile);

		try { 
			Properties props = new Properties();

			props.put("mail.smtp.user", "ezenyoon2@gmail.com");
			props.put("mail.smtp.host", "smtp.gmail.com"); 
			props.put("mail.smtp.port", "465"); 
			props.put("mail.smtp.starttls.enable","true"); 
			props.put("mail.smtp.auth", "true"); 
			props.put("mail.smtp.debug", "true");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.socketFactory.fallback", "false");


			Authenticator auth = new javax.mail.Authenticator() {
					@Override 
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication("ezenyoon2@gmail.com", "ezenacademy@"); 
					}
			};

			Session session_E = Session.getInstance(props, auth);

			Message msg = new MimeMessage(session_E); msg.setFrom(new
					InternetAddress(from,MimeUtility.encodeText(fromName,"UTF-8","B")));//보내는사람설정

			InternetAddress[] address1 = {new InternetAddress(to1)};
			msg.setRecipients(Message.RecipientType.TO, address1);//받는사람설정1
			msg.setSubject(subject);//제목설정 
			msg.setSentDate(new java.util.Date());//보내는 날짜설정 
			msg.setContent(mp);//내용설정

			Transport.send(msg); 
			}catch(MessagingException e) { e.printStackTrace();
			}catch(Exception e) { e.printStackTrace(); 
		}

	}
}
