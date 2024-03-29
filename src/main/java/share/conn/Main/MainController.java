package share.conn.Main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import share.conn.Cart.CartService;
import share.conn.Goods.GoodsService;
import share.conn.Paging.Paging;
import share.conn.giftcon.CommandMap;

@Controller
public class MainController {
	
	@Resource(name="mainService")
	private MainService mainService;
	
	@Resource(name="goodsService")
	private GoodsService goodsService;
	
	@Resource(name="cartService")
	private CartService cartService;
		
	@RequestMapping("/main.conn")
	public ModelAndView mainList(CommandMap commandMap, HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<Map<String, Object>> bestList = mainService.GoodsBestList();
		List<Map<String, Object>> saleList = mainService.GoodsSaleList1();
		List<Map<String, Object>> smallcategoryList = goodsService.smallCategoryList();
		int count = 0;
		
		if(session.getAttribute("MEMBER_ID") != null)
		{
			commandMap.put("MEMBER_NUM", session.getAttribute("MEMBER_NUM")); 
			count = cartService.cartList(commandMap.getMap()).size();
			session.setAttribute("count", count);
		}
		
		if(bestList.size()<4) {
			bestList.add(null);
			bestList.add(null);
			bestList.add(null);
			bestList.add(null);
		}
		
		if(saleList.size()<4) {
			saleList.add(null);
			saleList.add(null);
			saleList.add(null);
			saleList.add(null);
		}
		
		bestList = bestList.subList(0, 4);
		saleList = saleList.subList(0, 4);
		
		
		mv.addObject("MEMBER_NUM", session.getAttribute("MEMBER_NUM"));
		mv.addObject("smallcategoryList", smallcategoryList);
		mv.addObject("bestList", bestList);
		mv.addObject("saleList", saleList);
		mv.setViewName("/main/main");
		return mv;
	}
	

	@RequestMapping("eventList.conn")
	public ModelAndView eventList(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("/event/eventList");
		
		List<Map<String, Object>> eventList = mainService.eventList();
		List<Map<String, Object>> endEventList = mainService.endEventList();
		mv.addObject("eventList",eventList);
		mv.addObject("endEventList", endEventList);
		
		return mv;
	}
	
	@RequestMapping("eventDetail.conn")
	public ModelAndView eventDetail(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("/event/eventDetail");
		System.out.println(commandMap.get("EVENT_NUM"));
		Map<String, Object> map = mainService.eventDetail(commandMap.getMap());
	    String str[] = (map.get("EVENT_IMG")).toString().split(",");
	      mv.addObject("IMGLIST",str);
		mv.addObject("map",map);
		
		return mv;
	}
	
	@RequestMapping("Terms of service.conn")
	public ModelAndView Service() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/main/Termsofservice");
		return mv;
	}
	
	@RequestMapping("privacy.conn")
	public ModelAndView Privacy() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/main/privacy");
		return mv;
	}
	
	@RequestMapping("budget.conn")
	public ModelAndView Budget() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/main/budget");
		return mv;
	}
	   
	@RequestMapping("budgeting.conn")
	   public @ResponseBody List<Map<String,Object>> budgeting(CommandMap commandMap, HttpServletResponse response) throws Exception{
	    System.out.println("lllllll  "+commandMap.getMap().get("price"));
		int price = Integer.parseInt(commandMap.get("price").toString());
	      int priceMax = (int)(price*1.2);
	      int priceMin = (int)(price*0.8);
	      
	      Map<String, Object> priceMap = new HashMap<String, Object>();
	      priceMap.put("priceMax", priceMax);
	      priceMap.put("priceMin", priceMin);
	      
	      List<Map<String, Object>> goodsList = mainService.goodsBudget(priceMap);
	      return goodsList;
	   }
}
