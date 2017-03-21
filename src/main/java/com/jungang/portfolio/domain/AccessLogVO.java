package com.jungang.portfolio.domain;

import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.codehaus.jackson.map.ObjectMapper;

@Alias("AccessLog")
public class AccessLogVO {

	private String ip;
	private String path;
	private String params;
	private String userAgent;
	private String referer;
	private Date accessTime;
	
	public String getIp() {
		return ip;
	}
	
	public void setIp(String ip) {
		this.ip = ip;
	}
	
	public String getPath() {
		return path;
	}
	
	public void setPath(String path) {
		this.path = path;
	}
	
	public String getParams() {
		return params;
	}
	
	public void setParams(String params) {
		this.params = params;
	}
	
	public Date getAccessTime() {
		return accessTime;
	}
	
	public void setAccessTime(Date accessTime) {
		this.accessTime = accessTime;
	}
	
	@Override
	public String toString() {
		String str = null;
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			str = mapper.writeValueAsString(this);
		} 
		catch (Exception e) {
			e.printStackTrace();
		} 
		
		return str;
	}
	public String getUserAgent() {
		return userAgent;
	}
	
	public void setUserAgent(String userAgent) {
		this.userAgent = userAgent;
	}
	
	public String getReferer() {
		return referer;
	}
	
	public void setReferer(String referer) {
		this.referer = referer;
	}
}
