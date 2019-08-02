package share.conn.adminOrder;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminOrderController {

	@Resource(name="adminOrderService")
	private AdminOrderService adminOrderService;
	
	@RequestMapping(value="/adminOrder.conn")
	public ModelAndView adminOrder() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/Order/OrderList");
		return mv;
	}
}
