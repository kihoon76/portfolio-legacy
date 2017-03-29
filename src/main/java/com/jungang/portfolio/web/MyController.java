package com.jungang.portfolio.web;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jungang.portfolio.domain.UserVO;

@Controller
@RequestMapping("/my")
public class MyController {

	@GetMapping("account")
	public String accountInit(Model model) {
		UserVO user = (UserVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.err.println(user.getEmail());
		model.addAttribute("user", user);
		return "account";
	}
	
	@PostMapping("account/modify")
	public String modify() {
		return "";
	}
	
	
}
