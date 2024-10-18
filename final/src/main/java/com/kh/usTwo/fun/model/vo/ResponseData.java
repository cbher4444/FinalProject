package com.kh.usTwo.fun.model.vo;

import java.util.ArrayList;

import com.kh.usTwo.common.model.vo.PageInfo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class ResponseData {
	private ArrayList<Test> list;
	private PageInfo pi;
}
