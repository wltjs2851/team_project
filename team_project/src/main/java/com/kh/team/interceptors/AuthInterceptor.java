package com.kh.team.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.team.vo.MemberVo;


public class AuthInterceptor extends HandlerInterceptorAdapter {
	
	// 로그인 되어있지 않다면 로그인 창으로 이동
		@Override
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
				throws Exception {
			HttpSession session = request.getSession();
			MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
			if (memberVo == null) {
				String originalUri = request.getRequestURI();
				String uri = originalUri.substring(1);
				String queryString = request.getQueryString();
				String targetLocation = uri + "?" + queryString;
				session.setAttribute("targetLocation", targetLocation);
				response.sendRedirect("/member/loginForm");
				return false;
			}
			return true;
		}

}
