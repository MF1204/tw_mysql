package com.tigerWhale.searchPage.service;

import java.util.ArrayList;

import com.tigerWhale.command.CategoryBoardVO;
import com.tigerWhale.command.MainBoardVO;
import com.tigerWhale.command.ThumbnailBoardVO;
import com.tigerWhale.util.SearchPageCriteria;


public interface SearchPageService {

	public ArrayList<CategoryBoardVO> getCategory(String middleCategory);
	public CategoryBoardVO getBig(int c_code);
	public ArrayList<CategoryBoardVO> getMiddleList(String bigCategory);
	public ArrayList<CategoryBoardVO> getSmallList(String bigCategory);
	public ArrayList<MainBoardVO> getList(SearchPageCriteria cri);
	public int searchTotal(SearchPageCriteria cri);
	public ArrayList<ThumbnailBoardVO> keywordSearch(SearchPageCriteria cri);
	public ArrayList<ThumbnailBoardVO> thumbnailList(SearchPageCriteria cri);
	public int getTotal(SearchPageCriteria cri);
	
}
