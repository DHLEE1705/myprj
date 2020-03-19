package com.kh.portfolio.controller;

import javax.persistence.Entity;
import javax.validation.constraints.Max;

import lombok.Data;

@Data
@Entity
public class Person {
	String name;
	@Max(value=30, message = "30살 이하로 입력하세요!")
	int age;

}
