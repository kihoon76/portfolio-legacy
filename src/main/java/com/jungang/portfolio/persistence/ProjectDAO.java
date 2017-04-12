package com.jungang.portfolio.persistence;

import java.util.List;
import java.util.Map;

import com.jungang.portfolio.domain.ProjectVO;
import com.jungang.portfolio.domain.TaskVO;

public interface ProjectDAO {

	List<ProjectVO> selectProjectNames(int userNum);

	int insertProject(ProjectVO project);

	List<Map<String, String>> selectTaskTypes();

	List<Map<String, String>> selectTaskStatuses();

	List<Map<String, String>> selectTaskPriorities();
	
	int insertProjectUser(List<Map<String, Object>> list);

	List<Map<String, String>> selectProjectUsers(Integer pNum);

	int insertTask(TaskVO task);

	List<Map> selectTasks(String pnum, String order);

	boolean selectTaskDupTitle(TaskVO task);

	List<Map> selectTaskForCalendar(String pnum);

}
