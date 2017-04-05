package com.jungang.portfolio.web;

import java.util.List;

import javax.validation.Valid;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jungang.portfolio.domain.ProjectVO;
import com.jungang.portfolio.domain.UserVO;
import com.jungang.portfolio.service.ProjectService;

@Controller
@RequestMapping("/project")
public class ProjectController {

	ProjectService projectService;
	
	@GetMapping
	public String viewProjects(Model model) {
		//UserVO user = (UserVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		//List<ProgectVO> list = projectService.getProjectsNameList(user.getNum());
		
		//model.addAttribute("list", list);
		return "project/projectlist";
	}
	
	@PostMapping("new")
	public String createProject(@Valid @ModelAttribute("projectForm") ProjectVO project, BindingResult errors) {
		System.err.println(project);
		String result = "";
		if(errors.hasErrors()) {
			System.err.println("=================================");
			result = "project/projectform";
		}
		else {
			result = "redirect:/project";
		}
		return result;
	}
	
	@GetMapping("new")
	public String initProject(@ModelAttribute("projectForm") ProjectVO projectForm) {
		
		return "project/projectform";
	}
}
