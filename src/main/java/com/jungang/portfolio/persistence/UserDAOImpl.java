package com.jungang.portfolio.persistence;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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

}
