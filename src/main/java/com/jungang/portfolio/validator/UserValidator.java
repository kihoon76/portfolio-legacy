package com.jungang.portfolio.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.jungang.portfolio.domain.UserVO;

@Component
public class UserValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return (UserVO.class.equals(clazz));
	}

	@Override
	public void validate(Object target, Errors errors) {
		UserVO user = (UserVO)target;
		
		//num field is created automatically
//		if(user.getNum() != null) {
//			errors.rejectValue("num", "", "num은 반드시 빈값이어야 한다");
//		}
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "id", "valid.id");
		
	}

}
