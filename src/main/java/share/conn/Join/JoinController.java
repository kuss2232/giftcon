package share.conn.Join;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Random;


import javax.annotation.Resource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Authenticator;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.maven.model.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import share.conn.giftcon.CommandMap;

@Controller
public class JoinController {
	String authNUm ="";

	@Resource(name="joinService")
	private JoinService joinService;
	

	@RequestMapping(value="/joinStepComplete.conn")
	public ModelAndView joinStep4() {
	ModelAndView mv = new ModelAndView();
		mv.setViewName("/join/joinStep4");
		return mv;
	}
	@RequestMapping(value="/joinStep1.conn")
	public ModelAndView joinStep1() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/join/joinStep1");
		return mv;
	}
	@RequestMapping(value="/joinStep2.conn")
	public ModelAndView joinStep2() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/join/joinStep2");
		return mv;
	}

	@RequestMapping(value="/joinStep2-1.conn")
	public ModelAndView modal_email() {
		ModelAndView mv = new ModelAndView("/join/modal_email");
		return mv;
	}
	@RequestMapping(value="/joinStep3")
	public ModelAndView joinStep2(HttpSession session, HttpServletRequest request, HttpServletResponse response, CommandMap Map) {

		ModelAndView mv = new ModelAndView();
		//String emailId = (String) Map.getMap().get("MEMBER_ID");
		String emailId = request.getParameter("MEMBER_EMAIL");
		System.out.println(emailId);
		
		mv.addObject("MEMBER_EMAIL",emailId);
		mv.setViewName("/join/joinStep3");
		//session.setAttribute("emailId",emailId);
		return mv;
	}


	@RequestMapping(value="/checkId.conn")
	@ResponseBody
	public void checkId(HttpServletRequest request, HttpServletResponse response, CommandMap commandMap)throws Exception{
		PrintWriter out = response.getWriter();
		String paramId = (request.getParameter("MEMBER_ID") == null) ? "":String.valueOf(request.getParameter("MEMBER_ID"));
		int checkId = joinService.checkId(paramId);

		out.print(checkId);
		out.flush();
		out.close();
	}
	@RequestMapping(value = "/joinStep1/modal_email_auth.conn")
	public ModelAndView email_auth(HttpServletRequest request, HttpServletResponse response, CommandMap Map)throws Exception{
		String email = String.valueOf(request.getParameter("MEMBER_EMAIL"));
		System.out.println("email = " + email);
		Map.getMap().put("MEMBER_EMAIL", email);

		int checkNum = joinService.checkMember(Map.getMap());
		System.out.println("checkNum = "+checkNum);
		
		if(checkNum == 0) {
			authNUm = RandomNum();
			sendEmail(email.toString(),authNUm);
			System.out.println("email 전송함");
		}
		String checkNumString = String.valueOf(checkNum);
		PrintWriter writer = response.getWriter();
		writer.write(checkNumString);
		writer.flush();
		writer.close();

		ModelAndView mv = new ModelAndView();

		mv.addObject("email",email);
		mv.addObject("authNum",authNUm);
		mv.setViewName("/join/joinStep1");

		System.out.println("인증번호"+authNUm);
		return mv;
	}
	@RequestMapping(value="/joinStep1/modal_email_auth_success.conn", method = RequestMethod.POST)
	public @ResponseBody String clickMethod(HttpServletRequest request) throws Exception{
		String str  = authNUm;
		System.out.println("authNUm?" + authNUm);
		return str;
	}
	private void sendEmail(String email, String authNum) {
		String host = "smtp.gmail.com";//이메일 호스트
		String subject = "giftcon 인증 번호 전달";
		String fromName = "giftcon 관리자";
		String from = "ezenyoon2@gmail.com"; //보내는 사람
		String to1 = email;//받는사람

		String content = "인증번호[" + authNum + "]";

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
				 @Override protected PasswordAuthentication getPasswordAuthentication() {
				 return new PasswordAuthentication("ezenyoon2@gmail.com", "ezenacademy@"); }
			};
			//mimeMessage를 쓰기위해 세션으로 저장
			Session session = Session.getInstance(props, auth);

			Message msg = new MimeMessage(session);
			//msg에 관리자이름,utf-8형식,보내는사람을 셋팅한후
			msg.setFrom(new InternetAddress(from,MimeUtility.encodeText(fromName,"UTF-8","B")));//보내는사람설정

			InternetAddress[] address1 = {new InternetAddress(to1)};//address1에 보낼사람들의 정보를 담아 셋팅
			msg.setRecipients(Message.RecipientType.TO, address1);//받는사람설정1
			msg.setSubject(subject);//제목설정
			msg.setSentDate(new java.util.Date());//보내는 날짜설정
			msg.setContent(content,"text/html; charset=UTF-8");//내용설정

			Transport.send(msg);//셋팅이 완료된 메일을 보낸다.
		}catch(MessagingException e) {
			e.printStackTrace();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public String RandomNum() {
		StringBuffer buffer = new StringBuffer();
		for(int i = 0; i<=6; i++) {
			int n=(int)(Math.random() * 10);
			buffer.append(n);
		}
		return buffer.toString();
	}
	@RequestMapping(value="/joinComplete.conn", method=RequestMethod.POST)
	public ModelAndView joinComplete(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("sss"+ commandMap.get("MEMBER_GENDER"));
		String paramId = request.getParameter("MEMBER_ID");
		if( joinService.checkId(paramId) < 1) {
			joinService.insertMember(commandMap.getMap());
		}
		mv.setViewName("/join/joinComplete");
		return mv;
	}

}