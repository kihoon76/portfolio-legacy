package com.jungang.portfolio.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.jungang.portfolio.domain.UserVO;
import com.jungang.portfolio.utils.ValidateUtil;

public class UserModifyValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return (UserVO.class.equals(clazz));
	}

	@Override
	public void validate(Object target, Errors errors) {
		UserVO user = (UserVO)target;
		
		if(!ValidateUtil.isValidEmail(user.getEmail())) {
			errors.rejectValue("email", "valid.email");
		}
		
		//ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "valid.email");
		
	}

}
