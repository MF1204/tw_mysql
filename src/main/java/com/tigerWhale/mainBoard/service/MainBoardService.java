package com.tigerWhale.mainBoard.service;

import java.util.ArrayList;

import com.tigerWhale.command.CategoryBoardVO;
import com.tigerWhale.command.MainBoardVO;
import com.tigerWhale.command.PopularBoardVO;
import com.tigerWhale.command.UsersVO;

public interface MainBoardService 
{
	public ArrayList<MainBoardVO> getPopularPage();
	public ArrayList<MainBoardVO> getRecentBoard();
	public ArrayList<MainBoardVO> getBestBoard();
	public ArrayList<MainBoardVO> getNearBoard(UsersVO vo);
	public ArrayList<CategoryBoardVO> nearCategory(CategoryBoardVO vo);
	public ArrayList<CategoryBoardVO> getCategoryCode(CategoryBoardVO vo);
}
