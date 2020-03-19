package com.kh.junit;

import lombok.Data;
//이 클래스는 myweb의 MemberDTO와 같은역할을한다.
@Data
public class StudentVO {
	private String id;
	private String name;
	private int kor;
	private int eng;
	private int mat;
	
}
