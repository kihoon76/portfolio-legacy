package com.jungang.portfolio.domain;

import java.io.IOException;
import java.util.Date;

import javax.validation.constraints.NotNull;

import org.apache.ibatis.type.Alias;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.format.annotation.DateTimeFormat;

@Alias("Task")
public class TaskVO {
	private int num;
	private int typeNum;
	private String title;
	private String description;
	private int statusNum;
	private int priorityNum;
	private int responsibilityNum;
	private Date startDate;
	private Date endDate;
	private int progress;
	private int projectNum;
	private Date writeDate;
	private int writeUserNum;
	private String[] viewerNums;
	private String projectName;
	
	@Override
	public String toString() {
		String s = "";
		ObjectMapper mapper = new ObjectMapper();
		try {
			s = mapper.writeValueAsString(this);
		} 
		catch (IOException e) {}
		
		return s;
	}
	
	public int getTypeNum() {
		return typeNum;
	}
	
	public void setTypeNum(int typeNum) {
		this.typeNum = typeNum;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public int getStatusNum() {
		return statusNum;
	}
	
	public void setStatusNum(int statusNum) {
		this.statusNum = statusNum;
	}
	
	public int getPriorityNum() {
		return priorityNum;
	}
	
	public void setPriorityNum(int priorityNum) {
		this.priorityNum = priorityNum;
	}
	
	@NotNull
	@DateTimeFormat(pattern="yyyy-MM-dd")
	public Date getStartDate() {
		return startDate;
	}
	
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	
	@NotNull
	@DateTimeFormat(pattern="yyyy-MM-dd")
	public Date getEndDate() {
		return endDate;
	}
	
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	
	@NotNull
	public int getProgress() {
		return progress;
	}
	
	public void setProgress(int progress) {
		this.progress = progress;
	}
	
	@NotNull
	public int getProjectNum() {
		return projectNum;
	}
	
	public void setProjectNum(int projectNum) {
		this.projectNum = projectNum;
	}
	
	public Date getWriteDate() {
		return writeDate;
	}
	
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	
	public int getWriteUserNum() {
		return writeUserNum;
	}
	
	public void setWriteUserNum(int writeUserNum) {
		this.writeUserNum = writeUserNum;
	}

	@NotNull
	public int getResponsibilityNum() {
		return responsibilityNum;
	}

	public void setResponsibilityNum(int responsibilityNum) {
		this.responsibilityNum = responsibilityNum;
	}

	public String[] getViewerNums() {
		return viewerNums;
	}

	public void setViewerNums(String[] viewerNums) {
		this.viewerNums = viewerNums;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	
}
