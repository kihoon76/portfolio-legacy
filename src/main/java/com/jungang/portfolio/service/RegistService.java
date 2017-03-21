package com.jungang.portfolio.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jungang.portfolio.domain.UserVO;
import com.jungang.portfolio.persistence.RegistDAO;

@Service
public class RegistService {

	@Autowired
	RegistDAO registDAO;
	
	public boolean isDuplicatedId(String id) {
		return !(0 == registDAO.selectUserCountById(id));
	}
	
	public boolean regist(UserVO user) {
		return 1 == registDAO.insertUser(user);
	}
}
