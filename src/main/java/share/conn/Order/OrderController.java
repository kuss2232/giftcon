package share.conn.Order;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import share.conn.giftcon.CommandMap;

@Controller
public class OrderController {
	
	@Resource(name="orderService")
	private OrderService orderService;
	
	
	//상세보기에서 주문
	@RequestMapping("/orderForm.conn")
	public ModelAndView orderForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/order/orderForm");
		//멤버id, 굿즈넘
		
		//멤버 정보
		Map<String, Object> member = orderService.memberInfo(commandMap.getMap());
		//상품정보
		Map<String, Object> goods = orderService.goodsInfo(commandMap.getMap());
		
		mv.addObject("member",member);
		mv.addObject("goods",goods);
		//상품 수량 받아와야함
		
		return mv;
	}
	
}
