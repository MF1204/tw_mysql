package com.tigerWhale.command;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data //toString, getter, setter 자동생성
@AllArgsConstructor //모든멤버변수 초기화생성
@NoArgsConstructor //기본생성자
public class CustomerBoardVO {
	private int bno;
	private int rno;
	private int money;
	private String user_ID;

}
