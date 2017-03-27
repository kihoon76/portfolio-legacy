package com.jungang.portfolio.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class AccessLogInterceptor extends BaseInterceptor {
	private static Logger logger = LoggerFactory.getLogger(AccessLogInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		//http://changpd.blogspot.kr/2013/03/spring.html
		logger.info("============================================1");
		return true;
	}
}
