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
	
	private int searchNum;

	private String SearchKeyword;

	// 페이징 변수
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 7;
	private int blockPage = 5;
	private String pagingHtml;
	private Paging page;
	private String filePath = "D:\\java\\Git\\giftcon\\src\\main\\webapp\\file\\noticefile\\";
	

	@Resource(name = "adminNotifyService")
	private AdminNotifyService adminNotifyService;

	// 공지사항 목록
	@RequestMapping(value =  "/notify/adminNotifyList")
	public ModelAndView adminNotifyList(CommandMap commandMap, HttpServletRequest request) throws Exception {

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		ModelAndView mv = new ModelAndView();
		List<Map<String, Object>> noticeList = adminNotifyService.notifyList(commandMap.getMap());

		
		Map<String, Object> SearchKeywordMap = new HashMap<String, Object>();
		
		SearchKeyword = request.getParameter("SearchKeyword");

		if (SearchKeyword != null) {
		
			searchNum = Integer.parseInt(request.getParameter("searchNum"));
			SearchKeywordMap.put("SearchKeyword", SearchKeyword);

			if (searchNum == 0) { // 회원ID
				noticeList = adminNotifyService.notifyTitleSearch(SearchKeywordMap);
			} else if (searchNum == 1) { // 상품이름
				noticeList = adminNotifyService.notifyContentSearch(SearchKeywordMap);
			}

			totalCount = noticeList.size();
			page = new Paging(currentPage, totalCount, blockCount, blockPage, "adminNotifyList", searchNum, SearchKeyword);
			pagingHtml = page.getPagingHtml().toString();

			int lastCount = totalCount;

			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;

			noticeList = noticeList.subList(page.getStartCount(), lastCount);

			mv.addObject("SearchKeyword", SearchKeyword);
			mv.addObject("searchNum", searchNum);
			mv.addObject("totalCount", totalCount);
			mv.addObject("pagingHtml", pagingHtml);
			mv.addObject("currentPage", currentPage);
			mv.addObject("noticeList", noticeList);
			mv.setViewName("notice/adminnoticeList");

			return mv;

		} else {
			totalCount = noticeList.size();

			page = new Paging(currentPage, totalCount, blockCount, blockPage, "adminNotifyList");
			pagingHtml = page.getPagingHtml().toString();

			int lastCount = totalCount;

			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;

			noticeList = noticeList.subList(page.getStartCount(), lastCount);

			mv.addObject("totalCount", totalCount);
			mv.addObject("pagingHtml", pagingHtml);
			mv.addObject("currentPage", currentPage);

			mv.addObject("noticeList", noticeList);
			mv.setViewName("adminNoticeList");

			return mv;
		}
	}

	// 공지사항 등록 폼
	@RequestMapping(value = "/notify/adminNotifyForm")
	public ModelAndView adminNotifyForm() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("notifyForm");
		return mv;
	}

	// 공지사항 등록
	@RequestMapping(value = "/notify/adminInsertNotify")
	public ModelAndView adminInsertNotify(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/notify/adminNotifyList");

		adminNotifyService.notifyWrite(commandMap.getMap(), request);

		return mv;
	}

	// 공지사항 수정 폼
	@RequestMapping(value = "/notify/adminNotifyDetail")
	public ModelAndView adminNotifyDetail(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();

		Map<String, Object> notifyDetail = adminNotifyService.notifyDetail(commandMap.getMap());
		mv.addObject("notifyDetail", notifyDetail);

		mv.setViewName("notifyModifyForm");
		return mv;
	}

	// 공지사항 수정
	@RequestMapping(value = "notify/adminNotifyModify")
	public ModelAndView adminNotifyModify(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/notify/adminNotifyList");

		adminNotifyService.notifyModify(commandMap.getMap(), request);
		mv.addObject("NOTIFY_NUMBER", commandMap.get("NOTIFY_NUMBER"));

		return mv;
	}

	// 공지사항 삭제
	@RequestMapping(value = "/notify/adminDeleteNotify")
	public ModelAndView adminDeleteNotify(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/notify/adminNotifyList");

		Map<String, Object> deleteNotify = adminNotifyService.notifyDetail(commandMap.getMap());

		if (deleteNotify.get("NOTIFY_IMAGE") != null) {
			File removeFile = new File(filePath + deleteNotify.get("NOTIFY_IMAGE"));
			removeFile.delete();
		}

		adminNotifyService.notifyDelete(commandMap.getMap());

		return mv;
	}
}