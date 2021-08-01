package com.tigerWhale.util;

import lombok.Data;

@Data
public class SearchPageCriteria {
	
	private int pageNum; // 페이지 번호
	private int amount; // 1페이지당 게시글 수
	private int c_code; // 카테고리 분류 정보
	
	//검색 타입
	private String searchType;
	private String searchType2;
	private String typeValue;
	//검색에 필요한 키워드
	private String searchName;
	
	public SearchPageCriteria() {
		this(1, 12); // 기본값으로 페이지번호 1, 12개씩 보기 설정
	}
	
	public SearchPageCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
}
