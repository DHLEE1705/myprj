package com.kh.portfolio.board4.vo;

import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.kh.portfolio.board.vo.BoardCategoryVO;

import lombok.Data;

@Entity
@Data
public class BoardVO4 {
	private long bnum;    
	@Valid //계층형 유효성 검사시 @Valid를 추가한다.
	private BoardCategoryVO boardCategoryVO;
	@NotNull
	@Pattern(regexp = "^[^0]+$", message = "매치방식을 선택하세요!")
	private String matchmethod;
	@NotNull
	@Pattern(regexp = "^[^0]+$", message = "실력을 선택하세요!")
	private String skill;
	@NotNull
	@Pattern(regexp = "^[^0]+$", message = "매너를 선택하세요!")
	private String manner;
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date mdate;
	private String stime;
	private String etime;
	@NotNull(message="참가비를 입력해주세요!")
	@Size(min=2, message="참가비를 입력해주세요!")
	private String money;
	@NotNull
	private String bid;						//BID       NOT NULL VARCHAR2(40)  
	private String bname;			//BNICKNAME NOT NULL VARCHAR2(30)  
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Timestamp	bcdate;			//BCDATE    NOT NULL TIMESTAMP(6) 
	private Timestamp budate;			//BUDATE             TIMESTAMP(6)       
	@NotNull(message="내용을 입력해주세요!")
	@Size(min=4, message="내용은 최소	 4자 이상 입력가능합니다.")
	private String bcontent;			//BCONTENT  NOT NULL CLOB          
	private String matchstatus;
	@NotNull(message="경기 장소를 입력해주세요!")
	@Size(min=2, message="경기 장소를 입력해주세요!")
	private String matchregion;
	private String btel;
	private String latitude;
	private String longitude;
	private String mapregion;
	private int cnt;
	
}
