package com.tigerWhale.header.service;

import java.util.ArrayList;

import com.tigerWhale.command.CategoryBoardVO;

public interface HeaderService {

	public ArrayList<CategoryBoardVO> getBig();
	public ArrayList<CategoryBoardVO> getMid(String bigCategory);
	public ArrayList<CategoryBoardVO> getSmall(String middleCategory);
	
}
