package com.jungang.portfolio.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jungang.portfolio.domain.AccessLogVO;
import com.jungang.portfolio.persistence.AccessLogDAO;

@Service("accessLogService")
public class AccessLogService {

	@Autowired
	AccessLogDAO accessLogDAO;
	
	public List<AccessLogVO> getLogList() {
		return accessLogDAO.selectWithLastOneMonth();
	}
}
