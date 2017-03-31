package com.jungang.portfolio.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jungang.portfolio.domain.AccessLogVO;
import com.jungang.portfolio.domain.UserVO;
import com.jungang.portfolio.service.AccessLogService;
import com.jungang.portfolio.service.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Resource(name="accessLogService")
	AccessLogService accessLogService;
	
	@Autowired
	UserService userService;
	
	@GetMapping("accessLog")
	public String viewLog(Model model) {
		List<AccessLogVO> list = accessLogService.getLogList();
		model.addAttribute("logs", list);
		return "accessLog";
	}
	
	@GetMapping("mgmt")
	public String config() {
		return "mgmt";
	}
	
	@GetMapping("mgmt/users")
	public String user(Model model) {
		model.addAttribute("map", userService.getUserAuthStatistics());
		model.addAttribute("users", userService.getUsers());
		return "mgmt/users";
	}
}
