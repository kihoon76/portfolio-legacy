package com.jungang.portfolio.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jungang.portfolio.domain.AccessLogVO;
import com.jungang.portfolio.service.AccessLogService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Resource(name="accessLogService")
	AccessLogService accessLogService;
	
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
	public String user() {
		return "mgmt/users";
	}
}
