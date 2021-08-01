package com.tigerWhale.util.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.tigerWhale.command.UsersVO;

public class LoginSuccessHandler extends HandlerInterceptorAdapter {

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		System.out.println("handler");
		ModelMap mv = modelAndView.getModelMap();
		
		UsersVO usersVO = (UsersVO) mv.get("login");
		
		if(usersVO != null) { //로그인성공
			//세션에 저장
			HttpSession session = request.getSession();
			session.setAttribute("usersVO", usersVO);
			session.setAttribute("usersId", usersVO.getUser_ID());
			session.setAttribute("usersLa", usersVO.getLa());
			session.setAttribute("usersMa", usersVO.getMa());
			System.out.println("home");
			
			response.sendRedirect(request.getContextPath()); //홈화면으로
			System.out.println("home2");
		}
		modelAndView.setViewName("users/login");
	}

	
}
