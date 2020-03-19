package com.kh.portfolio.board4.svc;

import java.util.List;

import com.kh.portfolio.board4.vo.RboardVO4;

public interface RboardSVC4 {
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
	
	//댓글 총계
	int replyTotalRec(String bnum);
}
