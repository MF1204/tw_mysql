package com.tigerWhale.command;

import java.sql.Date;
import java.util.ArrayList;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data // toString, getter, setter 자동생성
@AllArgsConstructor // 모든멤버변수 초기화생성
@NoArgsConstructor // 기본생성자
public class Y_M_boardVO {
	private int bno;
	
//	===============================
	private int rno;
    private int M_time1;
    private int M_time2;
    
    private String Money ;
    
    private String addrBasic ;
    private String addrDetail;
    
    private String day1;
    private String day2;
    
    private String exText;
    
    private String entX;
    private String entY;
    
    private String[] DTlist = new String[7];
}

