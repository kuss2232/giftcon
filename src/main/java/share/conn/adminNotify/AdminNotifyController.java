package share.conn.adminNotify;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import share.conn.adminNotify.AdminNotifyService;
import share.conn.giftcon.CommandMap;
import share.conn.Paging.Paging;


@Controller
public class AdminNotifyController {
	
	private int SearchNum;

	private String SearchKeyword;

	// 페이징 변수
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 7;
	private int blockPage = 5;
	private String pagingHtml;
	private Paging page;

	

	@Resource(name = "adminNotifyService")
	private AdminNotifyService adminNotifyService;

	// 공지사항 목록
	@RequestMapping(value =  "/notify/adminNotifyList.conn")
	public ModelAndView adminNotifyList(CommandMap commandMap, HttpServletRequest request) throws Exception {

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		ModelAndView mv = new ModelAndView();
		List<Map<String, Object>> noticeList = adminNotifyService.noticeList(commandMap.getMap());

		
		Map<String, Object> SearchKeywordMap = new HashMap<String, Object>();
		
		SearchKeyword = request.getParameter("SearchKeyword");

		if (SearchKeyword != null) {
		
			SearchNum = Integer.parseInt(request.getParameter("SearchNum"));
			SearchKeywordMap.put("SearchKeyword", SearchKeyword);

			if (SearchNum == 1) { // 제목검색
				noticeList = adminNotifyService.notifySearch(SearchKeywordMap);
			} else if (SearchNum == 2) { // 내용검색
				noticeList = adminNotifyService.notifySearch(SearchKeywordMap);
			}

			totalCount = noticeList.size();
			page = new Paging(currentPage, totalCount, blockCount, blockPage, "noticeList", SearchNum, SearchKeyword);
			pagingHtml = page.getPagingHtml().toString();

			int lastCount = totalCount;

			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;

			noticeList = noticeList.subList(page.getStartCount(), lastCount);

			mv.addObject("SearchKeyword", SearchKeyword);
			mv.addObject("SearchNum", SearchNum);
			mv.addObject("totalCount", totalCount);
			mv.addObject("pagingHtml", pagingHtml);
			mv.addObject("currentPage", currentPage);
			mv.addObject("noticeList", noticeList);
			mv.setViewName("admin/Notice/admin_notice");

			return mv;

		} else {
			totalCount = noticeList.size();

			page = new Paging(currentPage, totalCount, blockCount, blockPage, "noticeList");
			pagingHtml = page.getPagingHtml().toString();

			int lastCount = totalCount;

			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;

			noticeList = noticeList.subList(page.getStartCount(), lastCount);

			mv.addObject("totalCount", totalCount);
			mv.addObject("pagingHtml", pagingHtml);
			mv.addObject("currentPage", currentPage);

			mv.addObject("noticeList", noticeList);
			mv.setViewName("admin/Notice/admin_notice");

			return mv;
		}
	}

	// 공지사항 등록 폼
	@RequestMapping(value = "/notify/adminNotifyForm.conn")
	public ModelAndView adminNotifyForm() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin/Notice/admin_Insertnotice");
		return mv;
	}

	// 공지사항 등록
	@RequestMapping(value = "/notify/adminInsertNotify.conn")
	public ModelAndView insertNotice(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/Notice/admin_notice");

		adminNotifyService.insertNotice(commandMap.getMap(), request);

		return mv;
	}
	
	//공지사항 상세보기
	@RequestMapping(value = "/notify/adminNoticeDetail.conn")
	public ModelAndView noticeDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		Map<String, Object> noticeDetail = adminNotifyService.notifyDetail(commandMap.getMap());
		
		mv.addObject("noticeDetail", noticeDetail);
		mv.setViewName("/admin/Notice/admin_noticedetail");		
		
		return mv;
	}
	

	// 공지사항 수정 폼
	@RequestMapping(value = "/notify/adminNoticeModifyForm.conn")
	public ModelAndView notifyDetail(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();

		Map<String, Object> notifyDetail = adminNotifyService.notifyDetail(commandMap.getMap());
		mv.addObject("notifyDetail", notifyDetail);

		mv.setViewName("admin/Notice/admin_noticeModifyForm");
		return mv;
	}

	// 공지사항 수정
	@RequestMapping(value = "notify/adminNotifyModify.conn")
	public ModelAndView notifyModify(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/Notice/admin_notice");

		adminNotifyService.notifyModify(commandMap.getMap(), request);
		mv.addObject("NOTICE_NUM", commandMap.get("NOTICE_NUM"));

		return mv;
	}

	// 공지사항 삭제
	@RequestMapping(value = "/notify/adminDeleteNotify.conn")
	public ModelAndView adminDeleteNotify(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/Notice/admin_notice");

			adminNotifyService.notifyDelete(commandMap.getMap());

		return mv;
	}
}