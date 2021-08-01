package com.tigerWhale.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tigerWhale.command.UsersVO;
import com.tigerWhale.users.service.UsersService;

@Controller
@RequestMapping("/mypage")

public class MypageController {
	@Autowired
	@Qualifier("usersService")
	private UsersService usersService;

	@RequestMapping("/mypage")
	public String userMypage() {

		return "mypage/mypage";
	}

	@RequestMapping("/mypage-email")
	public String userMypageEmail() {

		return "mypage/mypage-email";
	}

	@RequestMapping(value = "/emailForm")
	public String emailUsers(UsersVO vo) {
		System.out.println(vo.toString());
		usersService.emailUpdate(vo);

		return "redirect:/";
	}

	@RequestMapping("/mypage-password")
	public String userMypagePW() {

		return "mypage/mypage-password";
	}

	@RequestMapping(value = "/passwordForm")
	public String pwUsers(UsersVO vo, HttpSession session, Model model, @RequestParam("user_PW") String newPW, @RequestParam("checkPW") String checkPW) {
		
		if(newPW.equals(checkPW)) {
			usersService.passwordUpdate(vo);
			session.invalidate();
			System.out.println("비밀번호 컨트롤러 통과");
			return "redirect:/";
		} else {
			model.addAttribute("msg", false);
			return "mypage/mypage-password";
		}
	}

	@RequestMapping("/mypage-phone")
	public String userMypagePhoneNum() {
		
		return "mypage/mypage-phone";
	}

	@RequestMapping(value = "/phoneForm")
	public String phoneUsers(UsersVO vo) {
		usersService.phoneUpdate(vo);
		return "redirect:/";
	}

	@RequestMapping("/mypageModify")
	public String userMypageModify() {

		return "mypage/mypageModify";
	}

	@RequestMapping("/mypageDelete")
	public String userMypageDelete() {

		return "mypage/mypageDelete";
	}

	@RequestMapping(value = "/deleteForm")
	public String deleteUsers(UsersVO vo, HttpSession session, Model model) {
		UsersVO users = (UsersVO)session.getAttribute("usersVO");
		String oldPW = users.getUser_PW();
		String newPW = vo.getUser_PW();
		if(oldPW.equals(newPW)) {
			usersService.usersDelete(vo);
			session.invalidate();
			return "redirect:/";
		} else {
			model.addAttribute("msg", false);
			return "mypage/mypageDelete";
			
			
		}
	}

}
