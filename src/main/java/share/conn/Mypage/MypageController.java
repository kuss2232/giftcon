package share.conn.Mypage;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import share.conn.Qna.QnaService;
import share.conn.Review.ReviewService;
import share.conn.giftcon.CommandMap;
import share.conn.Paging.AdminQNAPaging;
import share.conn.Paging.Paging;

@Controller
public class MypageController {
	
	@Resource(name="mypageService")
	private MypageService mypageService;
	
	@Resource(name="qnaService")
	private QnaService qnaService;
	
	@Resource(name="reviewService")
	private ReviewService reviewService;
	
	private int totalCount;
	private int searchNum;
	private String SearchKeyword;
	
	private int currentPage;
	private int blockCount = 10;
	private int blockPage = 5;
	private String pagingHtml;
	private Paging page;
	@RequestMapping("/mypage.conn")
	public ModelAndView mypage() {
		ModelAndView mv = new ModelAndView("/mypage/userPwCheck");
		return mv;
	}
	
	//회원 비밀번호 확인 후 회원 정보 페이지 이동
	@RequestMapping("/userCheckPw.conn")
	public ModelAndView userCheckPw(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		//멤버에서 id,pw로 회원 확인 admin값 가져옴
		HttpSession session = request.getSession();
		String mem_Id = (String)session.getAttribute("MEMBER_ID");
		commandMap.put("MEMBER_ID", mem_Id);
		Map<String, Object> check = mypageService.userCheckPw(commandMap.getMap());
		
		//없음
		if(check == null) {
			mv.setViewName("redirect:/mypage.conn");
			return mv;
		}else {
		//있음
			if(check.get("MEMBER_ADMIN").equals(0)) {
				//멤버가 어드민일경우 
				mv.setViewName("redirect:/adminMain.conn");
				return mv;
			}else {
				//회원일 경우
				
				Map<String, Object> member = mypageService.userDetail(commandMap.getMap());
				if(member.get("MEMBER_EMAIL") != null) {
					String email = (String)member.get("MEMBER_EMAIL");
					String e_ad = email.substring(email.lastIndexOf("@")+1);
					email = email.substring(0,email.lastIndexOf("@"));
					System.out.println("email : "+ email + "@" + e_ad);
					
					member.put("MEMBER_EMAIL1", email);
					member.put("MEMBER_EMAIL2", e_ad);
				}
						
				mv.addObject("MEMBER", member);
				mv.setViewName("/mypage/userDetail");
				return mv;
			}
			
		}
	}
	
	//회원 정보 수정
	@RequestMapping("userInfoUpdate.conn")
	public ModelAndView userInfoUpdate(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView();
		String member_email = (String)commandMap.get("MEMBER_EMAIL1") + "@" +(String)commandMap.get("MEMBER_EMAIL2");
		System.out.println(member_email);
		commandMap.put("MEMBER_EMAIL", member_email);
		HttpSession memId = request.getSession();
		commandMap.put("MEMBER_ID", memId.getAttribute("MEMBER_ID"));
		mypageService.userInfoUpdate(commandMap.getMap());
		
		mv.setViewName("redirect:/mypage.conn");
		return mv;
	}
	
	//비밀번호 변경
	@RequestMapping("userPwChgForm.conn")
	public ModelAndView userPwChgForm(CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView("/mypage/userPwChgForm");
		mv.addObject("MEMBER_ID", session.getAttribute("MEMBER_ID"));
		return mv;
	}
	
	//회원 비밀번호 변경
	@RequestMapping("userPwUpdate.conn")
	public ModelAndView userPwUpdate(CommandMap commandMap) throws Exception{
		
		mypageService.userPwUpdate(commandMap.getMap());
		ModelAndView mv = new ModelAndView("redirect:/mypage.conn");
		return mv;
	}
	
	@RequestMapping("userSecession.conn")
	public ModelAndView userSecession(CommandMap commandMap, HttpServletRequest request) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		HttpSession memId = request.getSession();
		commandMap.put("MEMBER_ID", memId.getAttribute("MEMBER_ID"));
		mypageService.userSecession(commandMap.getMap());
		
		mv.setViewName("redirect:/logout.conn");
		return mv;
	}
	
	//Q&A리스트 
	@RequestMapping("/myQnalist.conn")
	public ModelAndView qnalist(CommandMap commandMap, HttpSession session,HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView();
		commandMap.getMap().put("MEMBER_NUM", session.getAttribute("MEMBER_NUM"));
		
		List<Map<String, Object>> qnaList = qnaService.qnaList(commandMap.getMap());
			
		totalCount = qnaList.size();
		
		mv.addObject("totalCount",totalCount);
		mv.addObject("qnaList", qnaList);
		mv.setViewName("mypage/myQna");
		return mv;
	}
	
	//상품후기
	@RequestMapping(value="/goods/reviewInsert.conn")
	public void reviewInsert(CommandMap commandMap, HttpServletRequest request, HttpServletResponse response) throws Exception{
		System.out.println(commandMap.get("MEMBER_ID"));
		reviewService.insertReview(commandMap.getMap());
	}
}
