package share.conn.Review;

import share.conn.Paging.Paging;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import share.conn.giftcon.CommandMap;
import share.conn.Paging.Paging;

public class ReviewController {
	
	//페이징
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 5;
	private String pagingHtml;
	private Paging page;
	
	@Resource(name = "reviewService")
	private ReviewService reviewService;
	
	
	//리뷰등록
	@RequestMapping(value = "/reviewWrite")
	public ModelAndView reviewWrite(CommandMap commandMap, HttpServletRequest request, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:detail.conn?GOODS_NUM="+commandMap.get("GOODS_NUM"));
		commandMap.getMap().put("MEMBER_NUM", session.getAttribute("MEMBER_NUM").toString());
		System.out.println("param:" + commandMap.getMap());
		reviewService.insertReview(commandMap.getMap());
		
		return mv;
	}
	
	
}
