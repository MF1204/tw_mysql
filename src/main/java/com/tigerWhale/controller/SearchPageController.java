package com.tigerWhale.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tigerWhale.command.MainBoardVO;
import com.tigerWhale.command.ThumbnailBoardVO;
import com.tigerWhale.command.CategoryBoardVO;
import com.tigerWhale.command.IMGBoardVO;
import com.tigerWhale.searchPage.service.SearchPageService;
import com.tigerWhale.util.SearchPageCriteria;
import com.tigerWhale.util.SearchPagePageVO;

@Controller
public class SearchPageController {
	
	@Autowired
	@Qualifier("searchPageService")
	private SearchPageService searchPageService;
	private SearchPageCriteria cri = new SearchPageCriteria();
	
	@RequestMapping("/searchPage/keyword")
	public String Keyword(@RequestParam("keyword") String searchName,
						   Model model) {
		cri.setSearchName(searchName);
		int total = searchPageService.searchTotal(cri);
		ArrayList<ThumbnailBoardVO> thumbnailList = new ArrayList<>();
		if(total == 0) {
			thumbnailList = null;
		} else {
			thumbnailList = searchPageService.keywordSearch(cri);			
		}
		model.addAttribute("thumbnailList", thumbnailList);
		System.out.println("백만스물하나");
		return "searchPage";
	}
	
	@RequestMapping("/searchPage")
	public String bigSearch(@RequestParam("searchType") String searchType, //카테고리 분류
							@RequestParam("typeValue") String typeValue, // 카테고리 이름
							Model model, SearchPageCriteria cri) {
		
		System.out.println(searchType.toString());
		System.out.println(typeValue.toString());
		
		//화면에 넘어갈 타이틀
		String bigTitle = "";
		//화면에 넘어갈 카테고리 분류
		ArrayList<CategoryBoardVO> middleList = new ArrayList<>();
		ArrayList<CategoryBoardVO> smallList = new ArrayList<>();
		//화면에 넘어갈 게시물
		String criType = "";
		ArrayList<MainBoardVO> pageList = new ArrayList<>();
		ArrayList<ThumbnailBoardVO> thumbnailList = new ArrayList<>();
		int total = 0;
		
		//검색분류
		if(searchType.equals("bigCategory")) {
			System.out.println("big으로만 검색시");
			criType = "bigCategory";
			bigTitle = typeValue;
			cri.setTypeValue(bigTitle);
			
		} else if(searchType.equals("middleCategory")) {
			System.out.println("middle로 검색시");
			criType = "middleCategory";
			bigTitle = searchPageService.getCategory(typeValue).get(0).getBigCategory();
			cri.setTypeValue(typeValue);
			
		} else if(searchType.equals("c_code")) {
			System.out.println("c_code로 검색시");
			criType = "c_code";
			int c_code = Integer.parseInt(typeValue);
			CategoryBoardVO getPath = searchPageService.getBig(c_code);
			bigTitle = getPath.getBigCategory();
			
			cri.setC_code(c_code);
			model.addAttribute("path", getPath);
			
		}
		cri.setSearchType(criType);
		System.out.println(cri.toString());
		total = searchPageService.getTotal(cri);
		middleList = searchPageService.getMiddleList(bigTitle);
		smallList = searchPageService.getSmallList(bigTitle);
		if(total == 0) {
			thumbnailList = null;
		} else {
			thumbnailList = searchPageService.thumbnailList(cri);			
		}
		SearchPagePageVO pageVO = new SearchPagePageVO(cri, total);
		
		model.addAttribute("cri", cri);
		model.addAttribute("bigTitle", bigTitle); //화면에 들어갈 bigCategory명
		model.addAttribute("middleList", middleList);
		model.addAttribute("smallList", smallList);
		model.addAttribute("thumbnailList", thumbnailList);
		model.addAttribute("pageVO", pageVO);
		return "searchPage";
		
	}
	
}
