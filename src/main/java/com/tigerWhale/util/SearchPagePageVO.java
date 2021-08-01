package com.tigerWhale.util;

import lombok.Data;

@Data //get,set, toString 생성
public class SearchPagePageVO {

	private int startPage; //첫페이지 번호
	private int endPage; //마지막페이지 번호
	private boolean next; // 다음버튼
	private boolean prev; //이전버튼
	private int total; // 총 게시글 수
	private int pageNum; // 조회하는 페이지 번호( cri 내부에도 존재)
	private int amount; // 페이지당 게시글 수 
	
	private SearchPageCriteria cri;
	//생성자
	public SearchPagePageVO(SearchPageCriteria cri, int total) {
		//번호, 개수, 총 게시글 수 초기화
		this.pageNum = cri.getPageNum();
		this.amount = cri.getAmount();
		this.total = total;
		this.cri = cri;
		
		//끝페이지
		//pageNum이 5 -> 끝페이지는 10
		//pageNum이 11 -> 끝페이지 20
		//공식 = (int)Math.ceil(pageNum / 보여질 페이지 수) * 보여질 페이지 수
		this.endPage = (int)Math.ceil(this.pageNum / 10.0) * 10;
		
		//시작페이지
		//끝페이지 - 보여질 페이지 수 + 1
		this.startPage = this.endPage - 10 + 1;
		
		//실제 마지막 번호
		//게시글 토탈 53 -> 마지막 페이지 끝번호 6
		// 토탈 112 -> 페이지 끝번호 12
		// 공식 = (int)Math.ceil(전체게시글 수 / 화면에 뿌려질 amount값)
		int realEnd = (int)Math.ceil(this.total / (double)this.amount);
		
		//endPage 다시계산
		//total 404 -> endPage공식 = 50, realEnd = 41
		if(this.endPage > realEnd) {
			this.endPage = realEnd; //마지막에 도달시, 보여질 번호를 변경
		}
		
		//이전버튼 활성화 여부
		//startPage는 1, 11, 21.....
		this.prev = this.startPage > 1;
		
		//다음버튼 활성화
		this.next = realEnd > this.endPage;
	}
	
}
