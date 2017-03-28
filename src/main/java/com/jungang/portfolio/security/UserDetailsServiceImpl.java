package com.jungang.portfolio.security;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.jungang.portfolio.domain.UserVO;
import com.jungang.portfolio.exceptions.NotAuthorizedByAdmin;
import com.jungang.portfolio.service.UserService;

@Service("userDetailsService")
public class UserDetailsServiceImpl implements UserDetailsService{

	private static final Logger logger = LoggerFactory.getLogger(UserDetailsServiceImpl.class);
	
	@Autowired
	UserService userService;
	
	@Autowired
	private HttpServletRequest request;
	
	@Override
	public UserDetailsImpl loadUserByUsername(String username) throws UsernameNotFoundException {
		logger.info("username ==> " + username);
		
		//회원정보 dao에서 데이터 읽어옴
		UserVO user = null;
		try {
			user = userService.getUserAfterLogin(makeUserVO(username));
			System.err.println(request);
		}
		catch(Exception e) {
			throw new UsernameNotFoundException("접속자 정보 DB에서  문제가 발생했습니다. ");
		}
		
		if(user == null) throw new UsernameNotFoundException("접속자 정보(ID)를 찾을수 없습니다 ");
		
		List<Role> roles = new ArrayList<Role>();
		
		if(user.isAuthorized()) {
			roles.add(addRole("ROLE_AUTHORIZED"));
		}
		else {
			throw new NotAuthorizedByAdmin("승인되지 않은 사용자 입니다");
		}
		
		if(user.isAdmin()) {
			roles.add(addRole("ROLE_ADMIN"));
		}
		else {
			roles.add(addRole("ROLE_USER"));
		}
		
		UserDetailsImpl userDetails = new UserDetailsImpl(username, user.getPw(), user, roles); 
		
		
		return userDetails;
	}
	
	private Role addRole(String name) {
		Role role = new Role();
		role.setName(name);
		return role;
	}
	
	private UserVO makeUserVO(String username) {
		/*
		 * https://www.lesstif.com/pages/viewpage.action?pageId=20775886
		 * 
		 * */
		 String ip = request.getHeader("X-Forwarded-For");
		 String header = "X-Forwarded-For";
		 
		 if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
		     ip = request.getHeader("Proxy-Client-IP");
		     header = "Proxy-Client-IP";
		 } 
		 if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
		     ip = request.getHeader("WL-Proxy-Client-IP");
		     header = "WL-Proxy-Client-IP";
		 } 
		 if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
		     ip = request.getHeader("HTTP_CLIENT_IP"); 
		     header = "HTTP_CLIENT_IP";
		 } 
		 if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
		     ip = request.getHeader("HTTP_X_FORWARDED_FOR"); 
		     header = "HTTP_X_FORWARDED_FOR";
		 } 
		 if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
		     ip = request.getRemoteAddr(); 
		     header = "RemoteAddr";
		 }
		 
		logger.info("####################################################");
		logger.info("# " + header + " : " + ip);
		logger.info("####################################################");
		UserVO user = new UserVO();
		user.setId(username);
		user.setLoginIP(ip);
		return user;
	}

}
