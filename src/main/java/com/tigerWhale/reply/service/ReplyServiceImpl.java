package com.tigerWhale.reply.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tigerWhale.command.CustomerBoardVO;
import com.tigerWhale.command.ReplyBoardVO;
import com.tigerWhale.reply.mapper.ReplyMapper;
import com.tigerWhale.util.ReplyCriteria;

@Service("replyService") 
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyMapper replymapper;
	@Override
	public int regist(ReplyBoardVO vo) {
		return replymapper.regist(vo);
	}

	@Override
	public ArrayList<ReplyBoardVO> getList(int bno, ReplyCriteria cri) {
		// TODO Auto-generated method stub
		return replymapper.getList(bno, cri);
	}

	@Override
	public int getTotal(int bno) {
		// TODO Auto-generated method stub
		return replymapper.getTotal(bno);
	}

	@Override
	public int pwCheck(ReplyBoardVO vo) {
		// TODO Auto-generated method stub
		return replymapper.pwCheck(vo);
	}

	@Override
	public int update(ReplyBoardVO vo) {
		// TODO Auto-generated method stub
		return replymapper.update(vo);
	}

	@Override
	public int delete(ReplyBoardVO vo) {
		// TODO Auto-generated method stub
		return replymapper.delete(vo);
	}

	@Override
	public int customer(CustomerBoardVO vo) {
		// TODO Auto-generated method stub
		return replymapper.customer(vo);
	}

}
