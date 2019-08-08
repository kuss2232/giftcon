package share.conn.Goods;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import share.conn.Paging.Paging;
import share.conn.giftcon.CommandMap;
import share.conn.Review.ReviewService;

@Controller
public class GoodsController {
	
	private int SearchNum = 1;
	private String SearchKeyword;
	
	private int currentPage;
	private int blockCount = 20;
	private int blockPage = 5;
	private String pagingHtml;
	private Paging page;
	//페이징 숫자
	
	@Resource(name="goodsService")
	private GoodsService goodsService;
	
	@Resource(name="reviewService")
	private ReviewService reviewService;
	
	@RequestMapping("/goods/category.conn")
	public ModelAndView categoryList(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<Map<String, Object>> smallcategoryList = goodsService.smallCategoryList();
		int count = smallcategoryList.size();
		
		mv.addObject("count", count);
		mv.addObject("smallcategoryList", smallcategoryList);
		mv.setViewName("goods/category");
		return mv;
	}
	
	@RequestMapping("/goods/list.conn")
	public ModelAndView goodsList(CommandMap map, HttpServletRequest request 
			)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<Map<String, Object>> goodsList;
		String[] category = request.getParameterValues("category");
		List<Map<String, Object>> smallcategoryList = goodsService.smallCategoryList();
		
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		if (category != null) { //카테고리별
			goodsList = goodsService.smallCategorygoodsList(category);
		} else { //전체
			goodsList = goodsService.goodsList();
		}
		
		int goodsCount = goodsList.size();
		page = new Paging(currentPage, goodsCount, blockCount, blockPage, "list.conn");
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = goodsCount;
		if (page.getEndCount() < goodsCount)
			lastCount = page.getEndCount() + 1;
		goodsList = goodsList.subList(page.getStartCount(), lastCount);

		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("currentPage", currentPage);
		mv.addObject("goodsCount", goodsCount);
		mv.addObject("smallcategoryList", smallcategoryList);
		mv.addObject("category", category);
		mv.addObject("goodsList", goodsList);
		mv.setViewName("goods/list");
		return mv;
	}
	
	@RequestMapping("/goods/searchList.conn")
	public ModelAndView searchList(CommandMap map, HttpServletRequest request 
			)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<Map<String, Object>> goodsList;
		String[] category = request.getParameterValues("category");
		List<Map<String, Object>> smallcategoryList = goodsService.smallCategoryList();
		
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		SearchKeyword = request.getParameter("SearchKeyword");
		goodsList = goodsService.searchGoods(map.getMap());

		int goodsCount = goodsList.size();
		page = new Paging(currentPage, goodsCount, blockCount, blockPage, "searchList.conn", SearchNum, SearchKeyword);
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = goodsCount;
		if (page.getEndCount() < goodsCount)
			lastCount = page.getEndCount() + 1;
		goodsList = goodsList.subList(page.getStartCount(), lastCount);

		mv.addObject("SearchKeyword", SearchKeyword);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("currentPage", currentPage);
		mv.addObject("goodsCount", goodsCount);
		mv.addObject("smallcategoryList", smallcategoryList);
		mv.addObject("category", category);
		mv.addObject("goodsList", goodsList);
		mv.setViewName("goods/list");
		return mv;
	}
	
	@RequestMapping("/goods/hotList.conn") //인기순, 많이 본 순
	public ModelAndView goodsHotList(CommandMap map, HttpServletRequest request 
			)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<Map<String, Object>> goodsList;
		String[] category = request.getParameterValues("category");
		List<Map<String, Object>> smallcategoryList = goodsService.smallCategoryList();
		
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		if (category != null) { //카테고리별
			goodsList = goodsService.categoryGoodsBest(category);
		} else { //전체
			goodsList = goodsService.goodsBestList();
		}
		
		int goodsCount = goodsList.size();
		page = new Paging(currentPage, goodsCount, blockCount, blockPage, "hotList.conn");
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = goodsCount;
		if (page.getEndCount() < goodsCount)
			lastCount = page.getEndCount() + 1;
		goodsList = goodsList.subList(page.getStartCount(), lastCount);

		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("currentPage", currentPage);
		mv.addObject("goodsCount", goodsCount);
		mv.addObject("smallcategoryList", smallcategoryList);
		mv.addObject("category", category);
		mv.addObject("goodsList", goodsList);
		mv.setViewName("goods/list");
		return mv;
	}
	
	@RequestMapping("/goods/gradeList.conn") // 평점 높은 순
	public ModelAndView goodsGradeList(CommandMap map, HttpServletRequest request 
			)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<Map<String, Object>> goodsList;
		String[] category = request.getParameterValues("category");
		List<Map<String, Object>> smallcategoryList = goodsService.smallCategoryList();
		
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		if (category != null) { //카테고리별
			goodsList = goodsService.categoryGoodsGrade(category);
		} else { //전체
			goodsList = goodsService.goodsGrade();
		}
		int goodsCount = goodsList.size();
		page = new Paging(currentPage, goodsCount, blockCount, blockPage, "gradeList.conn");
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = goodsCount;
		if (page.getEndCount() < goodsCount)
			lastCount = page.getEndCount() + 1;
		goodsList = goodsList.subList(page.getStartCount(), lastCount);

		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("currentPage", currentPage);
		mv.addObject("goodsCount", goodsCount);
		mv.addObject("smallcategoryList", smallcategoryList);
		mv.addObject("category", category);
		mv.addObject("goodsList", goodsList);
		mv.setViewName("goods/list");
		return mv;
	}
	
	@RequestMapping("/goods/lowList.conn") // 낮은 가격순
	public ModelAndView goodsLowList(CommandMap map, HttpServletRequest request 
			)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<Map<String, Object>> goodsList;
		String[] category = request.getParameterValues("category");
		List<Map<String, Object>> smallcategoryList = goodsService.smallCategoryList();
		
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		if (category != null) { //카테고리별
			goodsList = goodsService.goodsSaleCategoryList2(category);
		} else { //전체
			goodsList = goodsService.goodsSaleList2();
		}
		int goodsCount = goodsList.size();
		page = new Paging(currentPage, goodsCount, blockCount, blockPage, "lowList.conn");
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = goodsCount;
		if (page.getEndCount() < goodsCount)
			lastCount = page.getEndCount() + 1;
		goodsList = goodsList.subList(page.getStartCount(), lastCount);

		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("currentPage", currentPage);
		mv.addObject("goodsCount", goodsCount);
		mv.addObject("smallcategoryList", smallcategoryList);
		mv.addObject("category", category);
		mv.addObject("goodsList", goodsList);
		mv.setViewName("goods/list");
		return mv;
	}
	
	@RequestMapping("/goods/highList.conn") // 높은 가격순
	public ModelAndView goodsHighList(CommandMap map, HttpServletRequest request 
			)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<Map<String, Object>> goodsList;
		String[] category = request.getParameterValues("category");
		List<Map<String, Object>> smallcategoryList = goodsService.smallCategoryList();
		
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		if (category != null) { //카테고리별
			goodsList = goodsService.goodsSaleCategoryList1(category);
		} else { //전체
			goodsList = goodsService.goodsSaleList1();
		}
		int goodsCount = goodsList.size();
		page = new Paging(currentPage, goodsCount, blockCount, blockPage, "highList.conn");
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = goodsCount;
		if (page.getEndCount() < goodsCount)
			lastCount = page.getEndCount() + 1;
		goodsList = goodsList.subList(page.getStartCount(), lastCount);

		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("currentPage", currentPage);
		mv.addObject("goodsCount", goodsCount);
		mv.addObject("smallcategoryList", smallcategoryList);
		mv.addObject("category", category);
		mv.addObject("goodsList", goodsList);
		mv.setViewName("goods/list");
		return mv;
	}
	
	@RequestMapping(value = "/goods/detail.conn")
	public ModelAndView goodsDetail(CommandMap commandMap, HttpServletResponse response, HttpServletRequest request,
	         HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		System.out.println(commandMap.get("GOODS_NUM"));
		Map<String, Object> goodsDetail = goodsService.goodsDetail(commandMap.getMap());
		List<Map<String, Object>> reviewDetail = reviewService.searchReview(commandMap.getMap());
		
		mv.addObject("reviewDetail", reviewDetail);
		mv.addObject("MEMBER_ID",session.getAttribute("MEMBER_ID"));
		mv.addObject("goodsDetail", goodsDetail);
		mv.setViewName("goods/goodsDetail");		
		
		return mv;
	}
	
	

}
