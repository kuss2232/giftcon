package share.conn.Order;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import share.conn.giftcon.CommandMap;

@Controller

public class OrderController {
	private int totalPrice;
	@Resource(name="orderService")
	private OrderService orderService;
	
	
	
	//상세보기에서 주문
	@RequestMapping("/orderForm.conn")
	public ModelAndView orderForm(CommandMap commandMap, HttpSession session, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/order/orderForm");
		
		//멤버id, 굿즈넘
		String MEMBER_ID = (String) session.getAttribute("MEMBER_ID");
		commandMap.put("MEMBER_ID",MEMBER_ID );
		request.getAttribute("GOODS_NUM");
		//멤버 정보
		Map<String, Object> member = orderService.memberInfo(commandMap.getMap());
		//상품정보
		
		
		Map<String, Object> goods = orderService.goodsInfo(commandMap.getMap());
		mv.addObject("member",member);
		mv.addObject("goods",goods);
		
		if(goods.get("GOODS_DCPRICE") == null) {
			totalPrice = (Integer) Integer.parseInt(goods.get("GOODS_PRICE").toString());
		}
		if(goods.get("GOODS_DCPRICE") != null) {
			if(Integer.parseInt(goods.get("GOODS_DCPRICE").toString()) > 0)
				totalPrice = Integer.parseInt(goods.get("GOODS_DCPRICE").toString());
			else
				totalPrice = Integer.parseInt(goods.get("GOODS_PRICE").toString());
		}
		mv.addObject("totalPrice",totalPrice);
		
		
		
		
		
		
		
		//상품 수량 받아와야함
		
		return mv;
	}
	
}
