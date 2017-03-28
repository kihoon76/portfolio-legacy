package com.jungang.portfolio.persistence;

import com.jungang.portfolio.domain.UserVO;

public interface UserDAO {

	UserVO selectUserById(String id);
	int updateForUserLogin(UserVO user);
}
