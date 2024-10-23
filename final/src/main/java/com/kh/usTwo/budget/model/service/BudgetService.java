package com.kh.usTwo.budget.model.service;

import java.util.ArrayList;

import com.kh.usTwo.budget.model.vo.Budget;
import com.kh.usTwo.common.model.vo.PageInfo;

public interface BudgetService {
	int countBudget(String coupleCode);
	ArrayList<Budget> selectBudget(String coupleCode, PageInfo pi);
	ArrayList<Budget> selectBudget(String coupleCode);
	ArrayList<Budget> existCurrencyRecord(Budget bd);
	int insertBudgetI(Budget bd);
	int insertBudgetO(Budget bd);
	int selectBalanceOne(Budget bd);
	int countBalance(Budget bd);
	ArrayList<Budget> selectBudgetSpecific(Budget bd);
	int updateBudget(Budget bd);
	
	ArrayList<Budget> selectBudget_startDate(Budget bd, PageInfo pi);
	ArrayList<Budget> selectBudget_endDate(Budget bd, PageInfo pi);
	ArrayList<Budget> selectBudget_date(Budget bd, PageInfo pi);
	
	ArrayList<Budget> selectBudget_currencyInout(Budget bd, PageInfo pi);
	ArrayList<Budget> selectBudget_currencyInoutStartDate(Budget bd, PageInfo pi);
	ArrayList<Budget> selectBudget_currencyInoutEndDate(Budget bd, PageInfo pi);
	ArrayList<Budget> selectBudget_currencyInoutDate(Budget bd, PageInfo pi);
	
	ArrayList<Budget> selectBudget_currency(Budget bd, PageInfo pi);
	ArrayList<Budget> selectBudget_currencyStartDate(Budget bd, PageInfo pi);
	ArrayList<Budget> selectBudget_currencyEndDate(Budget bd, PageInfo pi);
	ArrayList<Budget> selectBudget_currencyDate(Budget bd, PageInfo pi);
	
	ArrayList<Budget> selectBudget_inout(Budget bd, PageInfo pi);
	ArrayList<Budget> selectBudget_inoutStartDate(Budget bd, PageInfo pi);
	ArrayList<Budget> selectBudget_inoutEndDate(Budget bd, PageInfo pi);
	ArrayList<Budget> selectBudget_inoutDate(Budget bd, PageInfo pi);
	
	ArrayList<Budget> selectBudget_keyword(Budget bd, PageInfo pi);
	ArrayList<Budget> selectBudget_startDateKeyword(Budget bd, PageInfo pi);
	ArrayList<Budget> selectBudget_endDateKeyword(Budget bd, PageInfo pi);
	ArrayList<Budget> selectBudget_dateKeyword(Budget bd, PageInfo pi);
	
	ArrayList<Budget> selectBudget_currencyInoutKeyword(Budget bd, PageInfo pi);
	ArrayList<Budget> selectBudget_currencyInoutStartDateKeyword(Budget bd, PageInfo pi);
	ArrayList<Budget> selectBudget_currencyInoutEndDateKeyword(Budget bd, PageInfo pi);
	ArrayList<Budget> selectBudget_currencyInoutDateKeyword(Budget bd, PageInfo pi);
	
	ArrayList<Budget> selectBudget_currencyKeyword(Budget bd, PageInfo pi);
	ArrayList<Budget> selectBudget_currencyStartDateKeyword(Budget bd, PageInfo pi);
	ArrayList<Budget> selectBudget_currencyEndDateKeyword(Budget bd, PageInfo pi);
	ArrayList<Budget> selectBudget_currencyDateKeyword(Budget bd, PageInfo pi);
	
	ArrayList<Budget> selectBudget_inoutKeyword(Budget bd, PageInfo pi);
	ArrayList<Budget> selectBudget_inoutStartDateKeyword(Budget bd, PageInfo pi);
	ArrayList<Budget> selectBudget_inoutEndDateKeyword(Budget bd, PageInfo pi);
	ArrayList<Budget> selectBudget_inoutDateKeyword(Budget bd, PageInfo pi);
	
	int countBudget_startDate(Budget bd);
	int countBudget_endDate(Budget bd);
	int countBudget_date(Budget bd);

	int countBudget_currencyInout(Budget bd);
	int countBudget_currencyInoutStartDate(Budget bd);
	int countBudget_currencyInoutEndDate(Budget bd);
	int countBudget_currencyInoutDate(Budget bd);

	int countBudget_currency(Budget bd);
	int countBudget_currencyStartDate(Budget bd);
	int countBudget_currencyEndDate(Budget bd);
	int countBudget_currencyDate(Budget bd);

	int countBudget_inout(Budget bd);
	int countBudget_inoutStartDate(Budget bd);
	int countBudget_inoutEndDate(Budget bd);
	int countBudget_inoutDate(Budget bd);

	int countBudget_keyword(Budget bd);
	int countBudget_startDateKeyword(Budget bd);
	int countBudget_endDateKeyword(Budget bd);
	int countBudget_dateKeyword(Budget bd);

	int countBudget_currencyInoutKeyword(Budget bd);
	int countBudget_currencyInoutStartDateKeyword(Budget bd);
	int countBudget_currencyInoutEndDateKeyword(Budget bd);
	int countBudget_currencyInoutDateKeyword(Budget bd);

	int countBudget_currencyKeyword(Budget bd);
	int countBudget_currencyStartDateKeyword(Budget bd);
	int countBudget_currencyEndDateKeyword(Budget bd);
	int countBudget_currencyDateKeyword(Budget bd);

	int countBudget_inoutKeyword(Budget bd);
	int countBudget_inoutStartDateKeyword(Budget bd);
	int countBudget_inoutEndDateKeyword(Budget bd);
	int countBudget_inoutDateKeyword(Budget bd);
}
