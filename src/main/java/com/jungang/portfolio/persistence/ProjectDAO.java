package com.jungang.portfolio.persistence;

import java.util.List;

import com.jungang.portfolio.domain.ProjectVO;

public interface ProjectDAO {

	List<ProjectVO> selectProjectNames(int userNum);

	int insertProject(ProjectVO project);

}
