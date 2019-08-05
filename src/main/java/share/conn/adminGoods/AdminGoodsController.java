package share.conn.adminGoods;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import share.conn.giftcon.CommandMap;
import share.conn.Paging.Paging;

@Controller
public class AdminGoodsController {

	@Resource(name = "adminGoodsService")
	private AdminGoodsService adminGoodsService;
	
	//페이징 변수
	private int searchNum;
	private String isSearch;
	
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 20;
	private int blockPage = 10;
	private String pagingHtml;
	private Paging page;

	// 상품 목록 불러오기
	@RequestMapping(value = "/goods/adminGoodsList.conn")
	public ModelAndView adminGoodsList(CommandMap commandMap, HttpServletRequest request) throws Exception {

		if(request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		}else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		ModelAndView mv = new ModelAndView("adGoodsList");

		List<Map<String, Object>> adGoodsList = adminGoodsService.adGoodsList();
		
		if(request.getParameter("isSearch") != null) {
			isSearch = request.getParameter("isSearch");
			searchNum = Integer.parseInt(request.getParameter("searchNum"));
			
			if(searchNum == 0) //상품 번호
				adGoodsList = adminGoodsService.adGoodsNumSearch(isSearch);
			else if(searchNum == 1) // 상품명
				adGoodsList = adminGoodsService.adGoodsNameSearch(isSearch);
			else if(searchNum == 2) // 브랜드명
				adGoodsList = adminGoodsService.adGoodsCategory2Search(isSearch);
			
			totalCount = adGoodsList.size();
			page = new Paging(currentPage, totalCount, blockCount, blockPage, "adGoodsList", searchNum, isSearch);
			pagingHtml = page.getPagingHtml().toString();
			
			int lastCount = totalCount;
			
			if(page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;
			
			adGoodsList = adGoodsList.subList(page.getStartCount(), lastCount);
			
			mv.addObject("isSearch", isSearch);
			mv.addObject("searchNum", searchNum);
			mv.addObject("totalCount", totalCount);
			mv.addObject("pagingHtml", pagingHtml);
			mv.addObject("currentPage", currentPage);
			mv.addObject("adGoodsList", adGoodsList);
			mv.setViewName("/admin/Goods/admin_goodsList");
			return mv;
		}
		
		totalCount = adGoodsList.size();
		
		page = new Paging(currentPage, totalCount, blockCount, blockPage, "adGoodsList");
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if(page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;
		
		adGoodsList = adGoodsList.subList(page.getStartCount(), lastCount);
		
		mv.addObject("totalCount", totalCount);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("currentPage", currentPage);
		

		mv.addObject("adGoodsList", adGoodsList);
		Integer count = adminGoodsService.adAllGoodsNum();
		int a = (int) count;
		mv.addObject("count", a);
		mv.setViewName("/admin/Goods/admin_goodsList");

		return mv;
	}
	
	// 상품 등록폼으로 이동
	@RequestMapping(value = "/goods/goodsInsertForm.conn")
	public ModelAndView goodsInsertForm() {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/Goods/admin_InsertGoods");

		return mv;
	}
		
	// 상품 등록
	@RequestMapping(value = "/goods/adminInsertGoods.conn")
	public ModelAndView adGoodsinsert(CommandMap commandMap, HttpServletRequest request) throws Exception {

		 ModelAndView mv = new ModelAndView("redirect:/goods/adminGoodsList.conn");
	      
	      adminGoodsService.adGoodsinsert(commandMap.getMap(), request);

	      return mv;

	}
	// 상품 수정폼으로 이동
	@RequestMapping(value = "/goods/goodsModifyForm")
	public ModelAndView goodsModifyForm(CommandMap commandMap) throws Exception {

		ModelAndView mv = new ModelAndView("goodsModifyForm");

		List<Map<String, Object>> goodsDetail = adminGoodsService.modifyGoodsForm(commandMap.getMap());
		mv.addObject("goodsDetail", goodsDetail);
		Map<String, Object> goodsBasic = goodsDetail.get(0);

		mv.addObject("goodsBasic", goodsBasic);
			
		if (goodsBasic.get("GOODS_SALEDATE") != null) {
				Date from = new Date();
				from = (Date) goodsBasic.get("GOODS_SALEDATE");
				SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
				String to = transFormat.format(from);
				mv.addObject("SALEDATE", to);
		}

		List<Map<String, Object>> goodsImage = adminGoodsService.modifyGoodsFormImage(commandMap.getMap());
		mv.addObject("goodsImage", goodsImage);

		return mv;
	}
	
	// 상품 수정
	@RequestMapping(value = "/goods/adminGoodsModify.conn")
	public ModelAndView adGoodsModify(CommandMap commandMap, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("redirect:/goods/adminGoodsList.conn");

		adminGoodsService.adGoodsModify(commandMap.getMap(), request);

		return mv;
	}

	// 상품 삭제
	@RequestMapping(value = "/goods/adminGoodsDelete.conn")
	public ModelAndView adGoodsDelete(CommandMap commandMap) throws Exception {

		ModelAndView mv = new ModelAndView("redirect:/goods/adminGoodsList.conn");

		adminGoodsService.adGoodsDelete(commandMap.getMap());

		return mv;
	}
	
}
