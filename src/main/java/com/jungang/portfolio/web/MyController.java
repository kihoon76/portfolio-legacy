package com.jungang.portfolio.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jungang.portfolio.domain.AjaxVO;
import com.jungang.portfolio.domain.UserVO;
import com.jungang.portfolio.service.UserService;

@Controller
@RequestMapping("/my")
public class MyController {
	
	@Autowired
	UserService userService;

	@GetMapping("account")
	public String accountInit(Model model) {
		UserVO user = (UserVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.err.println(user.getEmail());
		model.addAttribute("user", user);
		return "my/account";
	}
	
	@PostMapping("account/modify")
	@ResponseBody
	public AjaxVO modify(@ModelAttribute UserVO user) {
		System.err.println(user.getEmail());
		UserVO securityUser = (UserVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		user.setId(securityUser.getId());
		
		boolean result = userService.modifyAccount(user);
		
		if(result) {
			securityUser.setEmail(user.getEmail());
			securityUser.setfName(user.getfName());
			securityUser.setsName(user.getsName());
			securityUser.setEmailDirect(user.isEmailDirect());
		}
		
		AjaxVO ajaxVO = new AjaxVO();
		ajaxVO.setSuccess(result);
		return ajaxVO;
	}
}
