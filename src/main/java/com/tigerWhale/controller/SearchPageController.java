package com.tigerWhale.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

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
import com.tigerWhale.searchPage.service.SearchPageService;
import com.tigerWhale.util.SearchPageCriteria;
import com.tigerWhale.util.SearchPagePageVO;

@Controller
public class SearchPageController {
	
	@Autowired
	@Qualifier("searchPageService")
	private SearchPageService searchPageService;
	private SearchPageCriteria cri = new SearchPageCriteria();
	
	@RequestMapping("/searchPage")
	public String bigSearch(SearchPageCriteria cri,
							Model model) {
		
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
		if(cri.getSearchType().equals("bigCategory")) {
			System.out.println("big으로만 검색시");
			criType = "bigCategory";
			bigTitle = cri.getTypeValue();
			cri.setTypeValue(bigTitle);
			
		} else if(cri.getSearchType().equals("middleCategory")) {
			System.out.println("middle로 검색시");
			criType = "middleCategory";
			bigTitle = searchPageService.getCategory(cri.getTypeValue()).get(0).getBigCategory();
			//cri.setTypeValue(typeValue);
			
		} else if(cri.getSearchType().equals("c_code")) {
			System.out.println("c_code로 검색시");
			criType = "c_code";
			int c_code = Integer.parseInt(cri.getTypeValue());
			CategoryBoardVO getPath = searchPageService.getBig(c_code);
			bigTitle = getPath.getBigCategory();
			
			cri.setC_code(c_code);
			model.addAttribute("path", getPath);
		} else if(cri.getSearchType().equals("head")) {
			criType = "head";
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
