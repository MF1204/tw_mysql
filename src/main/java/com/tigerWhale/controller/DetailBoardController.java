package com.tigerWhale.controller;

import java.io.File;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tigerWhale.command.D_T_boardVO;
import com.tigerWhale.command.IMGBoardVO;
import com.tigerWhale.command.MainBoardVO;
import com.tigerWhale.command.MultiUploadIMGVO;
import com.tigerWhale.command.MultipulD_TVO;
import com.tigerWhale.command.MultipulY_MVO;
//import com.tigerWhale.command.UserIMGBoardVO;
import com.tigerWhale.command.UsersVO;
import com.tigerWhale.command.Y_M_boardVO;
import com.tigerWhale.command.APP_CONSTANT;
import com.tigerWhale.command.CategoryBoardVO;
import com.tigerWhale.command.CustomerBoardVO;
import com.tigerWhale.command.DetailBoardVO;
import com.tigerWhale.command.ReplyBoardVO;
import com.tigerWhale.command.TextBoardVO;
import com.tigerWhale.command.UploadIMGVO;
import com.tigerWhale.detailBoard.service.DetailBoardService;


@Controller
@RequestMapping("/detailBoard")
public class DetailBoardController {
	
	@Autowired
	@Qualifier("detailBoardService")
	private DetailBoardService detailBoardService;
	
	
	
	@RequestMapping("/detailWrite")
	public String detailWrite( HttpServletRequest request , Model model) throws Exception {
		ArrayList<CategoryBoardVO> categoryBoardVO = detailBoardService.getCataGoryALL();


		HttpSession session = request.getSession();
		System.out.println(session.getAttribute("usersVO"));
		
		if(session.getAttribute("usersVO") != null)
		{
			model.addAttribute("usersVO", session.getAttribute("usersVO"));
		}
			
		model.addAttribute("categoryBoardVO", categoryBoardVO);
		return "detailBoard/detailWrite";
		
		
	}
	
	@ResponseBody
	@PostMapping(value = "detailWriteUpdate", produces = "application/json")
	public ArrayList<CategoryBoardVO> detailWriteUpdate(@RequestBody CategoryBoardVO vo) {
		
		ArrayList<CategoryBoardVO> updateCategoryBoardVO  = detailBoardService.getMiddleCataGory(vo);
		System.out.println("바뀐값  " + updateCategoryBoardVO);
		return detailBoardService.getMiddleCataGory(vo);
	}
	
	
	@RequestMapping("/detailselectWrite")
	public String detailselectbuy() {
		return "detailBoard/detailselectWrite";
		
		
	}
	
	
	
	@RequestMapping("/detailWriteMentee")
	public String detailWriteMentee(HttpServletRequest request , Model model) throws Exception{
		ArrayList<CategoryBoardVO> categoryBoardVO = detailBoardService.getCataGoryALL();

		HttpSession session = request.getSession();
		System.out.println(session.getAttribute("usersVO"));
		
		if(session.getAttribute("usersVO") != null)
		{
			model.addAttribute("usersVO", session.getAttribute("usersVO"));
		}
		model.addAttribute("categoryBoardVO", categoryBoardVO);
		return "detailBoard/detailWriteMentee";	
	}
	
	@RequestMapping("/detailTerms")
	public String detailTerms() {
		return "detailBoard/detailTerms";
		
		
	}
	
	@RequestMapping("/detailDelete")
	public String detailDelete(@RequestParam(value="bno") int bno ) {
		int delte = detailBoardService.mainBoarddelete(bno);

		System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
		return "mainPage";
		
		
	}
	
	
	
	@RequestMapping("/detailPage")
	public String detailPage(@RequestParam(value="bno") int bno ,HttpServletRequest request, Model model) {

		System.out.println(bno);
		//===============================================
		
		//
		System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
		HttpSession session = request.getSession();
		UsersVO userVO =  (UsersVO)session.getAttribute("usersVO");
		model.addAttribute("userVO", userVO);
		//===============================================
		
		
		//===============================================
		ArrayList<DetailBoardVO> detaiBoardVO = detailBoardService.getBoardDetail(bno);
		System.out.println("detiBoardVO  " + detaiBoardVO);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@");
		
		MainBoardVO mainBoardVO = detailBoardService.getMainDetail(bno);
		System.out.println("mainBoardVO  " + mainBoardVO);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@");
		
		System.out.println(mainBoardVO.getC_code());
		CategoryBoardVO categoryBoardVO = detailBoardService.getCategory(mainBoardVO.getC_code());
		System.out.println("categoryBoardVO  " + categoryBoardVO);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@");
		
		ArrayList<ReplyBoardVO> repyBoardVO = detailBoardService.getReplyBoard(bno);
		System.out.println("repyBoardVO  " + repyBoardVO);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@");
		
		String user_ID = mainBoardVO.getUser_ID();
		System.out.println( "mainBoardVO" + mainBoardVO);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@");
		
		UsersVO usersVO = detailBoardService.getUserDetail(user_ID);
		System.out.println("usersVO  " + usersVO);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@");
		
		ArrayList<Y_M_boardVO> m_boardVO = detailBoardService.getY_M_board(bno);
		System.out.println("m_boardVO  " + m_boardVO);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@");
		
		ArrayList<D_T_boardVO> d_T_boardVO = detailBoardService.getD_T_board(bno);
		System.out.println("d_T_boardVO  " + d_T_boardVO);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@");
		
		ArrayList<IMGBoardVO> IMGBoardVO = detailBoardService.getIMGBoard(bno);
		System.out.println("IMGBoardVO  " + IMGBoardVO);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@");
		
		TextBoardVO textBoardVO  = detailBoardService.getTextBoard(bno);
		System.out.println("textBoardVO " + textBoardVO );
		System.out.println("@@@@@@@@@@@@@@@@@@@@@");
		
		
		ArrayList<Y_M_boardVO> m_boardVOFirst = detailBoardService.getY_M_boardFisrt(bno);
		System.out.println("m_boardVOFirst " + m_boardVOFirst);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@");
		
		File folder = new File(APP_CONSTANT.UPLOAD_PATH +"\\detailPageImg");
		String uploadPath = folder.getPath();
		
		CustomerBoardVO customerBoardVO = detailBoardService.getCustomerBoard(user_ID);
		

		
		model.addAttribute("customerBoardVO", customerBoardVO);
		model.addAttribute("m_boardVOFirst", m_boardVOFirst);
		model.addAttribute("detaiBoardVO", detaiBoardVO);
		model.addAttribute("d_T_boardVO", d_T_boardVO);
		model.addAttribute("mainBoardVO",mainBoardVO);
		model.addAttribute("replyBoardVO", repyBoardVO);
		model.addAttribute("categoryBoardVO", categoryBoardVO);
		model.addAttribute("usersVO", usersVO);
		model.addAttribute("m_boardVO", m_boardVO);
		model.addAttribute("IMGBoardVO", IMGBoardVO);
		model.addAttribute("textBoardVO", textBoardVO);
		return "detailBoard/detailPage";
	}
	
	@RequestMapping("/detailBuy")
	public String detailBuy(@RequestParam("bno") int bno,
			@RequestParam("rno") int rno ,  HttpServletRequest request ,Model model) throws Exception{
		System.out.println( bno);
		HttpSession session = request.getSession();
		System.out.println(session.getAttribute("usersVO"));
		
		if(session.getAttribute("usersVO") != null)
		{
			model.addAttribute("usersVO", session.getAttribute("usersVO"));
		}
		
		Y_M_boardVO ymBoardVO = detailBoardService.getY_M_One(rno);
		System.out.println(ymBoardVO);
		MainBoardVO mainBoardVO = detailBoardService.getMainDetail(bno);
		System.out.println("mainBoardVO  " + mainBoardVO);
		
		model.addAttribute("ymBoardVO", ymBoardVO);
		model.addAttribute("mainBoardVO",  mainBoardVO);
		return "detailBoard/detailBuy";
	}
	
	@RequestMapping("/detailCustomer")
	public String detailCustomer( HttpServletRequest request ,Model model) throws Exception{
		HttpSession session = request.getSession();
		System.out.println(session.getAttribute("usersVO"));
		
		if(session.getAttribute("usersVO") != null)
		{
			model.addAttribute("usersVO", session.getAttribute("usersVO"));
		}
		
		Y_M_boardVO ymBoardVO = detailBoardService.getY_M_One(123);
		System.out.println(ymBoardVO);
		
		model.addAttribute("ymBoardVO", ymBoardVO);
		return "detailBoard/detailBuy";
	}
	
	
	
	@RequestMapping("/detailInsert")
	public String detailWrite(
			 MultiUploadIMGVO imgvo,
			 MultipulY_MVO vo,
			 MultipulD_TVO dvo,
			@RequestParam("bigCategory") String bigCategory,
			@RequestParam("middleCategory") String middleCategory,
			@RequestParam("smallCategory") String smallCategory,
			
			@RequestParam("boardType") String boardType,
			
			@RequestParam("user_ID") String user_ID,
			@RequestParam("title") String title,
			@RequestParam("money") int price,
			@RequestParam("text") String text,
			
			@RequestParam("text1") String text1,
			@RequestParam("text2") String text2,
			@RequestParam("text3") String text3,
			
			RedirectAttributes RA) {
		System.out.println("===================");
		System.out.println("bigCategory" + bigCategory);
		System.out.println("middleCategory" + middleCategory);
		System.out.println("smallCategory" + smallCategory);
		System.out.println("===================");
		
		System.out.println("boardType" + boardType);
		System.out.println("user_ID"+user_ID);
		System.out.println("title"+title);
		System.out.println("price"+ price);
		
		System.out.println("text" + text);
		
		System.out.println("text1" + text1);
		System.out.println("text2" + text2);
		System.out.println("text3" + text3);
		
		System.out.println("===================");
		
		System.out.println("===================");
		int C_code = detailBoardService.findC_code(smallCategory, middleCategory, bigCategory);
		int bno = detailBoardService.findBno();
		System.out.println("bno"+bno );
		int result = detailBoardService.insertMainBoardVO(bno, user_ID, C_code, boardType, title, text, price);
		System.out.println("result" + result);
		int textinsert = detailBoardService.insertText(bno, text1, text2, text3);
		System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
	
		ArrayList<Y_M_boardVO> list = vo.getList();
		ArrayList<D_T_boardVO> dtList = dvo.getDTlist();
		System.out.println(list);
		try {
			for(int i = 0; i< list.size(); i++)
			{
				int rno = detailBoardService.findRno();
				System.out.println("===================");
				System.out.println("===================");
				String day1 = list.get(i).getDay1();
				System.out.println(day1);
				System.out.println("===================");
				String day2 = list.get(i).getDay2();
				System.out.println(day2);
				String exText = list.get(i).getExText();
				System.out.println(exText);
				
				
				int M_time1 = list.get(i).getM_time1();
				System.out.println("M_time1" + M_time1);
				int M_time2 = list.get(i).getM_time2();
				System.out.println("M_time2" +M_time2);
				String Money = list.get(i).getMoney();
				System.out.println("Money" +Money);
				
				String addrBasic = list.get(i).getAddrBasic();
				System.out.println("addrBasic" +addrBasic);
				String addrDetail = list.get(i).getAddrDetail();
				System.out.println("addrDetail" + addrDetail);
				
				String entX = list.get(i).getEntX();
				System.out.println("entX " + entX);
				
				String entY = list.get(i).getEntY();
				System.out.println("entY " + entY);
				
				int Y_M_Result = detailBoardService.insertY_M_boardVO(bno, rno, day1, day2, exText, M_time1, M_time2, Money, addrBasic, addrDetail, entX, entY);
				System.out.println("Y_M_Result" + Y_M_Result);
				System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
				String[] dt_list = list.get(i).getDTlist();
				System.out.println(dt_list);
				
				System.out.println();
				
				System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
				for( int k=0;k<dt_list.length;k++)
				{
				System.out.println(dt_list[k]);
				if(dt_list[k] != null)
				{
					int D_T_Result = detailBoardService.insertD_T_boardVO(bno , rno, dt_list[k]);
					
				}
				}
				
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
		System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
		System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
		System.out.println("imgvo  " + imgvo);
		ArrayList<UploadIMGVO> imgList = imgvo.getImguploadList();
		System.out.println(imgList);
		try {
			for(int i = 0; i <imgList.size();i++){
				
				
				String fileRealName = imgList.get(i).getFile().getOriginalFilename();
				System.out.println("fileRealName "+fileRealName);
				
				
				File folder = new File(APP_CONSTANT.UPLOAD_PATH  + "\\detailPageImg"+"\\" + bno); //폴더를 만들위치
				
				if(!folder.exists()) {
					folder.mkdir(); //폴더생성
				}
				
				
				UUID uuid = UUID.randomUUID();
				String uuids = uuid.toString().replaceAll("-", ""); //가짜파일명
				//업로드파일명
				
				String fileExtention = fileRealName.substring( fileRealName.lastIndexOf(".") , fileRealName.length() );
				System.out.println("fileExtention " + fileExtention);
				String fileName = uuids + fileExtention;
				
				
				//저장된 전체경로
				String uploadPath = folder.getPath(); //폴더명을 포함한 경로
				System.out.println(uploadPath);
				File saveFile = new File(uploadPath  + "\\"+ fileName); //업로드 경로
				System.out.println("saveFile "+saveFile);
				
				
				
				int imgresult = detailBoardService.insertIMGBoardVO(bno, fileName);
				
				imgList.get(i).getFile().transferTo(saveFile); //실제 파일을 로컬환경으로 저장
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		
		System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
		System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");		
		System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
		RA.addAttribute("bno", bno);
		System.out.println("값넘기기" + bno);
		System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
		return "redirect:/detailBoard/detailPage";
		
	}
	
	
}
