package com.kh.portfolio.board2.svc;
/*
 * 용병모집
 */

import java.util.List;

import com.kh.portfolio.board2.vo.RboardVO2;

public interface RboardSVC2 {
	//댓글 작성
	int write(RboardVO2 rboardVO2);
	
	//댓글 목록
	List<RboardVO2> list(int bnum, int startRec, int endRec); 
	
	//댓글 수정
	int modify(RboardVO2 rboardVO2);
	
	//댓글 삭제
	int delete(String rnum);
	
	//대댓글 작성
	int reply(RboardVO2 rboardVO2);
	
	//댓글 총계
	int replyTotalRec(String bnum);
}
