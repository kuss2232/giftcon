package share.conn.adminOrder;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import share.conn.giftcon.CommandMap;

@Controller
public class AdminOrderController {

	@Resource(name="adminOrderService")
	private AdminOrderService adminOrderService;
	
	@RequestMapping(value="/adminOrder.conn")
	public ModelAndView adminOrder(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		String Search = request.getParameter("isSearch");
		List<Map<String, Object>> adOrderList;
		if(request.getParameter("SearchNum") != null)
		{
			commandMap.put("Search", Search);
			adOrderList = adminOrderService.adminOrderSearchID(commandMap.getMap());
			mv.addObject("orderList",adOrderList);
		}
		else {
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
		}
		
		mv.addObject("ORDER_COUNT", adOrderList.size());
		mv.setViewName("/admin/Order/OrderList");
		return mv;
	}
	
	//결제 상태 수정
	@RequestMapping(value="/adminOrderPAY.conn", method = RequestMethod.POST)
	public void OrderPayModify(HttpServletRequest request, HttpServletResponse response, CommandMap commandMap) throws Exception{
		
		/* adminOrderService.changeAmount(commandMap.getMap()); */
		adminOrderService.updateOrderPayment(commandMap.getMap());
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
	 
	
	@RequestMapping(value="/orderNumDelete.conn") 
	public void OrderNumDelete(HttpServletRequest request, CommandMap commandMap, HttpServletResponse response) throws Exception{
		adminOrderService.orderNumDelete(commandMap.getMap());
	}
	
	@RequestMapping(value="/orderDelete.conn") 
	public void OrderDelete(HttpServletRequest request, CommandMap commandMap, HttpServletResponse response) throws Exception{
		adminOrderService.orderDelete(commandMap.getMap());
	}
	 
	 
}
