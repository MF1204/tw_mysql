package com.tigerWhale.detailBoard.service;

import java.util.ArrayList;

import com.tigerWhale.command.D_T_boardVO;
import com.tigerWhale.command.IMGBoardVO;
import com.tigerWhale.command.MainBoardVO;
import com.tigerWhale.command.UsersVO;
import com.tigerWhale.command.Y_M_boardVO;
import com.tigerWhale.command.CategoryBoardVO;
import com.tigerWhale.command.CustomerBoardVO;
import com.tigerWhale.command.DetailBoardVO;
import com.tigerWhale.command.ReplyBoardVO;
import com.tigerWhale.command.TextBoardVO;


public interface DetailBoardService {
	public CategoryBoardVO getCategory(int bno);
	public ArrayList<D_T_boardVO> getD_T_board(int bno);
	public ArrayList<DetailBoardVO> getBoardDetail(int bno);
	public MainBoardVO getMainDetail(int bno);
	public ArrayList<ReplyBoardVO> getReplyBoard(int bno);
	public UsersVO getUserDetail(String id);
	public ArrayList<Y_M_boardVO> getY_M_board(int bno);
	public ArrayList<IMGBoardVO> getIMGBoard(int bno);
	public TextBoardVO getTextBoard(int bno);
	public ArrayList<Y_M_boardVO> getY_M_boardFisrt(int bno);
	
//	==========================================================
	public Y_M_boardVO getY_M_One(int bno);
	
	public int insertMainBoardVO(int bno ,String user_ID, int C_code, String boardType, String title, String text, int price);
	
	
	public int findBno();
	public int findRno();
	public int insertText (int bno, String text1 , String text2, String text3);

	public int insertY_M_boardVO(
			int bno, int rno,String day1,String day2,String exText, int M_time1, int M_time2,
			String Money, String addrBasic ,String addrDetail , String entX , String entY);
	
	
	public ArrayList<CategoryBoardVO> getCataGoryALL();
	public ArrayList<CategoryBoardVO> getMiddleCataGory(CategoryBoardVO vo);
	
	public int insertIMGBoardVO(int bno, String img);
	
	public int insertD_T_boardVO(int bno, int rno,String M_day);
	
	public int findC_code(String smallCategory , String middleCategory , String bigCategory);
	
	public CustomerBoardVO getCustomerBoard(String user_ID);
	
	public int mainBoarddelete(int bno);
	
}

