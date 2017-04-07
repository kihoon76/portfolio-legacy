package com.jungang.portfolio.web;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jungang.portfolio.domain.ProjectVO;
import com.jungang.portfolio.domain.UserVO;
import com.jungang.portfolio.service.ProjectService;

@Controller
@RequestMapping("/project")
public class ProjectController {

	@Autowired
	ProjectService projectService;
	
	@GetMapping
	public String viewProjects(Model model) {
		//UserVO user = (UserVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		List<ProjectVO> list = projectService.getProjectsNameList(1);
		
		model.addAttribute("list", list);
		return "project/projectlist";
	}
	
	@PostMapping("new")
	public String createProject(@Valid @ModelAttribute("projectForm") ProjectVO project, BindingResult errors) {
		System.err.println(project);
		String result = "project/projectform";
		
		if(!errors.hasErrors()) {
			if(projectService.createProject(project)) {
				result = "redirect:/project";
			}
		}
		
		return result;
	}
	
	@GetMapping("new")
	public String initProject(@ModelAttribute("projectForm") ProjectVO projectForm) {
		
		return "project/projectform";
	}
	
	@GetMapping("/details/{details}")
	public String details(@PathVariable String details, Model model) {
		model.addAttribute("details", details);
		return "project/details/" + details;
	}
	
	@GetMapping("/details/task/new")
	public String viewTaskForm(Model model) {
		model.addAttribute("details", "task");
		
		return "project/details/task_new";
	}
}
