package com.tigerWhale.header.mapper;

import java.util.ArrayList;

import com.tigerWhale.command.CategoryBoardVO;

public interface HeaderMapper {

	public ArrayList<CategoryBoardVO> getBig();
	public ArrayList<CategoryBoardVO> getMid(String bigCategory);
	public ArrayList<CategoryBoardVO> getSmall(String middleCategory);
	
}
