package com.tigerWhale.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.nio.file.Files;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.tigerWhale.command.APP_CONSTANT;
import com.tigerWhale.command.UsersVO;
import com.tigerWhale.users.service.UsersService;

@Controller
@RequestMapping("/mypage")

public class MypageController {
	@Autowired
	@Qualifier("usersService")
	private UsersService usersService;

	@RequestMapping("/mypage")
	public String userMypage(HttpSession session, Model model) {
		String id = (String) session.getAttribute("usersId");
		UsersVO vo = usersService.getInfo(id);
		model.addAttribute("usersVO",vo);

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
	public String userMypageModify(HttpSession session, Model model) {
		String id = (String) session.getAttribute("usersId");
		UsersVO vo = usersService.getInfo(id);
		model.addAttribute("usersVO",vo);
		
		

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
	@ResponseBody
	@RequestMapping(value = "/profileUpload", method = RequestMethod.POST)
	public String snsupload(@RequestParam("file") MultipartFile file,
			HttpSession session) {

		UsersVO usersVO = (UsersVO) session.getAttribute("usersVO");

		try {
			System.out.println(file);

			String fileLoca = "userIMG";
			File folder = new File(APP_CONSTANT.UPLOAD_PATH + "\\" + fileLoca);
			if (!folder.exists()) {
				folder.mkdir();
			}
			String fileRealName = file.getOriginalFilename();
			Long size = file.getSize();
			// 저장된 전체 경로
			String uploadPath = folder.getPath();

			String fileExtention = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());

			String fileName = usersVO.getUser_ID() + fileExtention;

			System.out.println("폴더위치 " + fileLoca);
			System.out.println("원본파일명" + fileRealName);
			System.out.println("사이즈" + size);
			System.out.println("업로드경로" + uploadPath);
			System.out.println("업로드파일명" + fileName + fileExtention);

			File saveFile = new File(uploadPath + "\\" + fileName);
			System.out.println(saveFile);
			file.transferTo(saveFile);
			; // 파일 쓰기
			System.out.println("2");

			System.out.println("3");
			String result = usersService.profileUpdate(usersVO);
			System.out.println(result);
			if (result != null) {
				return "success";

			} else {
				return "fail";
			}

		} catch (NullPointerException e) {
			return "idFail";
		} catch (Exception e) {
			return "fail";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/view/{fileName}", produces = MediaType.IMAGE_JPEG_VALUE)
	public ResponseEntity<byte[]> view (@PathVariable("fileLoca") String fileLoca,
						@PathVariable("fileName") String fileName) throws Exception {
		//파일데이터 바이트 데이터로 변환해서 반환
		
			InputStream imageStream = new FileInputStream(APP_CONSTANT.UPLOAD_PATH + "\\" + fileLoca + "\\" + fileName);
			byte[] imageByteArray = IOUtils.toByteArray(imageStream);
			imageStream.close();
			return new ResponseEntity<byte[]>(imageByteArray, HttpStatus.OK);
	}

}
