package com.kh.usTwo.budget.model.service;

import java.util.ArrayList;

import com.kh.usTwo.budget.model.vo.Budget;
import com.kh.usTwo.common.model.vo.PageInfo;

public interface BudgetService {
	int countBudget(String coupleCode);
	ArrayList<Budget> selectBudget(String coupleCode, PageInfo pi);
	int insertBudget(Budget bd);
}
