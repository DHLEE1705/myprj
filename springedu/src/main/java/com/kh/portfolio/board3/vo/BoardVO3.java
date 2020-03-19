package com.kh.portfolio.board3.vo;

import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Positive;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.kh.portfolio.board.vo.BoardCategoryVO;

import lombok.Data;

@Entity
@Data
public class BoardVO3 {
	private long bnum;    
	@Valid //계층형 유효성 검사시 @Valid를 추가한다.
	private BoardCategoryVO boardCategoryVO;
	@NotNull
	@Pattern(regexp = "^[^0]+$", message = "지역을 선택하세요!")
	private String region;
	@Pattern(regexp = "^[^0]+$", message = "실력을 선택하세요!")
	private String skill;
	@Pattern(regexp = "^[^0]+$", message = "매너를 선택하세요!")
	private String manner;
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date pdate;
	@NotNull
	private String bid;						//BID       NOT NULL VARCHAR2(40)  
	private String bname;			//BNICKNAME NOT NULL VARCHAR2(30)  
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Timestamp	bcdate;			//BCDATE    NOT NULL TIMESTAMP(6)  
	private Timestamp budate;			//BUDATE             TIMESTAMP(6)    
	
	@NotNull(message="내용을 입력해주세요!")
	@Size(min=4, message="내용은 최소	 4자 이상 입력가능합니다.")
	private String bcontent;			//BCONTENT  NOT NULL CLOB          				
	private String btel;
	private MultipartFile file;
	private byte[] fdata;					//첨부파일
	private String fname;					
	private long fsize;	
}
