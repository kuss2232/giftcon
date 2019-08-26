package share.conn.adminReview;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import share.conn.Paging.AdminQNAPaging;
import share.conn.giftcon.CommandMap;

@Controller
public class AdminReviewController {
	
	
	@Resource(name="adminReviewService")
	private AdminReviewService adminReviewService;
	
	private int totalCount;
	private int searchNum;
	
	private String SearchKeyword;
	private int currentPage = 1;
	private int blockCount = 10;
	private int blockPage = 10;
	private String pagingHtml;
	private AdminQNAPaging page;
	

	
	//관리자 리뷰 리스트
	@RequestMapping("/adminReviewList.conn")
	public ModelAndView adminReviewList(CommandMap commandMap, HttpServletRequest request)throws Exception{
		
		ModelAndView mv = new ModelAndView();
		List<Map<String, Object>> reviewList = adminReviewService.reviewList(commandMap.getMap());

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		totalCount = reviewList.size();
		SearchKeyword = request.getParameter("SearchKeyword");
		
		if(SearchKeyword != null ) {
			searchNum = Integer.parseInt(request.getParameter("searchNum"));
			SearchKeyword = request.getParameter("SearchKeyword");
			
			if(searchNum == 0) {
				commandMap.put("SearchKeyword", SearchKeyword);
				reviewList = adminReviewService.searchReviewList(commandMap.getMap()); 
				totalCount = reviewList.size();
			
			}else if(searchNum == 1) {
				commandMap.put("SearchKeyword", SearchKeyword);
				reviewList = adminReviewService.searchReviewList(commandMap.getMap()); 
				totalCount = reviewList.size();
			}
			
			page = new AdminQNAPaging(currentPage, totalCount, blockCount, blockPage, "adminReviewList.conn", searchNum, SearchKeyword);
			pagingHtml = page.getPagingHtml().toString();
			int lastCount = totalCount;
			
			if(page.getEndCount() < totalCount)
				lastCount = page.getEndCount()+1;
			
			reviewList = reviewList.subList(page.getStartCount(), lastCount);
			
			mv.addObject("count",totalCount);
			mv.addObject("Searchkeyword", SearchKeyword);
			mv.addObject("pagingHtml",pagingHtml);
			mv.addObject("reviewList",reviewList);
			mv.setViewName("admin/Review/adminReviewList");
			return mv;
			
		}else {
			totalCount = reviewList.size();
			
			page = new AdminQNAPaging(currentPage, totalCount, blockCount, blockPage, "adminReviewList.conn");
			pagingHtml = page.getPagingHtml().toString();
			
			int lastCount = totalCount;
			
			if(page.getEndCount() < totalCount)
				lastCount = page.getEndCount()+1;
			
			reviewList =  reviewList.subList(page.getStartCount(), lastCount);
			
			mv.addObject("count",totalCount);
			mv.addObject("pagingHtml",pagingHtml);
			mv.addObject("reviewList",reviewList);
			mv.addObject("currentPage",currentPage);
			mv.setViewName("admin/Review/adminReviewList");
			
			return mv;
		}

		
		/*
		 * mv.addObject("searchNum",searchNum);
		 * mv.addObject("SearchKeyword",SearchKeyword);
		 */
//		System.out.println("reviewCount-------------"+ count.get("CNT"));
	}
	
	@RequestMapping("/adminReviewDelete.conn")
	public ModelAndView adminReviewDelete(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/adminReviewList.conn");
		adminReviewService.reviewDelete(commandMap.getMap());
		return mv;
	}
}
