package com.kh.usTwo.budget.model.service;

import java.util.ArrayList;

import com.kh.usTwo.budget.model.vo.Budget;
import com.kh.usTwo.common.model.vo.PageInfo;

public interface BudgetService {
	int countBudget(String coupleCode);
	ArrayList<Budget> selectBudget(String coupleCode, PageInfo pi);
	ArrayList<Budget> selectBudget(String coupleCode);
	ArrayList<Budget> selectBudget_currency(Budget bd);
	int insertBudgetI(Budget bd);
	int insertBudgetO(Budget bd);
	int selectBalanceOne(Budget bd);
	int countBalance(Budget bd);
	ArrayList<Budget> selectBudgetSpecific(Budget bd);
	int updateBudget(Budget bd);
}
