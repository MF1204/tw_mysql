package com.tigerWhale.controller;

import org.springframework.beans.factory.annotation.Autowired;
import javax.servlet.http.HttpSession;

import com.tigerWhale.command.UsersVO;
import com.tigerWhale.join.service.JoinService;
import java.io.PrintStream;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/users")
public class JoinController {
	
	@Autowired
	@Qualifier("joinService")
    private JoinService joinService;
	
	//회원가입 화면
	@RequestMapping("/join")
    public String userJoin() {
        return "users/join";
    }
	
	//로그인 화면
	@RequestMapping("/loginPage2")
    public String userLogin() {
        return "users/userLogin";
    }
	
	// ResponseBody = 요청 처리한곳으로 다시 되돌려줌
	@ResponseBody
	@PostMapping(value = "/idCheck1", produces = "application/json")
    public int idCheck1(@RequestBody UsersVO vo) {
        
		//중복체크함수
		int result = joinService.idCheck1(vo);
		return result;
    }
	
	@RequestMapping(value = "/joinPage", method = RequestMethod.POST)
    public String joinPage(UsersVO vo,
    						RedirectAttributes RA)
    {
        System.out.println(vo.getUser_ID());
        System.out.println(vo.getUser_PW());
        System.out.println(vo.getUserAdress());
        System.out.println(vo.getUserEmail1());
        System.out.println(vo.getUserEmail2());
        System.out.println(vo.getUserPhoneNumber());
        System.out.println(vo.getUserGender());
        
        //float ma = Float.parseFloat(ma2);
        //float la = Float.parseFloat(la2);
        int result = joinService.join(vo);
        if(result == 1) {
            RA.addFlashAttribute("msg", "가입을 축하합니다");
            
        } else {
            RA.addFlashAttribute("msg", "가입 실패했습니다. 다시 시도해 주세요.");
        }
        return "redirect:/users/userLogin";
    }
	
	@RequestMapping("/userMypage2")
    public String mypage(HttpSession session, Model model)
    {
        UsersVO vo = (UsersVO)session.getAttribute("userVO");
        String user_ID = vo.getUser_ID();
        
        UsersVO userInfo = joinService.getinfo1(user_ID);
		System.out.println(userInfo);
        model.addAttribute("userInfo", userInfo);
        return "users/userMapage2";
    }

	//post핸들러를 이용한 로그인 요청 
	@RequestMapping(value = "/loginForm2", method = RequestMethod.POST)
    public ModelAndView login(UsersVO vo) {
        UsersVO vo2 = joinService.login(vo);
        ModelAndView mv = new ModelAndView();
		mv.addObject("login", vo2 );
		System.out.println("로그인 성공!!!!!!!!!!!!!!");
        if(vo2 != null)
            mv.addObject("login", vo2);
        else
            mv.addObject("msg", "로그인에 실패했습니다.");
        return mv;
    }

	@RequestMapping("/userLogout2")	
    public String logout(HttpSession session)
    {
        session.invalidate();
        return "redirect:/";
    }

}
