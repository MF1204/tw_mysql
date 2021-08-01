package com.tigerWhale.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tigerWhale.command.UsersVO;
import com.tigerWhale.users.service.UsersService;

@Controller
@RequestMapping("/users/*")
public class LoginController {
	@Autowired
	@Qualifier("usersService")
	private UsersService usersService;
	//가입화면
	@RequestMapping("/userJoin")
	public String userJoin() {
		return "users/userJoin";
	}
	
	//로그인화면
	@RequestMapping("/userLogin")
	public String userLogin() {
		System.out.println("로그인컨트롤러");
		return "users/login";
	}

	
	//로그인
	@RequestMapping(value = "/kakaoLogin", method = RequestMethod.POST)
	public String kakaoLogin(String kakao_ID, Model model, HttpSession session) {
		
		System.out.println(kakao_ID);
		
		UsersVO usersVO = usersService.kakaoLogin(kakao_ID);
		
		if(usersVO == null) {
			model.addAttribute("kakao_ID", kakao_ID);
			return "users/join";
		} else {
			session.setAttribute("kakaoVO", usersVO);
			
			return "forward:loginForm";
		}
		
	}
	
	@RequestMapping(value = "/loginForm", method = RequestMethod.POST)
	public ModelAndView loginForm(UsersVO vo, HttpSession session) {
		
		UsersVO kakaoVO = (UsersVO)session.getAttribute("kakaoVO");
		UsersVO usersVO = null;			
		System.out.println("1");
		if(kakaoVO == null) {
			usersVO = usersService.login(vo);
		} else {
			usersVO = usersService.login(kakaoVO);
		}
		
		ModelAndView mv = new ModelAndView();
		System.out.println("################################");
		System.out.println(usersVO);
		System.out.println("################################");
		if(usersVO != null) { //로그인 성공
			mv.addObject("login", usersVO);
			System.out.println("success");
		} else { //로그인 실패
			mv.addObject("msg", "아이디와 비밀번호를 확인하세요");
			System.out.println("fail");
		}
		System.out.println("mv");
		return mv; //디스패쳐 서블릿으로 반환
	}
	
	
	@RequestMapping("/userLogout")
	public String userLogout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/";
	}
}
