package com.tigerWhale.faq.mapper;

import java.util.ArrayList;

import com.tigerWhale.command.FaqVO;
import com.tigerWhale.util.FaqCriteria;


public interface FaqMapper {


	public int regist(FaqVO vo); //등록
//	public ArrayList<FaqVO> getList(); //조회
	public int getTotal(FaqCriteria cri); //전체게시글 수
	
	public ArrayList<FaqVO> getList(FaqCriteria cri);
	public FaqVO getDetail(int bno); //상세
	public int update(FaqVO vo); //수정
	public int delete(int bno); //삭제
	public int replyForm(FaqVO faqVo);
}
