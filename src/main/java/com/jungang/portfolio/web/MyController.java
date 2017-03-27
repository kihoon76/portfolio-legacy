package com.jungang.portfolio.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/my")
public class MyController {

	@GetMapping("account")
	public String accountInit(Model model) {
		return "account";
	}
	
	
}
