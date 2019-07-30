package share.conn.adminQna;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import share.conn.Paging.Paging;
import share.conn.giftcon.CommandMap;

@Controller
public class AdminQnaController {
	
	@Resource(name ="adminQnaService")
	private AdminQnaService adminQnaService;
	
	private int totalCount;
	private int searchNum;
	private Integer categoryNum;
	private Integer repState;
	
	private String isSearch;
	private int currentPage = 1;
	private int blockCount = 10;
	private int blockPage = 10;
	private String pagingHtml;
	
	//Q&a목록
	@RequestMapping(value= "/admin/qna/adminQnaList")
	public ModelAndView adminQnaList(CommandMap commandMap, HttpServletRequest request )throws Exception{
		ModelAndView mv = new ModelAndView();
		
		
		
		
		
		
		
		
		
		
		
		
		
		return mv;
	}
	
	//Q&A 상세보기
	@RequestMapping(value = "/admin/qna/adminQnaDetail")
	public ModelAndView adminQnaDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView();
		Map<String, Object> qnaDetail = adminQnaService.qnaDetail(commandMap.getMap());
		
		mv.addObject("qnaDetail", qnaDetail);
		mv.setViewName("/admin/qna/adminQnaDetail");
		
		return mv;
	}
	
	//Q&A 답변달기
	@RequestMapping(value = "/adminQnaWrite.conn")
	public ModelAndView adminQnaWrite(CommandMap commandMap, HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		adminQnaService.writeComment(commandMap.getMap());
		mv.setViewName("redirect:/qna/adminQnaDetail?QNA_NUM="+ commandMap.get("QNA_NUM"));
		
		return mv;
	}
	
	//Q&A 답변수정
		@RequestMapping(value = "/adminQnaModify.conn")
		public ModelAndView adminQnaModify(CommandMap commandMap)throws Exception{
			ModelAndView mv = new ModelAndView();
			
			adminQnaService.updateReply(commandMap.getMap());
			mv.setViewName("redirect:/qna/adminQnaDetail?QNA_NUM="+ commandMap.get("QNA_NUM"));
			
			return mv;
		}
		
	//Q&A 답변삭제
	@RequestMapping(value = "/adminQnaReplyDelete")
	public ModelAndView adminQnaReplyDelete(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		adminQnaService.deleteReply(commandMap.getMap());
		mv.setViewName("redirect:/qna/adminQnaDetail?QNA_NUM = "+commandMap.get("QNA_NUM"));
		
		return mv;
	}

	
}
