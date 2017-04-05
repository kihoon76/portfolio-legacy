package com.jungang.portfolio.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jungang.portfolio.domain.ProjectVO;
import com.jungang.portfolio.persistence.ProjectDAO;

@Service
public class ProjectService {

	@Autowired
	ProjectDAO projectDao;
	
	public List<ProjectVO> getProjectsNameList(int userNum) {
		return projectDao.selectProjectNames(userNum);
	}
}
