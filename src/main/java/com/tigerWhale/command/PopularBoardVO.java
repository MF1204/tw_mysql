package com.tigerWhale.command;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PopularBoardVO {
	private ArrayList<MainBoardVO> mainBoardlist;
}
