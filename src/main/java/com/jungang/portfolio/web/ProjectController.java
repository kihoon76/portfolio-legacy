package com.jungang.portfolio.web;

import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestParam;

import com.jungang.portfolio.domain.ProjectVO;
import com.jungang.portfolio.domain.TaskVO;
import com.jungang.portfolio.domain.UserVO;
import com.jungang.portfolio.service.ProjectService;
import com.jungang.portfolio.service.UserService;

@Controller
@RequestMapping("/project")
public class ProjectController {

	@Autowired
	ProjectService projectService;
	
	@Autowired
	UserService userService;
	
	@GetMapping
	public String viewProjects(Model model) {
		UserVO user = (UserVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		List<ProjectVO> list = projectService.getProjectsNameList(user.getNum());
		
		model.addAttribute("list", list);
		return "project/projectlist";
	}
	
	@PostMapping("new")
	public String createProject(@Valid @ModelAttribute("projectForm") ProjectVO project, BindingResult errors, Model model) {
		System.err.println(project);
		String result = "project/projectform";
		
		if(!errors.hasErrors()) {
			try {
				if(projectService.createProject(project)) {
					result = "redirect:/project";
				}
			}
			catch(Exception e) {}
		}
		
		model.addAttribute("members", userService.getUsersForProjectMember());
		return result;
	}
	
	@GetMapping("new")
	public String initProject(@ModelAttribute("projectForm") ProjectVO projectForm, Model model) {
		
		model.addAttribute("members", userService.getUsersForProjectMember());
		return "project/projectform";
	}
	
	@GetMapping("/details/{details}")
	public String details(@PathVariable String details, Model model, @RequestParam("pnum") String pnum, @RequestParam("pname") String pname) {
		model.addAttribute("details", details);
		model.addAttribute("pnum", pnum);
		model.addAttribute("pname", pname);
		
		if("task".equals(details)) {
			List<Map> tasks = projectService.getTasks(pnum);
			model.addAttribute("tasks", tasks);
		}
		return "project/details/" + details;
	}
	
	@GetMapping("/details/task/new")
	public String viewTaskForm(Model model, @ModelAttribute("taskForm") TaskVO task,
							   @RequestParam("pnum") Integer pnum,
							   @RequestParam("pname") String pname) {
		List<Map<String, String>> taskTypes = projectService.getTaskTypes();
		List<Map<String, String>> taskStatuses = projectService.getTaskStatuses();
		List<Map<String, String>> taskPriorities = projectService.getTaskPriorities();
		List<Map<String, String>> taskResponsibility = projectService.getProjectUsers(pnum);
		
		model.addAttribute("details", "task");
		model.addAttribute("pnum", pnum);
		model.addAttribute("pname", pname);
		model.addAttribute("taskTypes", taskTypes);
		model.addAttribute("taskStatuses", taskStatuses);
		model.addAttribute("taskPriorities", taskPriorities);
		model.addAttribute("taskResponsibilities", taskResponsibility);
		
		return "project/details/task_new";
	}
	
	@PostMapping("/details/task/new")
	public String createTask(@Valid @ModelAttribute("taskForm") TaskVO task, BindingResult errors, Model model) {
		System.err.println(task);
		
		UserVO user = (UserVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		task.setWriteUserNum(user.getNum());
		
		boolean result = projectService.createTask(task);
		System.err.println(result);
		return "redirect:/project/details/task?pnum=" + task.getProjectNum() + "&pname=" + task.getProjectName();
	}
}
