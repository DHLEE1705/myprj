package com.kh.portfolio.member.dao;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.sql.Date;
import java.util.List;

import javax.inject.Inject;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.kh.portfolio.member.dao.MemberDAO;
import com.kh.portfolio.member.vo.MemberVO;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class MemberDAOImplJDBCTest {
	private final static Logger logger = LoggerFactory.getLogger(MemberDAOImplJDBCTest.class);
	
	@Inject
	@Qualifier("memberDAOImplJDBC")
	MemberDAO memberDAO;

	@Test
  @Disabled
	@DisplayName("회원가입")
	void joinMember() {
		MemberVO memberVO = new MemberVO();
		memberVO.setId("test7@naver.com");
		memberVO.setPw("*qwer1234");
		memberVO.setTel("010-1234-5678");
		memberVO.setName("홍길동");
		memberVO.setGender("남");
		memberVO.setRegion("울산");
		memberVO.setBirth(java.sql.Date.valueOf("2000-03-04"));
		
		int cnt  = memberDAO.joinMember(memberVO);
		assertEquals(1, cnt);
	}
	
	@Disabled
	@Test
	@DisplayName("회원정보수정")
	void modifyMember() {
		MemberVO memberVO = new MemberVO();
		memberVO.setId("Lemon@naver.com");
		memberVO.setTel("010-2077-9300");
		memberVO.setName("호돈라");
		memberVO.setGender("남");
		memberVO.setRegion("부산");
		memberVO.setBirth(java.sql.Date.valueOf("2020-01-16"));
		int cnt = memberDAO.modifyMember(memberVO);
		assertEquals(1, cnt);
	}
	
	@Test
	@DisplayName("회원 전체조회")
	@Disabled
	void selectAllMember() {
		List<MemberVO> list = memberDAO.selectAllMember();
		assertNotNull(list);
		logger.info(list.toString());
	}
	
	@Test
	@DisplayName("회원 개별조회")
	@Disabled
	void selectMember() {
		MemberVO memberVO = memberDAO.selectMember("HOOOO70@naver.com");
		assertEquals("HOOOO70@naver.com", memberVO.getId());
		logger.info(memberVO.toString());
		
	}
	
	
	@Test
	@DisplayName("회원 탈퇴")
	@Disabled
	void outMember() {
		MemberVO memberVO = new MemberVO();
		int cnt = memberDAO.outMember("Lemon@naver.com", "*qwer1234");
		assertEquals(1, cnt);
	}
	
	@Test
	@DisplayName("로그인")
	@Disabled
	void loginMember() {
		MemberVO memberVO = memberDAO.loginMember("REAL@GOOGLE.COM", "*qwer1235");
		assertEquals("REAL@GOOGLE.COM", memberVO.getId());
		logger.info(memberVO.toString());
	}
	
	@Test
	@DisplayName("아이디 찾기")
	@Disabled
	void findID() {				//월에서 1빼야지 원래 개월수 나옴
		String id = memberDAO.findID("010-2077-9309", java.sql.Date.valueOf("2020-01-13"));
		assertEquals("bnbn@naver.com", id);
	}
	
	@Test
	@DisplayName("비밀번호 변경 대상 찾기")
//	@Disabled
	void findPW() {
		MemberVO memberVO = new MemberVO();
		memberVO.setId("dkdkdkd@naver.com");
		memberVO.setTel("010-2077-1234");
		memberVO.setBirth(java.sql.Date.valueOf("2020-02-02"));
		int cnt = memberDAO.findPW(memberVO);
		assertEquals(1, cnt);
	}
	
	@Test
	@DisplayName("비밀번호 변경")
	@Disabled
	void changePW() {
			int cnt = memberDAO.changePW("REAL@GOOGLE.COM","*qwer1235");
			assertEquals(1, cnt);
	}
}
