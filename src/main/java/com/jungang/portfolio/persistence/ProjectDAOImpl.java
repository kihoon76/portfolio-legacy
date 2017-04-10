package com.jungang.portfolio.persistence;

import java.util.List;
import java.util.Map;

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


	@Override
	public List<Map<String, String>> selectTaskTypes() {
		return oracleSqlSession.selectList(namespace + ".selectTaskTypes");
	}


	@Override
	public List<Map<String, String>> selectTaskStatuses() {
		return oracleSqlSession.selectList(namespace + ".selectTaskStatuses");
	}


	@Override
	public List<Map<String, String>> selectTaskPriorities() {
		return oracleSqlSession.selectList(namespace + ".selectTaskPriorities");
	}


	@Override
	public int insertProjectUser(List<Map<String, Object>> list) {
		return oracleSqlSession.insert(namespace + ".insertProjectUser", list);
	}

}
