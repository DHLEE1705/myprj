package com.kh.portfolio.member.svc;

import java.io.IOException;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.portfolio.board.vo.BoardFileVO;
import com.kh.portfolio.member.dao.MemberDAO;

import com.kh.portfolio.member.vo.MemberVO;

@Service //Business Layer에서 Service를 명시하기 위해서 사용
public class MemberSVCImpl implements MemberSVC {

	private static final Logger logger = LoggerFactory.getLogger(MemberSVCImpl.class);
	
	@Inject //자동으로 인스턴스 생성해줌
	@Qualifier("mxml") // ""안에는 기본값으로 앞글자가 소문자인 클래스이름이들어간다
	MemberDAO memberDAO; //Inject 어노테이션이 있어서 new MemberDAO 안해도됨
	
	//즉 MemberDAO는 인터페이스이기때문에 MemberDAO를 구현한 클래스인 MemberDAOImplJDBC 또는 MemberDAOImpXML을 써야한다.
	//왜냐 구현한 내용이 구현클래스내에 있기 때문이다. MemberDAO에는 빈껍데기 메소드 이고 구현한 클래스가 2개이므로 구분해주기 위해서
	//@Qualifier를 이용해서 MemberDAOImplXML을 쓰겠다고 표시해준것.
//회원 등록
	@Override
	public int joinMember(MemberVO memberVO) {
		
		//3) 첨부파일 있는경우	
			if(memberVO.getFile() != null && memberVO.getFile().getSize() > 0) {
				try {
					logger.info("파일 첨부: " + memberVO.getFile().getOriginalFilename());
					//첨부파일명
					memberVO.setFname(memberVO.getFile().getOriginalFilename());
					//첨부파일 크기
					memberVO.setFsize(memberVO.getFile().getSize());
					//첨부파일
					memberVO.setFdata(memberVO.getFile().getBytes());
					//첨부파일 저장
				
				} catch (IOException e) {
					e.printStackTrace();
				}
			} 
			int cnt = memberDAO.joinMember(memberVO);
			logger.info("memberVO" + memberVO);
		return cnt;
	}
	
//회원 수정
	@Override
	public int modifyMember(MemberVO memberVO) {
	//3) 첨부파일 있는경우	
		if(memberVO.getFile() != null && memberVO.getFile().getSize() > 0) {
			try {
				logger.info("파일 첨부: " + memberVO.getFile().getOriginalFilename());
				//첨부파일명
				memberVO.setFname(memberVO.getFile().getOriginalFilename());
				//첨부파일 크기
				memberVO.setFsize(memberVO.getFile().getSize());
				//첨부파일
				memberVO.setFdata(memberVO.getFile().getBytes());
				//첨부파일 저장
			
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		logger.info("MemberSVCImpl.modifyMember(MemberVO memberVO) 호출됨!");		
		int cnt = memberDAO.modifyMember(memberVO);
	return cnt;	
	}

//회원 전체조회
	@Override
	public List<MemberVO> selectAllMember() {
		logger.info("MemberSVCImpl.selectAllMember() 호출됨!");
		return memberDAO.selectAllMember();
	}

//회원 개별조회
	@Override
	public MemberVO selectMember(String id) {
		logger.info("MemberSVCImpl.selectMember(String id) 호출됨!");
		return memberDAO.selectMember(id);
	}

//회원 탈퇴
	@Override
	public int outMember(String id, String pw) {
		logger.info("MemberSVCImpl.outMember(String id, String pw) 호출됨!");
		return memberDAO.outMember(id, pw);
	}

//로그인
	@Override
	public MemberVO loginMember(String id, String pw) {
		logger.info("MemberSVCImpl.loginMember(String id, String pw) 호출됨!");
		return memberDAO.loginMember(id, pw);
	}

//아이디 찾기
	@Override
	public String findID(String tel, Date birth) {
		logger.info("MemberSVCImpl.findID(String tel, Date birth) 호출됨!");
		return memberDAO.findID(tel, birth);
	}
	
//비밀번호 변경 대상 찾기
	@Override
	public int findPW(MemberVO memberVO) {
		logger.info("MemberSVCImpl.findPW(MemberVO memberVO) 호출됨!");
		return memberDAO.findPW(memberVO);
	}

//비밀번호 변경
	@Override
	public int changePW(String id, String pw) {
		logger.info("MemberSVCImpl.changePW(String id, String pw) 호출됨!");
		return memberDAO.changePW(id, pw);
	}
	
//사진 삭제
	@Override
	public int fileDelete(String id) {
		return memberDAO.fileDelete(id);
	}
	

}
