package com.kh.portfolio.board.vo;
/*
 * 커뮤니티 게시판
 */
import lombok.Data;

@Data
public class VoteVO {
	private long rnum;     //RNUM 게시글번호
	private long bnum;     //BNUM 게시글번호
  private String rid;    //RID 투표자(회원ID)
	private String vote;   //VOTE 댓글선호도 '1':호감, '2':비호감
}
