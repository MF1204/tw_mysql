package com.tigerWhale.util.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.tigerWhale.command.UsersVO;

public class UserAuthHandler  extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		//현재 세션을 얻는다
		HttpSession session = request.getSession();
		System.out.println("인터셉터wqdawdasdasdasdasdqwdawds1");
		
		//로그인될ㄸ ㅐ 생성
		UsersVO userVO =  (UsersVO)session.getAttribute("usersVO");
		if(userVO == null)
		{
			System.out.println("인터셉터2");
			response.sendRedirect(request.getContextPath()+"/users/userLogin");
			return false;
		}
		else {
			return true;
		}
	}
	

}