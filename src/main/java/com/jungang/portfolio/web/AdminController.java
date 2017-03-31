package com.jungang.portfolio.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
		model.addAttribute("status", "A");
		return "mgmt/users";
	}
	
	@GetMapping("mgmt/users/search")
	public String search(HttpServletRequest request, Model model) {
		String status = request.getParameter("status");
		String userName = request.getParameter("username");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("status", status);
		map.put("userName", userName);
		
		model.addAttribute("map", userService.getUserAuthStatistics());
		model.addAttribute("users", userService.searchUserByAuthOrName(map));
		model.addAttribute("status", status);
		model.addAttribute("userName", userName);
		return "mgmt/users";
	}
}
