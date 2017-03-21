package com.jungang.portfolio.persistence;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jungang.portfolio.domain.AccessLogVO;

@Repository
public class AccessLogDAOImpl implements AccessLogDAO {

	@Resource(name="mySqlSession")
	SqlSession mySqlSession;
	
	private final static String namespace = "mappers.mysql.accessLogMapper";  
	
	@Override
	public List<AccessLogVO> selectWithLastOneMonth() {
		// TODO Auto-generated method stub
		List<AccessLogVO> list = mySqlSession.selectList(namespace + ".selectWithLastOneMonth");
		return list;
	}

}
