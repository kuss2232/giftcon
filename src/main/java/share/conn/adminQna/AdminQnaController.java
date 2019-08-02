package share.conn.adminQna;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import share.conn.Paging.Paging;
import share.conn.giftcon.CommandMap;

@Controller
public class AdminQnaController {
	
	@Resource(name ="adminQnaService")
	private AdminQnaService adminQnaService;
	
	private String SearchKeyword;
	
	private int totalCount;
	private int searchNum;
	private Integer categoryNum;
	private Integer repState;
	
	private String isSearch;
	private int currentPage = 1;
	private int blockCount = 10;
	private int blockPage = 10;
	private String pagingHtml;
	
	private Paging page;
	
	//Q&a목록
	@RequestMapping(value= "/adminQnaList.conn")
	public ModelAndView adminQnaList(CommandMap commandMap, HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<Map<String, Object>> adQnaList = adminQnaService.qnaList(commandMap.getMap());
		Iterator it = adQnaList.iterator();
		while(it.hasNext()) {
			System.out.println("qna : "+((Map)it.next()).get("QNA_NUM"));
		}
		
		
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		totalCount = adQnaList.size();
		SearchKeyword = request.getParameter("SearchKeyword");
		
		if (SearchKeyword != null) {
			searchNum = Integer.parseInt(request.getParameter("searchNum"));
			
			if(searchNum == 0) {
				commandMap.put("SearchKeyword", SearchKeyword);
				adQnaList = adminQnaService.qnaIdSearch(commandMap.getMap());
				totalCount = adQnaList.size();
			}else if(searchNum == 1) {
				commandMap.put("SearchKeyword", SearchKeyword);
				adQnaList = adminQnaService.qnaTitleSearch(commandMap.getMap());
				totalCount = adQnaList.size();
			}
		}
		mv.addObject("Searchkeyword", SearchKeyword);
		mv.addObject("adQnaList",adQnaList);
		mv.setViewName("admin/Qna/adminQnaList");
		
		return mv;
	}
	
	//Q&A 상세보기
	@RequestMapping(value = "/adminQnaDetail.conn")
	public ModelAndView adminQnaDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView();
		Map<String, Object> qnaDetail = adminQnaService.qnaDetail(commandMap.getMap());
		
		mv.addObject("qnaDetail", qnaDetail);
		mv.setViewName("/admin/Qna/adminQnaDetail");
		
		return mv;
	}
	

	
	// Q&A 답변달기 폼
	@RequestMapping(value = "/adminQnaReplyForm.conn")
	public ModelAndView adminQnaReplyForm(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println("adad" + request.getParameter("QNA_NUM"));
		if (request.getParameter("QNA_NUM") != null) {
			commandMap.put("QNA_NUM", request.getParameter("QNA_NUM"));
			Map<String, Object> qnaDetail = adminQnaService.qnaDetail(commandMap.getMap());
			mv.addObject("qnaDetail", qnaDetail);
		}
		mv.setViewName("admin/Qna/adminQnaWrite");
		return mv;
	}
	
	
	
	//Q&A 답변수정
		@RequestMapping(value = "/adminQnaUpdate.conn")
		public ModelAndView adminQnaModify(CommandMap commandMap, HttpServletRequest request)throws Exception{
			ModelAndView mv = new ModelAndView();
			
			System.out.println("QNA_NUM : " + commandMap.get("QNA_NUM"));
			System.out.println("QNA_COMMENT : " + request.getParameter("QNA_COMMENT"));
			commandMap.put("QNA_COMMENT", request.getParameter("QNA_COMMENT"));
			adminQnaService.updateReply(commandMap.getMap());
			
			mv.addObject("QNA_NUM",commandMap.get("QNA_NUM"));
			mv.setViewName("redirect:/adminQnaDetail.conn");
			
			return mv;
		}
		
	//Q&A 답변삭제
	@RequestMapping(value = "/adminQnaReplyDelete.conn")
	public ModelAndView adminQnaReplyDelete(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println(commandMap.get("QNA_NUM"));
		adminQnaService.deleteReply(commandMap.getMap());
		mv.setViewName("redirect:/adminQnaList.conn");
		
		return mv;
	}

	
}
