package com.jungang.portfolio.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jungang.portfolio.domain.UserProjectVO;
import com.jungang.portfolio.domain.UserVO;
import com.jungang.portfolio.persistence.UserDAO;

@Service
public class UserService {

	@Resource(name="userDAO")
	UserDAO userDao;
	
	public List<UserProjectVO> getMyProject(String userId) {
		
		return null;
	}
	
	public UserVO getUserAfterLogin(UserVO user) {
		UserVO result = userDao.selectUserById(user.getId());
		userDao.updateForUserLogin(user);
		return result;
	}
	
	public boolean modifyAccount(UserVO user) {
		return userDao.updateUserAccount(user) == 1;
	}

	public Map<String, String> getUserAuthStatistics() {
		return userDao.selectUserAuthStatistics();
		
	}

	public List<UserVO> getUsers() {
		return userDao.selectUsers();
	}
}
