package share.conn.Notice;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import share.conn.giftcon.CommandMap;
import share.conn.Paging.Paginate;

@Controller
public class NoticeController {
	
	int totalCount;
	private int searchNum;
	private String SearchKeyword;
	
	private int currentPage;
	private int blockCount = 10;
	private int blockPage = 5;
	private String pagingHtml;
	private Paginate page;
	
	@Resource(name = "noticeService")
	private NoticeService noticeService;
	
	@RequestMapping(value = "/notice.conn")
	public ModelAndView noticeList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		List<Map<String, Object>> noticeList = noticeService.notice(commandMap.getMap());
		
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		SearchKeyword = request.getParameter("SearchKeyword");

		if (SearchKeyword != null) {
			searchNum = Integer.parseInt(request.getParameter("SearchNum"));
			noticeList = noticeService.noticeSearch(commandMap.getMap());
			
			totalCount = noticeList.size();
			page = new Paginate(currentPage, totalCount, blockCount, blockPage, "/giftcon/notice.conn", searchNum, SearchKeyword);
			pagingHtml = page.getPagingHtml().toString();
			
			int lastCount = totalCount;
			
			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;
			
			noticeList = noticeList.subList(page.getStartCount(), lastCount);
			

			
			mv.addObject("SearchKeyword", SearchKeyword);
			mv.addObject("SearchNum", searchNum);
			mv.addObject("totalCount", totalCount);
			mv.addObject("pagingHtml", pagingHtml);
			mv.addObject("currentPage", currentPage);
			mv.addObject("noticeList", noticeList);
			mv.setViewName("notice/notice");
			
			return mv;
		} else {
			totalCount = noticeList.size();
			page = new Paginate(currentPage, totalCount, blockCount, blockPage, "/giftcon/notice.conn");
			pagingHtml = page.getPagingHtml().toString();

			int lastCount = totalCount;

			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;
			noticeList = noticeList.subList(page.getStartCount(), lastCount);

			mv.addObject("totalCount", totalCount);
			mv.addObject("pagingHtml", pagingHtml);
			mv.addObject("currentPage", currentPage);
			mv.addObject("noticeList", noticeList);
			mv.setViewName("notice/notice");

			return mv;
		}
	}
	
	@RequestMapping(value = "/noticeDetail.conn")
	public ModelAndView noticeDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		Map<String, Object> noticeDetail = noticeService.noticeDetail(commandMap.getMap());
		
		mv.addObject("noticeDetail", noticeDetail);
		mv.setViewName("notice/noticedetail");		
		
		return mv;
	}

}
