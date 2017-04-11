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
import org.springframework.web.bind.annotation.RequestParam;

import com.jungang.portfolio.domain.AccessLogVO;
import com.jungang.portfolio.domain.PageVO;
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
		return "admin/mgmt";
	}
	
	@GetMapping("mgmt/users")
	public String user(Model model, Integer currentPage) {
		PageVO page;
		if(currentPage != null) {
			page = new PageVO(currentPage);
		}
		else {
			page = new PageVO();
		}
		
		model.addAttribute("map", userService.getUserAuthStatistics());
		model.addAttribute("users", userService.getUsers(page));
		model.addAttribute("status", "A");
		model.addAttribute("page", page);
		return "admin/mgmt_users";
	}
	
	@GetMapping("mgmt/users/search")
	public String search(Model model,
					     @RequestParam("status") String status,
					     @RequestParam("username") String userName) {
				
		PageVO page = new PageVO();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", status);
		map.put("userName", userName);
		map.put("page",  page);
		
		model.addAttribute("map", userService.getUserAuthStatistics());
		model.addAttribute("users", userService.searchUserByAuthOrName(map));
		model.addAttribute("status", status);
		model.addAttribute("userName", userName);
		return "admin/mgmt_users";
	}
	
	@GetMapping("mgmt/users/clean/")
	public String userLockClean(HttpServletRequest request) {
		String status = request.getParameter("status");
		String userName = request.getParameter("userName");
		String userNum = request.getParameter("userNum");
		
		userName = (userName == null) ? "" : userName;
		
		boolean result = userService.unlock(userNum);
		return "redirect:/admin/mgmt/users/search?status=" + status + "&userName=" + userName;
	}
}
