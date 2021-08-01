package com.tigerWhale.join.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tigerWhale.command.UsersVO;
import com.tigerWhale.join.mapper.JoinMapper;

@Service("joinService")
public class JoinServiceImpl implements JoinService {

	@Autowired
	private JoinMapper joinMapper;
	
	@Override
	public int join(UsersVO vo) {

		return joinMapper.join(vo);
	}

	@Override
	public int idCheck1(UsersVO vo) {
		
		System.out.println(vo);
		return joinMapper.idCheck1(vo);
	}

	@Override
	public UsersVO login(UsersVO vo) {
		
		return joinMapper.login(vo);
	}

	@Override
	public UsersVO getinfo1(String user_ID) {
		
		return joinMapper.getinfo1(user_ID);
	}


	
}
