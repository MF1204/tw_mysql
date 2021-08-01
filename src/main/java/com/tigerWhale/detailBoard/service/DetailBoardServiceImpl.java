package com.tigerWhale.detailBoard.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
import com.tigerWhale.detailBoard.mapper.DetailBoardMapper;

@Service("detailBoardService")
public class DetailBoardServiceImpl implements DetailBoardService {

	@Autowired
	private DetailBoardMapper detailBoardMapper;

	@Override
	public CategoryBoardVO getCategory(int bno) {
		return detailBoardMapper.getCategory(bno);
	}

	@Override
	public ArrayList<D_T_boardVO> getD_T_board(int bno) {
		return detailBoardMapper.getD_T_board(bno);
	}

	@Override
	public ArrayList<DetailBoardVO> getBoardDetail(int bno) {
		return detailBoardMapper.getBoardDetail(bno);
	}

	@Override
	public MainBoardVO getMainDetail(int bno) {
		return detailBoardMapper.getMainDetail(bno);
	}

	@Override
	public ArrayList<ReplyBoardVO> getReplyBoard(int bno) {
		return detailBoardMapper.getReplyBoard(bno);
	}

	@Override
	public UsersVO getUserDetail(String id) {
		return detailBoardMapper.getUserDetail(id);
	}

	@Override
	public ArrayList<Y_M_boardVO> getY_M_board(int bno) {
		return detailBoardMapper.getY_M_board(bno);
	}

	@Override
	public ArrayList<IMGBoardVO> getIMGBoard(int bno) {
		return detailBoardMapper.getIMGBoard(bno);
	}

	@Override
	public TextBoardVO getTextBoard(int bno) {
		return detailBoardMapper.getTextBoard(bno);
	}

	@Override
	public ArrayList<Y_M_boardVO> getY_M_boardFisrt(int bno) {
		return detailBoardMapper.getY_M_boardFisrt(bno);
	}

//===============================================================================
	@Override
	public Y_M_boardVO getY_M_One(int bno) {

		return detailBoardMapper.getY_M_One(bno);
	}

	@Override
	public int insertMainBoardVO(int bno, String user_ID, int C_code, String boardType, String title, String text, int price) {
		System.out.println(user_ID);
		System.out.println("여 기까지 성공");
		return detailBoardMapper.insertMainBoardVO(bno, user_ID, C_code, boardType, title, text, price);
	}

	@Override
	public int findBno() {
		return detailBoardMapper.findBno();
	}

	@Override
	public int insertText(int bno, String text1, String text2, String text3) {
		return detailBoardMapper.insertText(bno, text1, text2, text3);
	}

	@Override
	public ArrayList<CategoryBoardVO> getCataGoryALL() {
		return detailBoardMapper.getCataGoryALL();
	}

	@Override
	public ArrayList<CategoryBoardVO> getMiddleCataGory(CategoryBoardVO vo) {
		return detailBoardMapper.getMiddleCataGory(vo);
	}

	@Override
	public int insertY_M_boardVO(int bno, int rno, String day1, String day2, String exText, int M_time1, int M_time2, String Money, String addrBasic, String addrDetail, String entX, String entY) {

		return detailBoardMapper.insertY_M_boardVO(bno, rno, day1, day2, exText, M_time1, M_time2, Money, addrBasic, addrDetail, entX, entY);
	}

	@Override
	public int insertIMGBoardVO(int bno, String img) {

		return detailBoardMapper.insertIMGBoardVO(bno, img);
	}

	@Override
	public int insertD_T_boardVO(int bno, int rno, String M_day) {
		// TODO Auto-generated method stub
		return detailBoardMapper.insertD_T_boardVO(bno , rno, M_day);
	}

	@Override
	public int findRno() {
		return detailBoardMapper.findRno();
	}

	@Override
	public int findC_code(String smallCategory , String middleCategory , String bigCategory) {
		// TODO Auto-generated method stub
		return detailBoardMapper.findC_code(smallCategory, middleCategory, bigCategory);
	}

	@Override
	public CustomerBoardVO getCustomerBoard(String user_ID) {
		return detailBoardMapper.getCustomerBoard(user_ID);
	}

	@Override
	public int mainBoarddelete(int bno) {
		return detailBoardMapper.mainBoarddelete(bno);
	}


}
