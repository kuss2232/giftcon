package share.conn.adminOrder;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		String Search = (String) request.getParameter("isSearch");
		System.out.println("========================="+ Search +"===============================");
		List<Map<String, Object>> adOrderList;
		if(Search != null)
		{
			commandMap.put("Search", Search);
			adOrderList = adminOrderService.adminOrderSearchPay(commandMap.getMap());
			mv.addObject("orderList",adOrderList);
		}
		else {
			adOrderList = adminOrderService.allOrderList();
			mv.addObject("orderList", adOrderList);
		}
		mv.addObject("ORDER_COUNT", adOrderList.size());
		mv.setViewName("/admin/Order/OrderList");
		return mv;
	}
	
	@RequestMapping(value="/adminOrderDetail.conn")
	public ModelAndView OrderDetail(HttpServletRequest request, CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<Map<String, Object>> adOrderList = adminOrderService.orderDetail(commandMap.getMap());
		mv.addObject("OrderCount", adOrderList.size());
		mv.addObject("orderList", adOrderList);
		mv.setViewName("/admin/Order/OrderDetail");
		return mv;
	}
	
	 @RequestMapping(value="/orderDelete.conn") 
	 public void OrderDelete(HttpServletRequest request, CommandMap commandMap, HttpServletResponse response) throws Exception{
		 adminOrderService.orderDelete(commandMap.getMap());
	 }
}
