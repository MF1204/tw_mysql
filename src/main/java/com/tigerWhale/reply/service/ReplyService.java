package com.tigerWhale.reply.service;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.tigerWhale.command.CustomerBoardVO;
import com.tigerWhale.command.ReplyBoardVO;
import com.tigerWhale.util.ReplyCriteria;

public interface ReplyService {
	public int regist(ReplyBoardVO vo);
	public ArrayList<ReplyBoardVO> getList(@Param("bno") int bno, @Param("cri") ReplyCriteria cri);
	public int getTotal(int bno); //전체댓글 수
	
	public int pwCheck(ReplyBoardVO vo);  //비밀번호 확인
	public int update(ReplyBoardVO vo); //수정
	public int delete(ReplyBoardVO vo);
	
	public int customer(CustomerBoardVO vo); //구매자

}
