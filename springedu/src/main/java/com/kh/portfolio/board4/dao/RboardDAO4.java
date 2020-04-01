package com.kh.portfolio.board4.dao;

import java.util.List;

import com.kh.portfolio.board4.vo.RboardVO4;

public interface RboardDAO4 {

	//댓글 작성
	int write(RboardVO4 rboardVO4);
	
	//댓글 목록
	List<RboardVO4> list(int bnum, int startRec, int endRec); 
	
	//댓글 수정
	int modify(RboardVO4 rboardVO4);
	
	//댓글 삭제
	int delete(String rnum);
	
	//대댓글 작성
	int reply(RboardVO4 rboardVO4);
	
	//이전댓글 step 업데이트
	int updateStep(int rgroup, int rstep);
	
	//댓글정보 읽어오기
	RboardVO4 replyView(long rnum);
	
	//댓글 총계
	int replyTotalRec(String bnum);
}
