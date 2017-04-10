package com.jungang.portfolio.domain;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("Task")
public class TaskVO {

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
	public int getResponsibilityNum() {
		return responsibilityNum;
	}
	public void setResponsibilityNum(int responsibilityNum) {
		this.responsibilityNum = responsibilityNum;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public int getProgress() {
		return progress;
	}
	public void setProgress(int progress) {
		this.progress = progress;
	}
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
	
	
	
	
}
