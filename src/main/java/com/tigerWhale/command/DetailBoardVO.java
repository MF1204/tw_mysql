package com.tigerWhale.command;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data // toString, getter, setter 자동생성
@AllArgsConstructor // 모든멤버변수 초기화생성
@NoArgsConstructor // 기본생성자
public class DetailBoardVO {
	private int orderNum;
	private String sell_ID;
	private String buy_ID;
	private int bno;
	private int price;
	private int sellScore;
	private int buyScore;

}
