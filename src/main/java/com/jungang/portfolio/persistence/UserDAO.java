package com.jungang.portfolio.persistence;

import java.util.List;
import java.util.Map;

import com.jungang.portfolio.domain.PageVO;
import com.jungang.portfolio.domain.UserVO;

public interface UserDAO {

	UserVO selectUserById(String id);
	int updateForUserLogin(UserVO user);
	int updateUserAccount(UserVO user);
	Map<String, String> selectUserAuthStatistics();
	List<UserVO> selectUsers(PageVO pageVO);
	List<UserVO> selectUserByAuthOrName(Map<String, Object> map);
	boolean updateUserUnlock(String userNum);
	int getTotalUsersCount(Map<String, Object> map);
	int getTotalUsersCountNoParams();
	List<Map<String, String>> selectUsersForProjectMember();
}
