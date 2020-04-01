package com.kh.portfolio.member.dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;


import com.kh.portfolio.member.vo.MemberVO;

@Repository("mxml")  //Default는 @Repository("memberDAOImplXML") 이다. 
// ""안에 임의로 값을 주게 되면  사용하는 클래스에서 QUALIFIER 값을 이것과 똑같이 바꿔줘야함. Persistence Layer에서 DAO를 명시하기 위해서 사용
public class MemberDAOImplXML implements MemberDAO {

	private static final Logger logger = LoggerFactory.getLogger(MemberDAOImplXML.class);
	
	@Inject
	private SqlSession sqlSession;
	
	//회원등록
	@Override
	public int joinMember(MemberVO memberVO) {
		logger.info("MemberDAOImplXML.joinMember(MemberVO memberVO) 호출됨!");
		return sqlSession.insert("mappers.MemberDAO-mapper.joinMember", memberVO);
    //insert에서 2번째꺼 사용했다.
	}

	//회원수정
	@Override
	public int modifyMember(MemberVO memberVO) {
		logger.info("MemberDAOImplXML.joinMember(MemberVO memberVO) 호출됨!");
		return sqlSession.update("mappers.MemberDAO-mapper.modifyMember", memberVO);
	}

	//회원 전체조회
	@Override
	public List<MemberVO> selectAllMember() {
		logger.info("MemberDAOImplXML.selectAllMember(MemberVO memberVO) 호출됨!");
		return sqlSession.selectList("mappers.MemberDAO-mapper.selectAllMember");
		//selectList에서 첫번째꺼 사용(string statement
	}

	//회원 개별조회
	@Override
	public MemberVO selectMember(String id) {
		logger.info("MemberDAOImplXML.selectMember(String id) 호출됨!");
		return sqlSession.selectOne("mappers.MemberDAO-mapper.selectMember", id);
		//selectOne에서 파라미터값받는 메소드사용
	}

	
	//회원탈퇴
	@Override
	public int outMember(String id, String pw) { 
		logger.info("MemberDAOImplXML.outMember(String id, String pw) 호출됨!");
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pw", pw);
		return sqlSession.delete("mappers.MemberDAO-mapper.outMember", map);
	}
	
	//사진 삭제
	@Override
	public int fileDelete(String id) {
		return sqlSession.delete("mappers.MemberDAO-mapper.fileDelete",id);
	}

	//로그인
	@Override
	public MemberVO loginMember(String id, String pw) {
		logger.info("MemberDAOImplXML.loginMember(String id, String pw) 호출됨!");
		MemberVO memberVO = new MemberVO();
		memberVO.setId(id);
		memberVO.setPw(pw);
		return sqlSession.selectOne("mappers.MemberDAO-mapper.loginMember",memberVO);
	}

	//아이디 찾기
	@Override
	public String findID(String tel, Date birth) {
		logger.info("MemberDAOImplXML.findID(String tel, Date birth) 호출됨!");
		MemberVO memberVO = new MemberVO();
		memberVO.setTel(tel);
		memberVO.setBirth(birth);
		return sqlSession.selectOne("mappers.MemberDAO-mapper.findID",memberVO);
	}
	
	//비밀번호 대상 찾기
	@Override
	public int findPW(MemberVO memberVO) {
		logger.info("MemberDAOImplXML.findPW(String id, String pw) 호출됨!");
		return sqlSession.selectOne("mappers.MemberDAO-mapper.findPW", memberVO);
	}


	//비밀번호 변경
	@Override
	public int changePW(String id, String pw) {
		logger.info("MemberDAOImplXML.changePW(String id, String pw) 호출됨!");
		MemberVO memberVO = new MemberVO();
		memberVO.setId(id);
		memberVO.setPw(pw);
		return sqlSession.update("mappers.MemberDAO-mapper.changePW",memberVO);
	}

	
}
