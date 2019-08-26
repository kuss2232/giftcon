package share.conn.Qna;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import share.conn.Paging.AdminQNAPaging;
import share.conn.Paging.Paginate;
import share.conn.giftcon.CommandMap;


@Controller
public class QnaController {

	@Resource(name="qnaService")
	private QnaService qnaService;

	// 검색, 페이징
	private int searchNum;
	private int categoryNum;
	private String SearchKeyword;

	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 15;
	private int blockPage = 15;
	private String pagingHtml;
	private Paginate page;

	private int ref;


	@RequestMapping("/mypage/qna/insertform.conn")
	public ModelAndView insertform(HttpServletRequest request)  throws Exception {
		ModelAndView mv = new ModelAndView("mypage/qnainsert");
		mv.addObject("MEMBER_ID",request.getSession().getAttribute("MEMBER_ID"));
		return mv;
	}

	@RequestMapping(value = "/mypage/qna/insert.conn")
	public void insert(CommandMap commandMap, HttpServletResponse response, HttpServletRequest request, HttpSession session) throws Exception {
		System.out.println(session.getAttribute("MEMBER_NUM") + "--------------------------------------------------");
		commandMap.getMap().put("MEMBER_NUM", session.getAttribute("MEMBER_NUM").toString());
		if(commandMap.get("QNA_FILE") == null)
		{
			commandMap.put("QNA_FILE", "NONE");
		}
		qnaService.insertQna(commandMap.getMap());
		PrintWriter out = response.getWriter();
	}
	//Q&A 목록
	@RequestMapping(value = "/mypage/qnalist.conn")
	public ModelAndView qnalist(CommandMap commandMap, HttpSession session, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView();

		String mem_num = session.getAttribute("MEMBER_NUM").toString();
		commandMap.getMap().put("MEMBER_NUM", mem_num);

		List<Map<String, Object>> qnaList = qnaService.qnaList(commandMap.getMap());

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		totalCount = qnaList.size();
		SearchKeyword = request.getParameter("SearchKeyword");

		if (SearchKeyword != null) {
			searchNum = Integer.parseInt(request.getParameter("searchNum"));
			SearchKeyword = request.getParameter("SearchKeyword");

			if(searchNum == 0) {
				commandMap.put("SearchKeyword", SearchKeyword);
				qnaList = qnaService.qnaIdSearch(commandMap.getMap());
				totalCount = qnaList.size();
			}else if(searchNum == 1) {
				commandMap.put("SearchKeyword", SearchKeyword);
				qnaList = qnaService.qnaTitleSearch(commandMap.getMap());
				totalCount = qnaList.size();
			}
			page = new Paginate(currentPage, totalCount, blockCount, blockPage, "/mypage/qnalist.conn", searchNum, SearchKeyword);
			pagingHtml = page.getPagingHtml().toString();
			System.out.println("aaaaa"+pagingHtml);
			int lastCount = totalCount;

			if(page.getEndCount() < totalCount)
				lastCount = page.getEndCount() +1;

			qnaList = qnaList.subList(page.getStartCount(), lastCount);
			mv.addObject("Searchkeyword", SearchKeyword);
			mv.addObject("qnaList", qnaList);
			mv.addObject("pagingHtml",pagingHtml);
			mv.setViewName("mypage/qnalist");
			return mv;
		}else {
			totalCount = qnaList.size();

			page = new Paginate(currentPage, totalCount, blockCount, blockPage, "/mypage/qnalist.conn");
			pagingHtml = page.getPagingHtml().toString();

			int lastCount = totalCount;

			if(page.getEndCount() < totalCount)
				lastCount = page.getEndCount() +1;

			qnaList = qnaList.subList(page.getStartCount(), lastCount);

			System.out.println(pagingHtml.toString());
			mv.addObject("Searchkeyword", SearchKeyword);
			mv.addObject("qnaList", qnaList);
			mv.addObject("pagingHtml",pagingHtml);
			mv.setViewName("mypage/qnalist");
			return mv;
		}
	}
}
