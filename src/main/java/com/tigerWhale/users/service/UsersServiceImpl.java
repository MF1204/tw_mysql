package com.tigerWhale.users.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tigerWhale.command.UsersVO;
import com.tigerWhale.users.mapper.UsersMapper;

@Service("usersService")
public class UsersServiceImpl implements UsersService {

	@Autowired
	private UsersMapper usersMapper;

	@Override
	public int idCheck(UsersVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int join(UsersVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public UsersVO login(UsersVO vo) {
		System.out.println("로그인");
		System.out.println(vo);
		System.out.println(usersMapper.login(vo));
		return usersMapper.login(vo);
	}
	@Override
	public UsersVO kakaoLogin(String id) {
		return usersMapper.kakaoLogin(id);
	}

	@Override
	public UsersVO getInfo(String user_ID) {
		return usersMapper.getInfo(user_ID);
	}

	@Override
	public int emailUpdate(UsersVO vo) {
		System.out.println("이메일 서비스");
		return usersMapper.emailUpdate(vo);
		
	}

	@Override
	public int phoneUpdate(UsersVO vo) {
		System.out.println("전화번호 서비스");
		return usersMapper.phoneUpdate(vo);
		
	}

	@Override
	public int passwordUpdate(UsersVO vo) {
		System.out.println("비밀번호서비스");
		return usersMapper.passwordUpdate(vo);
		
	}

	@Override
	public UsersVO usersDelete(UsersVO vo) {
		System.out.println("유저삭제");
		return usersMapper.usersDelete(vo);
		
	}

	
}
