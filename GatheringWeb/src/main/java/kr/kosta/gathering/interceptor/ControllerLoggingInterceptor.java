package kr.kosta.gathering.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.kosta.gathering.member.domain.Member;
import kr.kosta.gathering.member.domain.UserInfo;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class ControllerLoggingInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object obj) throws Exception {
		
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>> preHandler <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");

		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute(UserInfo.LOGIN_INFO);
		
		if(null == loginUser) {
			
			response.sendRedirect("/GatheringWeb");
			
			return false;
		}
		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response,
			Object obj, ModelAndView mv) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object obj, Exception exp)
					throws Exception {
		// TODO Auto-generated method stub
		
	}
}
