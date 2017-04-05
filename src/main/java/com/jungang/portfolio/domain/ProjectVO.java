package com.jungang.portfolio.domain;

import java.io.IOException;
import java.util.Date;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.apache.ibatis.type.Alias;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.format.annotation.DateTimeFormat;

@Alias("Project")
public class ProjectVO {

	private int num;
	private String name;
	private String alias;
	private String description;
	private Date startDate;
	private Date endDate;
	
	private boolean thePublic;
	private boolean myProject;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	@NotNull
	@Size(max=50)
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		if("".equals(name)) name = null;
		this.name = name;
	}
	
	@NotNull
	public String getAlias() {
		return alias;
	}
	
	public void setAlias(String alias) {
		if("".equals(alias)) alias = null;
		this.alias = alias;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
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
	
	public boolean isThePublic() {
		return thePublic;
	}
	
	public void setThePublic(boolean thePublic) {
		this.thePublic = thePublic;
	}
	
	public boolean isMyProject() {
		return myProject;
	}
	
	public void setMyProject(boolean myProject) {
		this.myProject = myProject;
	}
	
	@Override
	public String toString() {
		String s = "";
		ObjectMapper mapper = new ObjectMapper();
		try {
			s = mapper.writeValueAsString(this);
		} 
		catch (IOException e) {
			e.printStackTrace();
		}
		
		return s;
	}
}
