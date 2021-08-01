package com.tigerWhale.command;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data //toString, getter, setter 자동생성
@AllArgsConstructor //모든멤버변수 초기화생성
@NoArgsConstructor //기본생성자
public class TextBoardVO {
	private int bno;
	private String text1; 
	private String text2; 
	private String text3; 

}
