package com.jungang.portfolio;

import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.*;

import javax.annotation.Resource;
import javax.sql.DataSource;

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
public class RdbDatasourceTest {

	@Resource(name="oracleDataSource")
	DataSource oracleDS;
	
	@Resource(name="mysqlDataSource")
	DataSource mysqlDS;
	
	@Test
	public void test01_OracleDSObject() {
		assertThat(oracleDS, is(notNullValue()));
	}
	
	@Test
	public void test02_MysqlDSObject() {
		assertThat(mysqlDS, is(notNullValue()));
	}
}
