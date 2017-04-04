package com.jungang.portfolio.persistence;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jungang.portfolio.domain.UserVO;

@Repository
public class RegistDAOImpl implements RegistDAO {

	private final static String namespace = "mappers.oracle.userMapper";  
	
	@Resource(name="oracleSqlSession")
	SqlSession oracleSqlSession;
	
	
	@Override
	public int selectUserCountById(String id) {
		return oracleSqlSession.selectOne(namespace + ".selectUserCountById", id);
	}

	@Override
	public int insertUser(UserVO user) {
		return oracleSqlSession.insert(namespace + ".insertUser", user);
	}

}
