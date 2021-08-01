package com.tigerWhale.mainBoard.mapper;

import java.util.ArrayList;

import com.tigerWhale.command.CategoryBoardVO;
import com.tigerWhale.command.MainBoardVO;
import com.tigerWhale.command.UsersVO;

public interface MainBoardMapper 
{
	public ArrayList<MainBoardVO> getPopularPage();
	public ArrayList<MainBoardVO> getRecentBoard();
	public ArrayList<MainBoardVO> getBestBoard();
	public ArrayList<MainBoardVO> getNearBoard(UsersVO vo);
	public ArrayList<CategoryBoardVO> nearCategory(CategoryBoardVO vo);
	public ArrayList<CategoryBoardVO> getCategoryCode(CategoryBoardVO vo);
	
}
