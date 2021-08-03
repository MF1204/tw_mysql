package com.tigerWhale.mainBoard.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tigerWhale.command.CategoryBoardVO;
import com.tigerWhale.command.MainBoardVO;
import com.tigerWhale.command.UsersVO;
import com.tigerWhale.mainBoard.mapper.MainBoardMapper;

@Service("mainBoardService")
public class MainBoardServiceImp implements MainBoardService {

	@Autowired
	private MainBoardMapper mainBoardMapper;
	
	@Override
	public ArrayList<MainBoardVO> getPopularPage() {
		
		return mainBoardMapper.getPopularPage();
	}

	@Override
	public ArrayList<MainBoardVO> getRecentBoard() {
		return mainBoardMapper.getRecentBoard();
	}

	@Override
	public ArrayList<MainBoardVO> getBestBoard() {
		return mainBoardMapper.getBestBoard();
	}

	@Override
	public ArrayList<MainBoardVO> getNearBoard(UsersVO vo) {
		return mainBoardMapper.getNearBoard(vo);
	}

	@Override
	public ArrayList<CategoryBoardVO> nearCategory(CategoryBoardVO vo) {
		// TODO Auto-generated method stub
		return mainBoardMapper.nearCategory(vo);
	}

	@Override
	public ArrayList<CategoryBoardVO> getCategoryCode(CategoryBoardVO vo) {
		// TODO Auto-generated method stub
		return mainBoardMapper.getCategoryCode(vo);
	}

}
