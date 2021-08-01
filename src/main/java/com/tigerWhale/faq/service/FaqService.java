package com.tigerWhale.faq.service;

import java.util.ArrayList;

import com.tigerWhale.command.FaqVO;
import com.tigerWhale.util.FaqCriteria;


public interface FaqService {

	public int regist(FaqVO vo); //등록
	public int getTotal(FaqCriteria cri); //전체게시글 수
	public ArrayList<FaqVO> getList(FaqCriteria cri);
//	public ArrayList<FaqVO> getList(); //조회
	public int replyForm(FaqVO vo); //등록
	
	public FaqVO getDetail(int bno); //상세
	public int update(FaqVO vo); //수정
	public int delete(int bno); //삭제
	
}
