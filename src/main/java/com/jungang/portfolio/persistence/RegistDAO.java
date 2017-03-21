package com.jungang.portfolio.persistence;

import com.jungang.portfolio.domain.UserVO;

public interface RegistDAO {

	int selectUserCountById(String id);
	int insertUser(UserVO user);
}
