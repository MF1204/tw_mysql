package com.tigerWhale.command;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data // toString, getter, setter 자동생성
@AllArgsConstructor // 모든멤버변수 초기화생성
@NoArgsConstructor // 기본생성자
public class ReplyBoardVO {
	private String user_ID;
	private int bno;
	private int orderNum;
	private String reply;
	private Timestamp R_replyDate;
	private Timestamp R_updateDate;
	
	private String timegap;	//시간계산변수
}
