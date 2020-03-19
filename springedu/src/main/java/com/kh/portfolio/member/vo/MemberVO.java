package com.kh.portfolio.member.vo;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import javax.persistence.Entity;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Entity
@Data
public class MemberVO {
  @NotNull // 멤버필드의 값이 널이면 안된다.
	@Pattern(regexp = "^\\w+@\\w+\\.\\w+(\\.\\w+)?$", message = "s:ex)aaa.@bbb.com")
  @Size(min = 10, max = 40, message = "아이디는 40글자 미만으로 입력하세요")
	private String id;
	
	@NotNull
	@Pattern(regexp = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{6,15}$", message = "비밀번호는 특수문자,영문, 숫자 포함 6~15자리로 입력바랍니다.")
	private String pw;
	
 @NotNull
 @Pattern(regexp = "^\\d{3}-\\d{3,4}-\\d{4}$", message = "s:ex)010-1234-5678")
	private String tel;
	
  @NotNull
	@Size(min = 2, max = 4, message = "이름은 2~4글자 입니다.")
	private String name;
	
  @NotNull(message = "성별을 선택하세요")	
	private String gender;
  
  @NotNull
	@Pattern(regexp = "^[^0]+$", message = "지역을 선택하세요!")
	private String region;
	

	/* @JsonFormat(pattern = "yyyy-MM-dd") */
	private Date birth;
	private Timestamp cdate;
	private Timestamp udate;
	
	//사진 등록
	private MultipartFile file;
	private byte[] fdata;					//첨부파일
	private String fname;					
	private long fsize;						
}
