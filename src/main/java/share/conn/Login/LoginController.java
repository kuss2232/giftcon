package share.conn.Login;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import share.conn.giftcon.CommandMap;

@Controller
public class LoginController {

	@Resource(name = "loginService")
	private LoginService loginService;
	
	//로그인 화면이동
	@RequestMapping("/loginForm.conn")
	public ModelAndView loginForm() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/login/loginForm");
		return mv;
	}

	@RequestMapping("/login.conn")
	public ModelAndView loginComplete(CommandMap commandMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = request.getSession();
		
		System.out.println("아이디"+ commandMap.get("MEMBER_ID"));
		
		Map<String, Object> check = loginService.loginGo(commandMap.getMap());
						// 아이디로 멤버 정보 꺼내온값
		if(check == null) { // 아이디에 일치하는 값이 없으면
			mv.setViewName("/login/loginForm");
			mv.addObject("message", "존재하지 않는 아이디입니다.");
			return mv;
		}else { //아이디에 맞는 값이 존재할경우
			
			System.out.println("사용자입력 비번 : "+ commandMap.get("MEMBER_PASSWD") +"\n DB에서 가져온 비번 :"+check.get("MEMBER_PASSWD"));
			
			//입력 비번과 DB비밀번호가 같으면
			if((check.get("MEMBER_PASSWD")).equals(commandMap.get("MEMBER_PASSWD"))) 
			{
				
				if(commandMap.get("saveId") != null) { 
					Cookie setCookie = new Cookie("userInputId", (String)commandMap.get("MEMBER_ID")); // 쿠키 이름을 name으로 생성 
					setCookie.setMaxAge(60*60*24*7); // 기간을 하루로 지정
					response.addCookie(setCookie); 
				} 
				else 
				{ 
					Cookie delCookie = new Cookie("userInputId", null); // choiceCookieName(쿠키 이름)에 대한 값을 null로 지정
					delCookie.setMaxAge(0); // 유효시간을 0으로 설정 response.addCookie(delCookie); // 응답 헤더에 추가해서 없어지도록 함 
				}
				
				session.setAttribute("MEMBER_ID", commandMap.get("MEMBER_ID"));
				//세션에 멤버아이디 띄움
				mv.addObject("MEMBER",check);//로그인한 member정보 main에 보내줌
				mv.setViewName("/main/main");
				return mv;
			
			}else { // 비밀번호가 일치하지않을 때
				mv.setViewName("/login/loginForm");
				mv.addObject("message", "비밀번호를 확인하시기 바랍니다.");
				return mv;
			}
		} 
	}
	
	@RequestMapping("/logout.conn")
	public ModelAndView logout(HttpServletRequest request, CommandMap commadMap) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession(false);
		//HttpSession이 존재하면 현재 HttpSession을 반환하고 존재하지 않으면 새로이 생성하지 않고 그냥 null을 반환합니다
		
		if(session != null) {
			session.invalidate();
			//세션 무효화
		}
		mv.setViewName("redirect:/main.conn");
		return mv;
		
	}
	//아이디 찾기---------------------------------------------
	@RequestMapping("/findIdForm.conn")
	public ModelAndView findIdForm() {
		ModelAndView mv = new ModelAndView("/login/findIdForm");
		return mv;
	}
	
	@RequestMapping("/findId.conn")
	public ModelAndView findId(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		Map<String, Object> map = loginService.findId(commandMap.getMap());
		mv.addObject("MEMBER",map);
		mv.setViewName("/login/findedId");
		return mv;
	}
	
	//비밀번호 찾기 & 변경 ---------------------------------------
	@RequestMapping("/findPwForm.conn")
	public ModelAndView findPwForm() {
		ModelAndView mv = new ModelAndView("/login/findPwForm");
		return mv;
	}
	//이름 id 비밀번호 값 확인
	@RequestMapping("chgPwform.conn")
	public ModelAndView chgPw(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView();
		Map<String, Object> map = loginService.findPwd(commandMap.getMap());
		System.out.println("DB에서 가져온 PW : "+ map.get("MEMBER_PASSWD"));
		mv.addObject("map", map);
		/*
		 * mv.addObject("MEMBER_ID", map.get("MEMBER_ID")); mv.addObject("MEMBER_NAME",
		 * map.get("MEMBER_NAME")); mv.addObject("MEMBER_EMAIL",
		 * map.get("MEMBER_EMAIL"));
		 */
		mv.setViewName("/login/chgPwForm");
		return mv;
	}
	
	
	@RequestMapping("/chgPw.conn")
	public @ResponseBody Map<String, String> findPw(CommandMap commandMap) throws Exception {
		Map<String, String> data = new HashMap<String, String>();
		System.out.println("id" + commandMap.get("MEMBER_ID"));
		try {
			loginService.chgPw(commandMap.getMap());
			data.put("result", "SUCCESS");
		}catch(Exception e){
			e.printStackTrace();
			data.put("result", "");
		}
		
		return data;
	}
}
