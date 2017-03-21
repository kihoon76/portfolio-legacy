package com.jungang.portfolio;

import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={
	"file:src/main/webapp/WEB-INF/spring/*-context.xml"
})
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class RdbMybatisTest {

	@Resource(name="oracleSqlSessionFactory")
	SqlSessionFactory oracleSqlSessionFactory;
	
	@Test
	public void test01_OracleFactory() {
		assertThat(oracleSqlSessionFactory, is(notNullValue()));
	}
	
	@Test
	public void test02_OracleSession() {
		try(SqlSession session = oracleSqlSessionFactory.openSession()) {
			assertTrue("Oracle에 연결되었습니다.", true);
		}
		catch(Exception e) {
			assertTrue(e.getMessage(), false);
		}
	}
}
