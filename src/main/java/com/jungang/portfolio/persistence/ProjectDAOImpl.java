package com.jungang.portfolio.persistence;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jungang.portfolio.domain.ProjectVO;

@Repository
public class ProjectDAOImpl implements ProjectDAO {

	private final static String namespace = "mappers.oracle.projectMapper";
	
	@Resource(name="oracleSqlSession")
	SqlSession oracleSqlSession;
	
	
	@Override
	public List<ProjectVO> selectProjectNames(int userNum) {
		return oracleSqlSession.selectList(namespace + ".selectProjectNames", userNum);
	}


	@Override
	public int insertProject(ProjectVO project) {
		return oracleSqlSession.insert(namespace + ".insertProject", project);
	}

}
