package com.jungang.portfolio;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={
	"file:src/main/webapp/WEB-INF/spring/*-context.xml"
})
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class RdbConnectionTest {
	
	/* Oracle */ 
	@Value("#{dsCfg['oracle.datasource.driverClassName']}")
	private String ORACLE_DRIVER;
	
	@Value("#{dsCfg['oracle.datasource.url']}")
	private String ORACLE_URL;
	
	@Value("#{dsCfg['oracle.datasource.username']}")
	private String ORACLE_USER;
	
	@Value("#{dsCfg['oracle.datasource.password']}")
	private String ORACLE_PW;
	
	/* mysql */
	@Value("#{dsCfg['mysql.datasource.driverClassName']}")
	private String MYSQL_DRIVER;
	
	@Value("#{dsCfg['mysql.datasource.url']}")
	private String MYSQL_URL;
	
	@Value("#{dsCfg['mysql.datasource.username']}")
	private String MYSQL_USER;
	
	@Value("#{dsCfg['mysql.datasource.password']}")
	private String MYSQL_PW;
	
	@Test
	public void test01_OracleConnection() throws Exception {
		try {
			connection(ORACLE_DRIVER, ORACLE_URL, ORACLE_USER,  ORACLE_PW);
		}
		catch(ClassNotFoundException e) {
			assertTrue("Oracle 드라이브 명이 잘못 되었습니다.", false);
		}
	}
	
	//@Test
	public void test02_MySqlConnection() throws Exception {
		try {
			connection(MYSQL_DRIVER, MYSQL_URL, MYSQL_USER, MYSQL_PW);
		}
		catch(ClassNotFoundException e) {
			assertTrue("Mysql 드라이브 명이 잘못 되었습니다.", false);
		}
	}
	
	private void connection(String driver, String url, String user, String passwd) throws ClassNotFoundException {
		Class.forName(driver);
		
		try(Connection con = DriverManager.getConnection(url, user, passwd)) {
			assertTrue(true);
			con.close();
		}
		catch(Exception e) {
			assertTrue(e.getMessage(), false);
		}
	}
}
