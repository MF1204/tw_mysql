package com.tigerWhale.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tigerWhale.command.CategoryBoardVO;
import com.tigerWhale.header.service.HeaderService;

@Controller
@RequestMapping("*")
public class HeadController {

	@Autowired
	@Qualifier("headerService")
	private HeaderService headerService;


	//조회메서드 getCate
	@ResponseBody
	@GetMapping(value = "**/getHead/big", produces = "application/json; charset=utf8")
	public ArrayList<CategoryBoardVO> getBig() {
		
//		System.out.println("bigCate 출력");
		ArrayList<CategoryBoardVO> bigList = headerService.getBig();
		
		return bigList;
	}
	
	@ResponseBody
	@GetMapping(value = "**/getHead/mid/{bigCategory}", produces = "application/json; charset=utf8")
	public ArrayList<CategoryBoardVO> getMid(@PathVariable("bigCategory") String bigCategory) {
		
//		System.out.println("midopen");
//		System.out.println(bigCategory);
		
		ArrayList<CategoryBoardVO> midList = headerService.getMid(bigCategory);
		System.out.println(midList.toString());
		return midList;
	}

	@ResponseBody
	@GetMapping(value = "**/getHead/mid/{bigCategory}/{big2}", produces = "application/json; charset=utf8")
	public ArrayList<CategoryBoardVO> getMid(@PathVariable("bigCategory") String bigCategory,
												@PathVariable("big2") String big2) {
		
		String realName = bigCategory + "/" + big2;
//		System.out.println("midopen");
//		System.out.println(realName);
		
		ArrayList<CategoryBoardVO> midList = headerService.getMid(realName);
//		System.out.println(midList.toString());
		return midList;
	}
	
	@ResponseBody
	@GetMapping(value = "**/getHead/sm/{middleCategory}", produces = "application/json; charset=utf8")
	public ArrayList<CategoryBoardVO> getSmall(@PathVariable("middleCategory") String middleCategory) {
//		System.out.println("smopen");
//		System.out.println(middleCategory);
		
		ArrayList<CategoryBoardVO> smList = headerService.getSmall(middleCategory);
//		System.out.println(smList.toString());
		return smList;
	}
	
	@ResponseBody
	@GetMapping(value = "**/getHead/sm/{middleCategory}/{mid2}", produces = "application/json; charset=utf8")
	public ArrayList<CategoryBoardVO> getSmall(@PathVariable("middleCategory") String middleCategory,
												@PathVariable("mid2") String mid2) {
//		System.out.println("smopen");
//		System.out.println(middleCategory);
		
		String realName = middleCategory + "/" + mid2;
		ArrayList<CategoryBoardVO> smList = headerService.getSmall(realName);
//		System.out.println(smList.toString());
		return smList;
	}
}
