package com.kh.portfolio.board.vo;

import javax.persistence.Entity;
import javax.validation.constraints.Positive;

import lombok.Data;

@Entity
@Data
public class BoardCategoryVO {
	/* @NotNull(message = "분류를 선택하세요!") */
	/* @Min(value = 1, message = "분류를 선택해주세요") */
	@Positive(message = "게시판을 선택하세요!") // value 가 1이상 이 아니면 오류남
//@Pattern(regexp = "^[^0]+$", message = "선택하세요!")
	private long cid;     //NOT NULL NUMBER(10)    
	private String cname; //NOT NULL VARCHAR2(60)
}
