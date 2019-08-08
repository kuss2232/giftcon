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
	private Integer categoryNum;
	private String SearchKeyword;
	
	private int currentPage = 1;
	private int blockCount = 10;
	private int blockPage = 10;
	private String pagingHtml;
	private AdminQNAPaging page;
	

	
	//관리자 리뷰 리스트
	@RequestMapping("/adminReviewList.conn")
	public ModelAndView adminReviewList(CommandMap commandMap, HttpServletRequest request)throws Exception{
		
		ModelAndView mv = new ModelAndView("/admin/Review/adminReviewList");
		List<Map<String, Object>> reviewList = adminReviewService.reviewList(commandMap.getMap());
		Map<String, Object> count = adminReviewService.reviewCount(commandMap.getMap());
		
		SearchKeyword = request.getParameter("SearchKeyword");
		String str = request.getParameter("searchNum");
		if(str != null)searchNum =  Integer.parseInt(str);
		
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		totalCount = reviewList.size();
		
		if(SearchKeyword != null ) {
			if(searchNum == 0) {// 아이디로검색
				reviewList = adminReviewService.searchReviewList(commandMap.getMap()); 
				totalCount = reviewList.size();
			
			}else if(searchNum == 1) {//상품명으로 검색
				reviewList = adminReviewService.searchReviewList(commandMap.getMap()); 
				totalCount = reviewList.size();
			}
			
			page = new AdminQNAPaging(currentPage, totalCount, blockCount, blockPage, "/giftcon/adminReviewList.conn", searchNum, SearchKeyword);
			pagingHtml = page.getPagingHtml().toString();
			int lastCount = totalCount;
			
			if(page.getEndCount() < totalCount)
				lastCount = page.getEndCount()+1;
			
			reviewList = reviewList.subList(page.getStartCount(), lastCount);
			
			mv.addObject("Searchkeyword", SearchKeyword);
			mv.addObject("pagingHtml",pagingHtml);
			mv.addObject("reviewList",reviewList);
			mv.addObject("count", totalCount);
		}else {
			totalCount = reviewList.size();
			
			page = new AdminQNAPaging(currentPage, totalCount, blockCount, blockPage, "/giftcon/adminReviewList.conn");
			pagingHtml = page.getPagingHtml().toString();
			
			int lastCount = totalCount;
			
			if(page.getEndCount() < totalCount)
				lastCount = page.getEndCount()+1;
			
			reviewList =  reviewList.subList(page.getStartCount(), lastCount);
			
			mv.addObject("pagingHtml",pagingHtml);
			mv.addObject("reviewList",reviewList);
			mv.addObject("count", totalCount);
		}

		
		/*
		 * mv.addObject("searchNum",searchNum);
		 * mv.addObject("SearchKeyword",SearchKeyword);
		 */
//		System.out.println("reviewCount-------------"+ count.get("CNT"));
		return mv;
	}
	
	@RequestMapping("/adminReviewDelete.conn")
	public ModelAndView adminReviewDelete(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/adminReviewList.conn");
		adminReviewService.reviewDelete(commandMap.getMap());
		return mv;
	}
}
