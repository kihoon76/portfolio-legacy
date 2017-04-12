package com.jungang.portfolio.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.jungang.portfolio.domain.ProjectVO;
import com.jungang.portfolio.domain.TaskVO;
import com.jungang.portfolio.persistence.ProjectDAO;

@Service
public class ProjectService {

	@Autowired
	ProjectDAO projectDao;
	
	public List<ProjectVO> getProjectsNameList(int userNum) {
		return projectDao.selectProjectNames(userNum);
	}

	@Transactional(readOnly=false, 
			   	   isolation=Isolation.DEFAULT,
			   	   propagation=Propagation.REQUIRED,
			       rollbackFor=Throwable.class)
	public boolean createProject(ProjectVO project) {
		int result = projectDao.insertProject(project);
		
		if(result == 1) {
			String[] member = project.getMemberNum();
			int memberCnt = member.length;
			
			List<Map<String, Object>> list = new ArrayList<>();
			for(int c=0; c<memberCnt; c++) {
				Map<String, Object> m = new HashMap<String, Object>();
				m.put("userNum", member[c]);
				m.put("projectNum", project.getNum());
				list.add(m);
			}
			
			int batchCnt = projectDao.insertProjectUser(list);
			if(memberCnt == batchCnt) return true;
			
			throw new RuntimeException("createProject(expected = " + memberCnt + ", result = " + batchCnt + ")");
		}
		
		return false;
	}

	public List<Map<String, String>> getTaskTypes() {
		return projectDao.selectTaskTypes();
	}

	public List<Map<String, String>> getTaskStatuses() {
		return projectDao.selectTaskStatuses();
	}

	public List<Map<String, String>> getTaskPriorities() {
		return projectDao.selectTaskPriorities();
	}

	public List<Map<String, String>> getProjectUsers(Integer pNum) {
		return projectDao.selectProjectUsers(pNum);
	}

	public boolean createTask(TaskVO task) {
		return 1 == projectDao.insertTask(task);
	}

	public List<Map> getTasks(String pnum) {
		return projectDao.selectTasks(pnum);
	}
}
