package com.tigerWhale.detailBoard.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

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

public interface DetailBoardMapper {
	
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
//	=======================================================
	
	public Y_M_boardVO getY_M_One(int bno);
	
	public int insertMainBoardVO( 
			@Param("bno") int bno,
			@Param("user_ID") String user_ID, 
			@Param("C_code") int C_code,
			@Param("boardType")  String boardType, 
			@Param("title") String title,
			@Param("text")  String text,
			@Param("price")  int price);
	
	public int findBno();
	public int insertText (@Param("bno") int bno,@Param("text1") String text1 , @Param("text2") String text2, @Param("text3")String text3);
	
	public int insertY_M_boardVO(
			@Param("bno") int bno,
			@Param("rno")int rno,
			@Param("day1") String day1, 
			@Param("day2") String day2,
			@Param("exText") String exText,
			@Param("M_time1") int M_time1,
			@Param("M_time2") int M_time2,
			@Param("Money") String Money,
			@Param("addrBasic") String addrBasic ,
			@Param("addrDetail") String addrDetail,
			@Param("entX") String entX ,
			@Param("entY") String entY);
	public ArrayList<CategoryBoardVO> getCataGoryALL();
	public ArrayList<CategoryBoardVO> getMiddleCataGory(CategoryBoardVO vo);
	public int  insertIMGBoardVO(@Param("bno") int bno,@Param("img")  String img);
	public int insertD_T_boardVO(@Param("bno") int bno, @Param("rno")int rno, @Param("M_day")  String M_day);
	public int findRno();
	public int findC_code(@Param("smallCategory") String smallCategory ,@Param("middleCategory") String middleCategory ,@Param("bigCategory")  String bigCategory);
	public CustomerBoardVO getCustomerBoard(@Param("user_ID") String user_ID);
	public int mainBoarddelete(@Param("bno") int bno);

}
