package com.tigerWhale.faq.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tigerWhale.command.FaqVO;
import com.tigerWhale.faq.mapper.FaqMapper;
import com.tigerWhale.util.FaqCriteria;

@Service("faqService") // componentscan
public class FaqServiceImpl implements FaqService {

	@Autowired
	private FaqMapper faqMapper;


	@Override
	public int replyForm(FaqVO faqVo) {
		return faqMapper.replyForm(faqVo);
	}
	
	
	
	@Override
	public int regist(FaqVO vo) {
		return faqMapper.regist(vo);
	}

	@Override
	public ArrayList<FaqVO> getList(FaqCriteria cri) {

		// 퍼블릭은 그냥 퍼블릭이고 ArrayList은 타입형. Criteria()는
		// Criteria cafe = new Criteria(); 이거랑 getList(Criteria cri)는 같은맥락이다
		
		Date now = new Date();
		//SimpleDateFormat aa = new SimpleDateFormat(); 
		ArrayList<FaqVO> dateToText = faqMapper.getList(cri); //리턴하고있던거 줏어옴..  Arraylist<String> asdf =
		
		for(FaqVO vo : dateToText){	//변수창 보면 name[0]번에 Value로 FaqVO가 들어있음. for(String i : asdf){}
			
			long calDate1 = now.getTime() - vo.getRegdate().getTime();
			long calDate2 = now.getTime() - vo.getUpdatedate().getTime();
			long min1 = calDate1 / 60000;
			long min2 = calDate2 / 60000;
			
			if(min1 <= 60) {
				vo.setTimetotext(String.valueOf(min1 + "분 전"));
			} else if(min1 < 1440){
				vo.setTimetotext(String.valueOf((min1 / 60) + "시간 전쯤"));
			} else {
				SimpleDateFormat handate = new SimpleDateFormat("yyyy.MM.dd");
				handate.format(vo.getRegdate());
				vo.setTimetotext(handate.format(vo.getRegdate() ).toString() );
			}
			if(min2 <= 60) {
				vo.setTimetotext2(String.valueOf(min2 + "분 전"));
			} else if(min2 < 1440){
				vo.setTimetotext2(String.valueOf((min2 / 60) + "시간 전쯤"));
			} else {
				SimpleDateFormat handate = new SimpleDateFormat("yyyy.MM.dd");
				handate.format(vo.getUpdatedate());
				vo.setTimetotext2(handate.format(vo.getUpdatedate() ).toString() );
			}
			
		}
		
		
		return dateToText; 
		//return faqMapper.getList(cri); //왜보내는거?
	}
	
	
	
	
	private char[] SimpleDataFormat(long time) {
		// TODO Auto-generated method stub
		return null;
		
	}

	//디버그를 걸고 F8을 누르면서 변수값에 뭐가들었는지 본다.

	@Override
	public FaqVO getDetail(int bno) {
		return faqMapper.getDetail(bno);
	}

	@Override
	public int update(FaqVO vo) {
		return faqMapper.update(vo);
	}

	@Override
	public int delete(int bno) {
		return faqMapper.delete(bno);
	}

	@Override
	public int getTotal(FaqCriteria cri) {

		return faqMapper.getTotal(cri);
	}

}

/*
 * 
 * 
 * 
 * */
