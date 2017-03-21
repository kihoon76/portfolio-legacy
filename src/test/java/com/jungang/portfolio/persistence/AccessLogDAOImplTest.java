package com.jungang.portfolio.persistence;

import java.util.List;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jungang.portfolio.domain.AccessLogVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={
	"file:src/main/webapp/WEB-INF/spring/*-context.xml",
	"file:src/test/resources/servletTest-context.xml"
})
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class AccessLogDAOImplTest {

	@Autowired
	private AccessLogDAO accessLogDAO;
	
	@Test
	public void test01_AccessLogDAO() {
		List<AccessLogVO> list = accessLogDAO.selectWithLastOneMonth();
		System.out.println(list);
		
	}
	
}
