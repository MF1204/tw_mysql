package com.tigerWhale.util;

import lombok.Data;

@Data //게터, 세터, toString
public class PageVO {
	
	private int startPage; //첫페이지 번호
	private int endPage; //마지막페이지 번호
	private boolean next; //다음 버튼 활성화
	private boolean prev; //이전 버튼 활성화
	
	private int total; //총 게시글 수
	private int pageNum; //조회하는 페이지번호 (cri도 존재함)
	private int amount; //보여질 데이터 개수
	
	private FaqCriteria cri;
	//생성자
	public PageVO(FaqCriteria cri, int total) {
		//번호, 개수, 총 게시글 수 초기화
		this.pageNum = cri.getPageNum();
		this.amount = cri.getAmount();
		this.total = total;
		this.cri = cri;
		
		//끝페이지
		//pageNum이 5번 -> 끝페이지번호는 10
		//pageNum이 11번 -> 끝페이지 번호는 20
		//(int)Math.ceil( pageNum / 보여질 페이지 수) * 보여질 페이지 수
		this.endPage = (int)Math.ceil( this.pageNum / 10.0 ) * 10;
		
		//시작페이지
		//끝페이지 - 보여질페이지 수  + 1
		this.startPage = this.endPage - 10 + 1;
		
		//실제 마지막 번호
		//예를 들어 게시글이 53개 -> 마지막 끝 페이지 번호는 6
		//예를 들어 게시글이 112개 -> 마지막 끝 페이지 번호는 12
		//(int)Math.ceil( 전체게시글 수 / 화면에 뿌려질 데이터 amount값)
		int realEnd = (int)Math.ceil( this.total / (double)this.amount );
		
		//endPage를 다시계산
		//예를 들어서 404개의 게시글
		//페이지넘버 31번 -> endPage공식 40, realEnd는 41
		//페이지넘버 41번 -> endPage공식 50, realEnd는 41
		if(this.endPage > realEnd) { 
			this.endPage = realEnd; //즉 마지막에 도달했을 때 보여질 번호를 변경
		}
		
		//이전버튼 활성화 여부 - 1보다크면 활성화
		//startPage는 1, 11, 21, 31......
		this.prev = this.startPage > 1;
		
		//다음버튼 활성화 여부 - 
		this.next = realEnd > this.endPage;
		
	}
	
	
}
