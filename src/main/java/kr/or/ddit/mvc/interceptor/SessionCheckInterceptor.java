package kr.or.ddit.mvc.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import rb.cmm.vo.MemberVO;


public class SessionCheckInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 사용자가 정상적으로 접속 했는지 체크
		// LoginController 컨트롤러를 통해 정상적으로 접속 했을 경우
		// SESSION에 S_MEMBER 속성이 존재해야함
		
		HttpSession session = request.getSession();
		MemberVO memberVo = (MemberVO)session.getAttribute("S_MEMBER");
		
		// 로그인 페이지로 이동
		if(memberVo == null) {
			response.sendRedirect("/login/view");
			return false;
		}
		
		return true;
	}
	
}
