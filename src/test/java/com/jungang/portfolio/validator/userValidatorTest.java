package com.jungang.portfolio.validator;

import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.MessageSource;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.validation.BeanPropertyBindingResult;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;

import com.jungang.portfolio.domain.UserVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={
	"file:src/main/webapp/WEB-INF/spring/*-context.xml",
	"file:src/test/resources/servletTest-context.xml"
})
public class userValidatorTest {

	@Autowired
	@Qualifier("messageSource")
	MessageSource messageSource;
	
	@Autowired
	@Qualifier("userValidator")
	Validator validator;
	
	@Test
	public void test01_MessageSource() {
		assertThat(messageSource, is(notNullValue()));
	}
	
	@Test
	public void test02_validId() {
		//assertThat(messageSource.getMessage(", locale))
		UserVO user = new UserVO(); 
		BindingResult br = new BeanPropertyBindingResult(user, "user");
		
		validator.validate(user, br);
		if(br.hasErrors()) {
			System.out.println(br);
		}
	}
}
