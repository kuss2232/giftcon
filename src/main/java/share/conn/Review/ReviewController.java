package share.conn.Review;

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
	
	//현재 진행 불가
	
}
