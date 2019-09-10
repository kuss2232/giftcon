package share.conn.giftcon;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthenticationInterceptor extends HandlerInterceptorAdapter{

	//컨트롤러 보다 먼저 수행됨
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		//세션 받아와서 오브젝트 객체에 담아줌
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("MEMBER_ID");
		session.setMaxInactiveInterval(60*60);
		if(obj == null) {
			response.sendRedirect("/giftcon/loginForm.conn");
			return false;
			//컨트롤러로 더 이상 요청이 가지않게 false 반환
		}
		//return은 컨트롤러의 요청 uri로 가도 되는지를 허가하는 의미
		return true;
	}
	
	//컨트롤러가 수행된 후 화면이 보여지기 직전에 수행되는 메서드
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}

	
}
