package com.jungang.portfolio.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LoginInterceptor extends BaseInterceptor {
	private static Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	private String[] BY_PATH = {"/main", "/regist", "/login/loginForm"};
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
			
		logger.info(request.getRequestURI());
		if(isBypass(request.getRequestURI())) return true;
		
		Object obj = request.getSession().getAttribute("id");
		
		if(obj == null) response.sendRedirect("/login/loginForm");
		
		request.setAttribute("isLogined", true);
		
		return true;
	}
	
	private boolean isBypass(String uri) {
		for(String byPass : BY_PATH) {
			if(byPass.equals(uri)) return true;
		}
		
		return false;
	}
}
