package com.kh.junit;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.slf4j.LoggerFactory;
import org.slf4j.Logger;

public class JunitTest {
	
	private static final Logger logger = LoggerFactory.getLogger(JunitTest.class);
	
	@BeforeAll
	static void beforeAll() { //전 메소드 중 가장 빨리 수행됨
		logger.info("클래스 레벨에서 테스트 전 수행");
		
	}
	
	@AfterAll
	static void afterAll() {
		logger.info("클래스 레벨에서 테스트 후 수행");
	}
	
	
	@BeforeEach
	void beforeEach(){
		logger.info("개별단위테스트 전 수행");
	}
	
	@AfterEach
  void afterEach() {
		logger.info("개별단위테스트 후 수행");
	}
	
	@Test
	void test1() {
		logger.info("test1()수행");
		assertEquals(10, 5+5);
		
	}
	
	@Test
	@Disabled
	void test2() {
		logger.info("test2()수행");
		assertEquals(101, 10*10);
	}
}
