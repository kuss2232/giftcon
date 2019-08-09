package share.conn.Order;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
	public ModelAndView orderForm(CommandMap commandMap, HttpSession session, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/order/orderForm");
		int totalPrice = 0;
		int price = 0;
		
		//멤버id, 굿즈넘
		String MEMBER_ID = (String) session.getAttribute("MEMBER_ID");
		commandMap.put("MEMBER_ID",MEMBER_ID );
		
		if(commandMap.get("MEMBER_NUM") == null) {
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
			mv.addObject("totalPrice",totalPrice);
			mv.addObject("MEMBER_ID",MEMBER_ID);
			mv.addObject("GOODS_NUM",request.getParameter("GOODS_NUM"));
			//상품 수량 받아와야함

		}else {
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
		
		return mv;
	}
	
	@RequestMapping("/insertCartOrder.conn")
	public void insertCartOrder(CommandMap commandMap,HttpServletResponse response) throws Exception{
		System.out.println("-------------------------"+commandMap.get("CART_NUM")+"----------------------------"+commandMap.get("ORDER_PRICE"));
		cartService.addOrderToCart(commandMap.getMap());
	}
	
	
	@RequestMapping("/insertOrder.conn")
	public void insertOrder(CommandMap commandMap,HttpServletResponse response)throws Exception{
		orderService.inserOrder(commandMap.getMap());
	}
	
	@RequestMapping("/orderList.conn")
	public ModelAndView orderList(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("/mypage/userOrderList");
		List<Map<String, Object>> list = orderService.orderList(commandMap.getMap());
		
		mv.addObject("list",list);
		
		return mv;
		
	}
}
