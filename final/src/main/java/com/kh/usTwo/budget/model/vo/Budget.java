package com.kh.usTwo.budget.model.vo;

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
public class Budget {
	private int budgetNo;
	private String budgetDate;
	private String budgetBriefs;
	private int budgetHowMuch;
	private String budgetCurrency;
	private int budgetBalance;
	private int budgetCate;
	private String budgetMethod;
	private String budgetComm;
	private String budgetInout;
	private String email;
	private String coupleCode;
}
