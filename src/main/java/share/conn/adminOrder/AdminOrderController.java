package share.conn.adminOrder;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import share.conn.giftcon.CommandMap;

@Controller
public class AdminOrderController {

	@Resource(name="adminOrderService")
	private AdminOrderService adminOrderService;
	
	@RequestMapping(value="/adminOrder.conn")
	public ModelAndView adminOrder(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		int num;
		String Search;
		
		if(request.getAttribute("searchNum") != null)
		{
			num = (Integer) request.getAttribute("searchNum");
			Search = (String) request.getAttribute("isSearch");
			List<Map<String, Object>> adOrderList = adminOrderService.adminOrderSearchPay(commandMap.getMap());
		}
		else {
			List<Map<String, Object>> adOrderList = adminOrderService.allOrderList();
			mv.addObject("orderList", adOrderList);
			mv.addObject("ORDER_COUNT", adOrderList.size());
			mv.setViewName("/admin/Order/OrderList");
		}
		return mv;
	}
	
	@RequestMapping(value="/adminOrderDetail.conn")
	public ModelAndView OrderDetail(HttpServletRequest request, CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<Map<String, Object>> adOrderList = adminOrderService.orderDetail(commandMap.getMap());
		mv.addObject("orderList", adOrderList);
		mv.setViewName("/admin/Order/OrderDetail");
		return mv;
	}
	
	/*
	 @RequestMapping(value="/adminOrderModify.conn") public ModelAndView
	 OrderModify(HttpServletRequest request, CommandMap commandMap) throws
	 Exception{ ModelAndView mv = new ModelAndView();
	 mv.setViewName("/admin/Order/OrderModify"); return mv; }
	 */
}
