package share.conn.Cart;

import share.conn.Paging.Paging;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import share.conn.giftcon.CommandMap;
import share.conn.Paging.Paging;

public class CartController {
	
	//페이징
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 5;
	private String pagingHtml;
	private Paging page;
	
	@Resource(name = "cartService")
	private CartService cartService;
	
	//장바구니에 같은 상품이 있는지 확인
	@RequestMapping(value = "/cart/cartCheck.conn")
	public boolean cartCheck(CommandMap commandMap,HttpServletRequest request) throws Exception {

		int count = cartService.cartCheck(commandMap.getMap());
		
		return (count == 1);
	}
	
	//장바구니 목록
	@RequestMapping(value = "/cart/cartlist.conn")
	public ModelAndView cartList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		
		if(request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		ModelAndView mv = new ModelAndView();
		
		List<Map<String, Object>> cartList = cartService.cartList(commandMap.getMap());
		
		totalCount = cartList.size();

		page = new Paging(currentPage, totalCount, blockCount, blockPage, "cartList");
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		cartList = cartList.subList(page.getStartCount(), lastCount);

		mv.addObject("totalCount", totalCount);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("currentPage", currentPage);

		mv.addObject("cartList", cartList);
		mv.setViewName("cartList");

		return mv;
	}
	
	//장바구니 수량 수정
	@RequestMapping(value = "/cart/cartAmountModify.conn")
	public void cartAmountModify(CommandMap commandMap, HttpServletRequest request) throws Exception {
		cartService.cartAmountModify(commandMap.getMap());
	}
	
	//장바구니 상품 전부 삭제
	@RequestMapping(value = "/cart/cartDeleteAll.conn")
	public void cartDeleteAll(CommandMap commandMap, HttpServletRequest request) throws Exception {
		cartService.cartDeleteAll(commandMap.getMap());
	}
	
	//장바구니 상품 선택 삭제
	@RequestMapping(value = "/cart/cartDelete.conn")
	public void cartDelete(CommandMap commandMap, HttpServletRequest request) throws Exception {
		cartService.cartDelete(commandMap.getMap());
	}
	
	//회원별 장바구니 전체 상품 수
	@RequestMapping(value = "/cart/cartCount.conn")
	public void cartCount(HttpServletRequest request) throws Exception {
		cartService.cartCount();
	}
	
	//회원별 장바구니 전체 상품 수
	@RequestMapping(value = "/cart/addOrderToCart.conn")
	public void addOrderToCart(CommandMap commandMap, HttpServletRequest request) throws Exception {
		cartService.addOrderToCart(commandMap.getMap());
	}
}
