package share.conn.Main;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import share.conn.Goods.GoodsService;
import share.conn.Paging.Paging;
import share.conn.giftcon.CommandMap;

@Controller
public class MainController {
	
	@Resource(name="mainService")
	private MainService mainService;
	
	@Resource(name="goodsService")
	private GoodsService goodsService;
	
	private int currentPage = 1;
	private int blockCount = 4;
	private int blockPage = 1;
	private Paging page;
	
	@RequestMapping("/main.conn")
	public ModelAndView mainList(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<Map<String, Object>> bestList = mainService.GoodsBestList();
		List<Map<String, Object>> saleList = mainService.GoodsSaleList1();
		List<Map<String, Object>> smallcategoryList = goodsService.smallCategoryList();

		int totalCount = 8;
		page = new Paging(currentPage, totalCount, blockCount, blockPage, "main.conn");
		int lastCount = totalCount;
		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;
		bestList = bestList.subList(page.getStartCount(), lastCount);
		saleList = saleList.subList(page.getStartCount(), lastCount);

		mv.addObject("smallcategoryList", smallcategoryList);
		mv.addObject("bestList", bestList);
		mv.addObject("saleList", saleList);
		
		mv.setViewName("/main/main");
		return mv;
	}
}
