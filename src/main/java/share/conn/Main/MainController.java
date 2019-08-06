package share.conn.Main;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import share.conn.giftcon.CommandMap;

@Controller
public class MainController {
	
	@Resource(name="mainService")
	private MainService mainService;
	
	@RequestMapping("/main.conn")
	public ModelAndView mainList(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<Map<String, Object>> bestList = mainService.GoodsBestList();
		List<Map<String, Object>> saleList = mainService.GoodsSaleList1();
		
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
		mv.addObject("map",map);
		
		return mv;
	}
	
}
