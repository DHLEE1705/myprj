package com.kh.portfolio;



import static org.junit.jupiter.api.Assertions.assertNull;

import java.sql.Connection;
import java.sql.SQLException;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@ExtendWith(SpringExtension.class) //스프링컨텍스트와 junit통합
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class DBconnection {
	private static final Logger logger = LoggerFactory.getLogger(DBconnection.class);
	//로그를 남기기위해서 로거 선언               (this.class)
	@Inject
	DataSource dataSource;  //데이터 소스 선언 root-context.xml과 관련됨
	
	@Inject
	JdbcTemplate jdbcTemplate; //jdbcTemplate 사용하기 위해 선언 root-context.xml과 관련됨
	
	@Test
	@DisplayName("DB연결유무")
	void testdb() {
		logger.info("데이터소스:"+dataSource);
		logger.info("jdbcTemplate:"+jdbcTemplate);
		
		try {
			Connection conn = dataSource.getConnection();
			Assertions.assertNotNull(conn);//Assertions => 어디서 버그가 발생했는지 알려줌
			//assertNotNull => conn이 널이 아님을 알려줌
			logger.info("DB연결 성공!!");
		} catch (SQLException e) {
			logger.error("db연결실패");
			e.printStackTrace();
		}
	}
	
}
