package com.tigerWhale.command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data //toString, getter, setter 자동생성
@AllArgsConstructor //모든멤버변수 초기화생성
@NoArgsConstructor //기본생성자
public class UsersVO {
	
    private String user_ID;
    private String user_PW ;
    private String userAdress;
    private String userPhoneNumber;
    
    private String userEmail1 ;
    private String userEmail2 ;
    
    private String userGender ;
    private String buyScore_AVG;
    
    private float la;
    private float ma;
    private int c_code; // mainPage에서 사용하려고 개인적으로 추가했습니다.
    
    private String user_IMG;
}
