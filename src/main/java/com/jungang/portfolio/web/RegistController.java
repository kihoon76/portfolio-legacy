package com.jungang.portfolio.web;

import java.io.IOException;
import java.util.List;
import java.util.Locale;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.Validator;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jungang.portfolio.domain.UserVO;
import com.jungang.portfolio.service.RegistService;

@Controller
@RequestMapping("/regist")
public class RegistController {

	@Autowired
	RegistService registService;
	
	@Autowired
	@Qualifier("userValidator")
	Validator userValidator;
	
	@Autowired
	private MessageSource messageSource;
	
	@InitBinder
	private void initBinder(WebDataBinder binder) {
		binder.setValidator(userValidator);
	}
	
	@PostMapping
	public String submitForm(@ModelAttribute("userForm") @Valid UserVO user, BindingResult errors) throws IOException {
		
		String returnVal = "registForm";
		if(!errors.hasErrors()) {
			user.setAdmin(false);
			user.setAuthorized(false);
			boolean success = registService.regist(user);
			if(success) {
				returnVal = "redirect:/login/loginForm";
			}
		}
		else {
			
		    List<ObjectError> errs = errors.getAllErrors();
            for(ObjectError error : errs){
            	System.err.println(messageSource.getMessage(error, Locale.KOREAN));
            }
			System.err.println("*****************************************");
		}
				
		return returnVal;
	}
	
	@GetMapping
	public String initForm(Model model) {
		model.addAttribute("userForm", new UserVO());
		return "registForm";
	}
	
	@GetMapping("checkId/{id}")
	@ResponseBody
	public String checkId(@PathVariable String id) {
		if(registService.isDuplicatedId(id)) {
			return "invalid";
		}
		
		return "valid";
	}
}
