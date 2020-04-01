package com.kh.portfolio.common;

import lombok.Data;

@Data
public class FindCriteria extends RecordCriteria{

	private String searchType;			//검색유형
	private String keyword;					//검색어
	private String category; 

	public FindCriteria(int reqPage) {
		super(reqPage);
	}

	public FindCriteria( String category, int reqPage, String searchType, String keyword) {
		this(reqPage);
		this.category = category;
		this.searchType = searchType;
		this.keyword = keyword;

	}
}
