package com.tigerWhale.searchPage.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tigerWhale.command.CategoryBoardVO;
import com.tigerWhale.command.MainBoardVO;
import com.tigerWhale.command.ThumbnailBoardVO;
import com.tigerWhale.searchPage.mapper.SearchPageMapper;
import com.tigerWhale.util.SearchPageCriteria;


@Service("searchPageService")
public class SearchPageServiceImpl implements SearchPageService {

	@Autowired
	private SearchPageMapper searchPageMapper;

	@Override
	public ArrayList<CategoryBoardVO> getCategory(String middleCategory) {
		return searchPageMapper.getCategory(middleCategory);
	}
	@Override
	public CategoryBoardVO getBig(int c_code) {
		return searchPageMapper.getBig(c_code);
	}

	@Override
	public ArrayList<CategoryBoardVO> getMiddleList(String bigCategory) {
		return searchPageMapper.getMiddleList(bigCategory);
	}

	@Override
	public ArrayList<CategoryBoardVO> getSmallList(String bigCategory) {
		return searchPageMapper.getSmallList(bigCategory);
	}

	@Override
	public ArrayList<MainBoardVO> getList(SearchPageCriteria cri) {

		System.out.println("서비스임플 통과");

		return searchPageMapper.getList(cri);
	}
	@Override
	public int searchTotal(SearchPageCriteria cri) {
		return searchPageMapper.searchTotal(cri);
	}
	@Override
	public ArrayList<ThumbnailBoardVO> keywordSearch(SearchPageCriteria cri) {
		System.out.println("헤더에서 검색");
		return searchPageMapper.keywordSearch(cri);
	}
	
	@Override
	public ArrayList<ThumbnailBoardVO> thumbnailList(SearchPageCriteria cri) {

		System.out.println("서비스임플 통과");

		return searchPageMapper.thumbnailList(cri);
	}

	@Override
	public int getTotal(SearchPageCriteria cri) {
		System.out.println("getTotal 실행");
		return searchPageMapper.getTotal(cri);

	}

}
