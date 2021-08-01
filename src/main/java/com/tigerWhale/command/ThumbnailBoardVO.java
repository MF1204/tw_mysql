package com.tigerWhale.command;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ThumbnailBoardVO {

    private int bno;
    private String user_ID ;
    private int C_code;
    private String boardType ;
    private String title ;
    private String text;
    private int price ;
    private Timestamp M_registDate;
    private Timestamp M_updateDate;
    private String img;
	private int recnum;
	private int viewnum;
}
