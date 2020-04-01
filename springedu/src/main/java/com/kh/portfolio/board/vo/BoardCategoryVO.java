package com.kh.portfolio.board.vo;
/*
 * 커뮤니티 게시판
 */
import javax.persistence.Entity;
import javax.validation.constraints.Positive;

import lombok.Data;

@Entity
@Data
public class BoardCategoryVO {
	@Positive(message = "게시판을 선택하세요!") // value 가 1이상 이 아니면 오류남
	private long cid;     //NOT NULL NUMBER(10)    
	private String cname; //NOT NULL VARCHAR2(60)
}
