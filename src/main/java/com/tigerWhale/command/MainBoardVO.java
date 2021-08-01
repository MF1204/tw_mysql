package com.tigerWhale.command;

import java.sql.Timestamp;
import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data //toString, getter, setter 자동생성
@AllArgsConstructor //모든멤버변수 초기화생성
@NoArgsConstructor //기본생성자
public class MainBoardVO {
    private int bno;
    private String user_ID ;
    private int c_code;
    private String boardType ;
    private String title ;
    private String text;
    private int price ;
    private Timestamp M_registDate;
    private Timestamp M_updateDate;
    private ArrayList<IMGBoardVO> imgBoardList;
    private float la;
    private float ma;

}
