package com.jungang.portfolio.persistence;

import java.util.List;

import com.jungang.portfolio.domain.AccessLogVO;

public interface AccessLogDAO {

	List<AccessLogVO> selectWithLastOneMonth();
}
