package com.tigerWhale.util;


import lombok.Data;

@Data
public class ReplyCriteria {

	private int pageNum;
	private int amount;
	
	//검색에 필요한 키워드 선언
	private String searchType; 
	private String searchName;
		
	
	public ReplyCriteria() {
		this(1, 10);
	}
	
	public ReplyCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
}
