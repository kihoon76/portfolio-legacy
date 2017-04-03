package com.jungang.portfolio.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jungang.portfolio.domain.PageVO;
import com.jungang.portfolio.domain.UserVO;

@Repository("userDAO")
public class UserDAOImpl implements UserDAO {

	private final static String namespace = "mappers.oracle.userMapper";
	
	@Resource(name="oracleSqlSession")
	SqlSession oracleSqlSession;
	
	@Override
	public UserVO selectUserById(String id) {
		return oracleSqlSession.selectOne(namespace + ".selectUserById", id);
	}

	@Override
	public int updateForUserLogin(UserVO user) {
		return oracleSqlSession.update(namespace + ".updateForUserLogin", user);
	}

	@Override
	public int updateUserAccount(UserVO user) {
		return oracleSqlSession.update(namespace + ".updateUserAccount", user);
	}

	@Override
	public Map<String, String> selectUserAuthStatistics() {
		Map<String, String> resultMap = null;
		
		List<Map<String, String>> list = oracleSqlSession.selectList(namespace + ".selectUserAuthStatistics");
		if(list != null  && list.size() > 0) {
			resultMap = new HashMap<String, String>();
			for(Map<String, String> m : list) {
				resultMap.put(m.get("auth"), m.get("cnt"));
			}
		}
		
		return resultMap;
	}

	@Override
	public List<UserVO> selectUsers(PageVO pageVO) {
		return oracleSqlSession.selectList(namespace + ".selectUsers", pageVO);
	}

	@Override
	public List<UserVO> selectUserByAuthOrName(Map<String, Object> map) {
		return oracleSqlSession.selectList(namespace + ".selectUserByAuthOrName", map);
	}

	@Override
	public boolean updateUserUnlock(String userNum) {
		return 1 == oracleSqlSession.update(namespace + ".updateUserUnlock", userNum);
	}

	@Override
	public int getTotalUsersCount(Map<String, Object> map) {
		return oracleSqlSession.selectOne(namespace + ".selectTotalUsersCnt", map);
	}

	@Override
	public int getTotalUsersCountNoParams() {
		return oracleSqlSession.selectOne(namespace + ".selectTotalUsersCntNoParams");
	}
}
