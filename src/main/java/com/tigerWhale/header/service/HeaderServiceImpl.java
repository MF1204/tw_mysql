package com.tigerWhale.header.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tigerWhale.command.CategoryBoardVO;
import com.tigerWhale.header.mapper.HeaderMapper;


@Service("headerService")
public class HeaderServiceImpl implements HeaderService {

	@Autowired
	private HeaderMapper headerMapper;
	
	@Override
	public ArrayList<CategoryBoardVO> getBig() {
		return headerMapper.getBig(); 
	}
	
	@Override
	public ArrayList<CategoryBoardVO> getMid(String bigCategory) {
		return headerMapper.getMid(bigCategory);
	}
	
	@Override
	public ArrayList<CategoryBoardVO> getSmall(String middleCategory) {
		return headerMapper.getSmall(middleCategory);
	}
}
