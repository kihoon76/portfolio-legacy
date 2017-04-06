package com.jungang.portfolio.validator;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.jungang.portfolio.domain.UserVO;
import com.jungang.portfolio.service.RegistService;
import com.jungang.portfolio.utils.ValidateUtil;

@Component
public class UserValidator implements Validator{

	@Autowired
	RegistService registService;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return (UserVO.class.equals(clazz));
	}

	@Override
	public void validate(Object target, Errors errors) {
		UserVO user = (UserVO)target;
		
		if(StringUtils.isBlank(user.getId())) {
			errors.rejectValue("id", "NotNull.user.id");
		}
		else {
			if(registService.isDuplicatedId(user.getId())) {
				errors.rejectValue("id", "Dup.user.id");
			}
			else {
				
			}
		}
		
		if(StringUtils.isBlank(user.getEmail())) {
			errors.rejectValue("email", "NotNull.user.email");
		}
		else {
			if(!ValidateUtil.isValidEmail(user.getEmail())) {
				errors.rejectValue("email", "NotFormat.user.email");
			}
		}
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "pw", "NotNull.user.pw");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "sName", "NotNull.user.sName");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "fName", "NotNull.user.fName");
		
		
		
	}

}
