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

import share.conn.Paging.GoodsPaging;
import share.conn.Review.ReviewService;
import share.conn.giftcon.CommandMap;

@Controller
public class GoodsController {
	
	public static final int pagingSet = 5;
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 16;
	private int blockPage = 10;
	private String pagingHtml;
	private GoodsPaging page;
	//페이징 숫자
	
	@Resource(name="goodsService")
	private GoodsService goodsService;
	
	@Resource(name="reviewService")
	private ReviewService reviewService;
	
	
	@RequestMapping("/goods/category.conn")
	public ModelAndView categoryList(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<Map<String, Object>> smallcategoryList = goodsService.smallCategoryList();
		mv.addObject("smallcategoryList", smallcategoryList);
		mv.setViewName("goods/category");
		return mv;
	}
	
	@RequestMapping("/goods/list.conn")
	public ModelAndView goodscategoryList(CommandMap Map)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int goodsCount = goodsService.goodsCount();
		List<Map<String, Object>> goodsList = goodsService.goodsList();
		List<Map<String, Object>> smallcategoryList = goodsService.smallCategoryList();
		
		mv.addObject("goodsCount", goodsCount);
		mv.addObject("smallcategoryList", smallcategoryList);
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
		System.out.println();
		mv.addObject("reviewDetail", reviewDetail);
		mv.addObject("MEMBER_ID",session.getAttribute("MEMBER_ID"));
		mv.addObject("goodsDetail", goodsDetail);
		mv.setViewName("goods/goodsDetail");		
		
		return mv;
	}
	
	
	
	

}
