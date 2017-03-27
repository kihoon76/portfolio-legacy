package com.jungang.portfolio.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jungang.portfolio.service.UserService;

@Controller
@RequestMapping("/")
public class MainController {

	@Autowired
	UserService loginService;
	
	@GetMapping("main")
	public String viewMain(HttpServletRequest req) {
		
		/*boolean isLogined = (boolean) req.getAttribute("isLogined");
		
		if(isLogined) {
			String userId = (String) req.getSession().getAttribute("id");
			List<UserProject> progects = loginService.getMyProject(userId);
		}*/
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		System.err.println(authentication.getPrincipal());
		return "main";
	}
	
	@GetMapping("signin")
	public String signinForm(HttpServletRequest request) {
		
		return "signin";
	}
	
	
}
