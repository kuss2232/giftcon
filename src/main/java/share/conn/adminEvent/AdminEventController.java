package share.conn.adminEvent;


import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import share.conn.adminEvent.AdminEventService;
import share.conn.giftcon.CommandMap;
import share.conn.Paging.Paging;

@Controller
public class AdminEventController {
	
	// 페이징 변수
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 7;
	private int blockPage = 5;
	private String pagingHtml;
	private Paging page;
	private String filePath3 = "D:\\java\\Git\\giftcon\\src\\main\\webapp\\file\\Eventfile\\";
		
	@Resource(name = "AdminEventService")
	private AdminEventService adminEventService;

	// 이벤트 목록(진행중)
	@RequestMapping(value =  "/event/adminEventList.conn")
	public ModelAndView eventList(CommandMap commandMap, HttpServletRequest request) throws Exception {

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		ModelAndView mv = new ModelAndView();
		List<Map<String, Object>> eventList = adminEventService.eventList(commandMap.getMap());
		
		totalCount = eventList.size();
			page = new Paging(currentPage, totalCount, blockCount, blockPage, "eventList");
			pagingHtml = page.getPagingHtml().toString();

			int lastCount = totalCount;

			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;

			eventList = eventList.subList(page.getStartCount(), lastCount);

			mv.addObject("totalCount", totalCount);
			mv.addObject("pagingHtml", pagingHtml);
			mv.addObject("currentPage", currentPage);
			mv.addObject("eventList", eventList);
			mv.setViewName("admin/Event/admin_event");

			return mv;

	}
	
	// 이벤트 목록(종료)
		@RequestMapping(value =  "/event/adminEndEventList.conn")
		public ModelAndView endEventList(CommandMap commandMap, HttpServletRequest request) throws Exception {

			if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
					|| request.getParameter("currentPage").equals("0")) {
				currentPage = 1;
			} else {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}

			ModelAndView mv = new ModelAndView();
			List<Map<String, Object>> endEventList = adminEventService.endEventList(commandMap.getMap());

			
			 totalCount = endEventList.size();
				page = new Paging(currentPage, totalCount, blockCount, blockPage, "eventList");
				pagingHtml = page.getPagingHtml().toString();

				int lastCount = totalCount;

				if (page.getEndCount() < totalCount)
					lastCount = page.getEndCount() + 1;

				endEventList = endEventList.subList(page.getStartCount(), lastCount);

				mv.addObject("totalCount", totalCount);
				mv.addObject("pagingHtml", pagingHtml);
				mv.addObject("currentPage", currentPage);
				mv.addObject("endEventList", endEventList);
				mv.setViewName("admin/Event/admin_endevent");

				return mv;

		}
	
	// EVENT 등록 폼
		@RequestMapping(value = "/event/adminEventForm.conn")
		public ModelAndView EventInsertForm() throws Exception {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("/admin/Event/admin_Insertevent");
			return mv;
		}
		
		// EVENT 등록
		@RequestMapping(value = "/event/adminEventInsert.conn")
		public ModelAndView eventInsert(CommandMap commandMap, HttpServletRequest request) throws Exception {
			ModelAndView mv = new ModelAndView("redirect:/event/adminEventList.conn");
			
		adminEventService.eventInsert(commandMap.getMap(), request);

			return mv;
		}
		
		//EVENT 상세보기
		@RequestMapping(value = "/event/adminEventDetail.conn")
		public ModelAndView eventDetail(CommandMap commandMap) throws Exception {
			ModelAndView mv = new ModelAndView();
			
			Map<String, Object> eventDetail = adminEventService.eventDetail(commandMap.getMap());
			String str[] = (eventDetail.get("EVENT_IMG")).toString().split(",");
			mv.addObject("IMGLIST",str);
			mv.addObject("eventDetail", eventDetail);
			mv.setViewName("/admin/Event/admin_eventdetail");		
			
			return mv;
		}



		// EVENT 수정 폼 이동
		@RequestMapping(value = "/event/adminEventModifyForm.conn")
		public ModelAndView EventModifyForm(CommandMap commandMap) throws Exception {
			ModelAndView mv = new ModelAndView();

			Map<String, Object> eventDetail = adminEventService.eventDetail(commandMap.getMap());
			mv.addObject("eventDetail", eventDetail);
			mv.setViewName("/admin/Event/admin_eventModifyForm");

			return mv;
		}

		// EVENT 수정
		@RequestMapping(value = "/event/adminEventModify.conn")
		public ModelAndView EventModify(CommandMap commandMap, HttpServletRequest request) throws Exception {
			ModelAndView mv = new ModelAndView("redirect:/EVENT/adminEventList.conn");
			
			adminEventService.eventModify(commandMap.getMap(), request);

			mv.addObject("EVENT_NUM", commandMap.get("EVENT_NUM"));

			return mv;
		}

		// EVENT 삭제
		@RequestMapping(value = "/event/adminDeleteEvent.conn")
		public ModelAndView EventDelete(CommandMap commandMap) throws Exception {
			ModelAndView mv = new ModelAndView("redirect:/event/adminEventList.conn");

			//Map<String, Object> deleteEVENT = adminEVENTService.EVENTDetail(commandMap.getMap());

			adminEventService.eventDelete(commandMap.getMap());

			return mv;
		}
}
