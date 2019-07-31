package share.conn.Qna;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import share.conn.giftcon.CommandMap;


@Controller
public class QnaController {
	
	@Resource(name="qnaService")
	private QnaService qnaService;
	
	
	@RequestMapping("/mypage/qna/insertform.conn")
	public ModelAndView insertform(HttpServletRequest request)  throws Exception {
		ModelAndView mv = new ModelAndView("mypage/qnainsert");
		mv.addObject("MEMBER_ID",request.getSession().getAttribute("MEMBER_ID"));
		return mv;
	}
	
	@RequestMapping(value = "/mypage/qna/insert.conn")
	public ModelAndView insert(CommandMap commandMap, HttpServletRequest request, HttpSession session) throws Exception {
		commandMap.getMap().put("MEMBER_NUM", session.getAttribute("MEMBER_NUM").toString());
		qnaService.insertQna(commandMap.getMap());
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/mypage/qnalist.conn");
		return mv;
	}
	
	@RequestMapping("/mypage/qnalist.conn")
	public ModelAndView qnalist(CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		String mem_num = session.getAttribute("MEMBER_NUM").toString();
		commandMap.getMap().put("MEMBER_NUM", mem_num);
		List<Map<String, Object>> qnaList = qnaService.qnaList(commandMap.getMap());
		mv.addObject("qnaList", qnaList);

		mv.setViewName("mypage/qnalist");
		return mv;
	}
	
}
