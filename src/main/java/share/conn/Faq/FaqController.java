package share.conn.Faq;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import share.conn.Paging.Paging;
import share.conn.giftcon.CommandMap;

@Controller
public class FaqController {

	int totalCount;
	private String searchkeyword;
	private int searchNum;

	private int currentPage;
	private int blockCount = 10;
	private int blockPage = 5;
	private String pagingHtml;
	private Paging page;

	@Resource(name = "faqService")
	private FaqService faqService;

	@RequestMapping("/FAQ.conn")
	public ModelAndView FAQ(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();

		List<Map<String, Object>> faqlist = faqService.faqList(commandMap.getMap());

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		searchkeyword = request.getParameter("searchkeyword");

		if (searchkeyword != null) {
			faqlist = faqService.searchList(commandMap.getMap(), searchkeyword);

			totalCount = faqlist.size();
			page = new Paging(currentPage, totalCount, blockCount, blockPage, "noticeList", searchNum, searchkeyword);
			pagingHtml = page.getPagingHtml().toString();

			int lastCount = totalCount;

			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;

			faqlist = faqlist.subList(page.getStartCount(), lastCount);

			mv.addObject("SearchKeyword", searchkeyword);
			mv.addObject("SearchNum", searchNum);
			mv.addObject("totalCount", totalCount);
			mv.addObject("pagingHtml", pagingHtml);
			mv.addObject("currentPage", currentPage);
			mv.addObject("faqlist", faqlist);
			mv.setViewName("faq/FAQ");

			return mv;
		} else {
			totalCount = faqlist.size();

			page = new Paging(currentPage, totalCount, blockCount, blockPage, "faqlist");
			pagingHtml = page.getPagingHtml().toString();

			int lastCount = totalCount;

			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;

			faqlist = faqlist.subList(page.getStartCount(), lastCount);

			mv.addObject("totalCount", totalCount);
			mv.addObject("pagingHtml", pagingHtml);
			mv.addObject("currentPage", currentPage);
			mv.addObject("faqlist", faqlist);
			mv.setViewName("faq/FAQ");

			return mv;
		}

	}
	 
}