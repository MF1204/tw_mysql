package com.tigerWhale.util;
import lombok.Data;

@Data
public class FaqCriteria {
//이새끼 VO니깐 Criteria{}는 데이터형이다
	private int pageNum;
	private int amount;
	
	//검색에 필요한 키워드 선언
	private String searchType; 
	private String searchName;
		
	
	public FaqCriteria() {
		this(1, 10);
	}
	
	public FaqCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
}
