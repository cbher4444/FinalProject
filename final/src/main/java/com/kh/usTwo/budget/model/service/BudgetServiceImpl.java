package com.kh.usTwo.budget.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.usTwo.budget.model.dao.BudgetDao;
import com.kh.usTwo.budget.model.vo.Budget;
import com.kh.usTwo.common.model.vo.PageInfo;

@Service
public class BudgetServiceImpl implements BudgetService {
	@Autowired
	private BudgetDao bDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int countBudget(String coupleCode) {
		return bDao.countBudget(coupleCode, sqlSession);
	}

	@Override
	public ArrayList<Budget> selectBudget(String coupleCode, PageInfo pi) {
		return bDao.selectBudget(coupleCode, pi, sqlSession);
	}
	
	@Override
	public ArrayList<Budget> selectBudget(String coupleCode) {
		return bDao.selectBudget(coupleCode, sqlSession);
	}
	
	@Override
	public ArrayList<Budget> existCurrencyRecord(Budget bd) {
		return bDao.existCurrencyRecord(bd, sqlSession);
	}

	@Override
	public int insertBudgetI(Budget bd) {
		return bDao.insertBudgetI(bd, sqlSession);
	}
	
	@Override
	public int insertBudgetO(Budget bd) {
		return bDao.insertBudgetO(bd, sqlSession);
	}

	@Override
	public int selectBalanceOne(Budget bd) {
		return bDao.selectBalanceOne(bd, sqlSession);
	}

	@Override
	public int countBalance(Budget bd) {
		return bDao.countBalance(bd, sqlSession);
	}

	@Override
	public int updateBudget(Budget bd) {
		return bDao.updateBudget(bd, sqlSession);
	}

	@Override
	public ArrayList<Budget> selectBudgetSpecific(Budget bd) {
		return bDao.selectBudgetSpecific(bd, sqlSession);
	}

	@Override
	public ArrayList<Budget> selectBudget_startDate(Budget bd, PageInfo pi) {
		return bDao.selectBudget_startDate(bd, pi, sqlSession);
	}

	@Override
	public ArrayList<Budget> selectBudget_endDate(Budget bd, PageInfo pi) {
		return bDao.selectBudget_endDate(bd, pi, sqlSession);
	}

	@Override
	public ArrayList<Budget> selectBudget_date(Budget bd, PageInfo pi) {
		return bDao.selectBudget_date(bd, pi, sqlSession);
	}

	@Override
	public ArrayList<Budget> selectBudget_currencyInout(Budget bd, PageInfo pi) {
		return bDao.selectBudget_currencyInout(bd, pi, sqlSession);
	}

	@Override
	public ArrayList<Budget> selectBudget_currencyInoutStartDate(Budget bd, PageInfo pi) {
		return bDao.selectBudget_currencyInoutStartDate(bd, pi, sqlSession);
	}

	@Override
	public ArrayList<Budget> selectBudget_currencyInoutEndDate(Budget bd, PageInfo pi) {
		return bDao.selectBudget_currencyInoutEndDate(bd, pi, sqlSession);
	}

	@Override
	public ArrayList<Budget> selectBudget_currencyInoutDate(Budget bd, PageInfo pi) {
		return bDao.selectBudget_currencyInoutDate(bd, pi, sqlSession);
	}

	@Override
	public ArrayList<Budget> selectBudget_currency(Budget bd, PageInfo pi) {
		return bDao.selectBudget_currency(bd, pi, sqlSession);
	}

	@Override
	public ArrayList<Budget> selectBudget_currencyStartDate(Budget bd, PageInfo pi) {
		return bDao.selectBudget_currencyStartDate(bd, pi, sqlSession);
	}

	@Override
	public ArrayList<Budget> selectBudget_currencyEndDate(Budget bd, PageInfo pi) {
		return bDao.selectBudget_currencyEndDate(bd, pi, sqlSession);
	}

	@Override
	public ArrayList<Budget> selectBudget_currencyDate(Budget bd, PageInfo pi) {
		return bDao.selectBudget_currencyDate(bd, pi, sqlSession);
	}

	@Override
	public ArrayList<Budget> selectBudget_inout(Budget bd, PageInfo pi) {
		return bDao.selectBudget_inout(bd, pi, sqlSession);
	}

	@Override
	public ArrayList<Budget> selectBudget_inoutStartDate(Budget bd, PageInfo pi) {
		return bDao.selectBudget_inoutStartDate(bd, pi, sqlSession);
	}

	@Override
	public ArrayList<Budget> selectBudget_inoutEndDate(Budget bd, PageInfo pi) {
		return bDao.selectBudget_inoutEndDate(bd, pi, sqlSession);
	}

	@Override
	public ArrayList<Budget> selectBudget_inoutDate(Budget bd, PageInfo pi) {
		return bDao.selectBudget_inoutDate(bd, pi, sqlSession);
	}

	@Override
	public ArrayList<Budget> selectBudget_keyword(Budget bd, PageInfo pi) {
		return bDao.selectBudget_keyword(bd, pi, sqlSession);
	}

	@Override
	public ArrayList<Budget> selectBudget_startDateKeyword(Budget bd, PageInfo pi) {
		return bDao.selectBudget_startDateKeyword(bd, pi, sqlSession);
	}

	@Override
	public ArrayList<Budget> selectBudget_endDateKeyword(Budget bd, PageInfo pi) {
		return bDao.selectBudget_endDateKeyword(bd, pi, sqlSession);
	}

	@Override
	public ArrayList<Budget> selectBudget_dateKeyword(Budget bd, PageInfo pi) {
		return bDao.selectBudget_dateKeyword(bd, pi, sqlSession);
	}

	@Override
	public ArrayList<Budget> selectBudget_currencyInoutKeyword(Budget bd, PageInfo pi) {
		return bDao.selectBudget_currencyInoutKeyword(bd, pi, sqlSession);
	}

	@Override
	public ArrayList<Budget> selectBudget_currencyInoutStartDateKeyword(Budget bd, PageInfo pi) {
		return bDao.selectBudget_currencyInoutStartDateKeyword(bd, pi, sqlSession);
	}

	@Override
	public ArrayList<Budget> selectBudget_currencyInoutEndDateKeyword(Budget bd, PageInfo pi) {
		return bDao.selectBudget_currencyInoutEndDateKeyword(bd, pi, sqlSession);
	}

	@Override
	public ArrayList<Budget> selectBudget_currencyInoutDateKeyword(Budget bd, PageInfo pi) {
		return bDao.selectBudget_currencyInoutDateKeyword(bd, pi, sqlSession);
	}

	@Override
	public ArrayList<Budget> selectBudget_currencyKeyword(Budget bd, PageInfo pi) {
		return bDao.selectBudget_currencyKeyword(bd, pi, sqlSession);
	}

	@Override
	public ArrayList<Budget> selectBudget_currencyStartDateKeyword(Budget bd, PageInfo pi) {
		return bDao.selectBudget_currencyStartDateKeyword(bd, pi, sqlSession);
	}

	@Override
	public ArrayList<Budget> selectBudget_currencyEndDateKeyword(Budget bd, PageInfo pi) {
		return bDao.selectBudget_currencyEndDateKeyword(bd, pi, sqlSession);
	}

	@Override
	public ArrayList<Budget> selectBudget_currencyDateKeyword(Budget bd, PageInfo pi) {
		return bDao.selectBudget_currencyDateKeyword(bd, pi, sqlSession);
	}

	@Override
	public ArrayList<Budget> selectBudget_inoutKeyword(Budget bd, PageInfo pi) {
		return bDao.selectBudget_inoutKeyword(bd, pi, sqlSession);
	}

	@Override
	public ArrayList<Budget> selectBudget_inoutStartDateKeyword(Budget bd, PageInfo pi) {
		return bDao.selectBudget_inoutStartDateKeyword(bd, pi, sqlSession);
	}

	@Override
	public ArrayList<Budget> selectBudget_inoutEndDateKeyword(Budget bd, PageInfo pi) {
		return bDao.selectBudget_inoutEndDateKeyword(bd, pi, sqlSession);
	}

	@Override
	public ArrayList<Budget> selectBudget_inoutDateKeyword(Budget bd, PageInfo pi) {
		return bDao.selectBudget_inoutDateKeyword(bd, pi, sqlSession);
	}

	@Override
	public int countBudget_startDate(Budget bd) {
	    return bDao.countBudget_startDate(bd, sqlSession);
	}

	@Override
	public int countBudget_endDate(Budget bd) {
	    return bDao.countBudget_endDate(bd, sqlSession);
	}

	@Override
	public int countBudget_date(Budget bd) {
	    return bDao.countBudget_date(bd, sqlSession);
	}

	@Override
	public int countBudget_currencyInout(Budget bd) {
	    return bDao.countBudget_currencyInout(bd, sqlSession);
	}

	@Override
	public int countBudget_currencyInoutStartDate(Budget bd) {
	    return bDao.countBudget_currencyInoutStartDate(bd, sqlSession);
	}

	@Override
	public int countBudget_currencyInoutEndDate(Budget bd) {
	    return bDao.countBudget_currencyInoutEndDate(bd, sqlSession);
	}

	@Override
	public int countBudget_currencyInoutDate(Budget bd) {
	    return bDao.countBudget_currencyInoutDate(bd, sqlSession);
	}

	@Override
	public int countBudget_currency(Budget bd) {
	    return bDao.countBudget_currency(bd, sqlSession);
	}

	@Override
	public int countBudget_currencyStartDate(Budget bd) {
	    return bDao.countBudget_currencyStartDate(bd, sqlSession);
	}

	@Override
	public int countBudget_currencyEndDate(Budget bd) {
	    return bDao.countBudget_currencyEndDate(bd, sqlSession);
	}

	@Override
	public int countBudget_currencyDate(Budget bd) {
	    return bDao.countBudget_currencyDate(bd, sqlSession);
	}

	@Override
	public int countBudget_inout(Budget bd) {
	    return bDao.countBudget_inout(bd, sqlSession);
	}

	@Override
	public int countBudget_inoutStartDate(Budget bd) {
	    return bDao.countBudget_inoutStartDate(bd, sqlSession);
	}

	@Override
	public int countBudget_inoutEndDate(Budget bd) {
	    return bDao.countBudget_inoutEndDate(bd, sqlSession);
	}

	@Override
	public int countBudget_inoutDate(Budget bd) {
	    return bDao.countBudget_inoutDate(bd, sqlSession);
	}

	@Override
	public int countBudget_keyword(Budget bd) {
		System.out.println(bd);
	    return bDao.countBudget_keyword(bd, sqlSession);
	}

	@Override
	public int countBudget_startDateKeyword(Budget bd) {
	    return bDao.countBudget_startDateKeyword(bd, sqlSession);
	}

	@Override
	public int countBudget_endDateKeyword(Budget bd) {
	    return bDao.countBudget_endDateKeyword(bd, sqlSession);
	}

	@Override
	public int countBudget_dateKeyword(Budget bd) {
	    return bDao.countBudget_dateKeyword(bd, sqlSession);
	}

	@Override
	public int countBudget_currencyInoutKeyword(Budget bd) {
	    return bDao.countBudget_currencyInoutKeyword(bd, sqlSession);
	}

	@Override
	public int countBudget_currencyInoutStartDateKeyword(Budget bd) {
	    return bDao.countBudget_currencyInoutStartDateKeyword(bd, sqlSession);
	}

	@Override
	public int countBudget_currencyInoutEndDateKeyword(Budget bd) {
	    return bDao.countBudget_currencyInoutEndDateKeyword(bd, sqlSession);
	}

	@Override
	public int countBudget_currencyInoutDateKeyword(Budget bd) {
	    return bDao.countBudget_currencyInoutDateKeyword(bd, sqlSession);
	}

	@Override
	public int countBudget_currencyKeyword(Budget bd) {
	    return bDao.countBudget_currencyKeyword(bd, sqlSession);
	}

	@Override
	public int countBudget_currencyStartDateKeyword(Budget bd) {
	    return bDao.countBudget_currencyStartDateKeyword(bd, sqlSession);
	}

	@Override
	public int countBudget_currencyEndDateKeyword(Budget bd) {
	    return bDao.countBudget_currencyEndDateKeyword(bd, sqlSession);
	}

	@Override
	public int countBudget_currencyDateKeyword(Budget bd) {
	    return bDao.countBudget_currencyDateKeyword(bd, sqlSession);
	}

	@Override
	public int countBudget_inoutKeyword(Budget bd) {
	    return bDao.countBudget_inoutKeyword(bd, sqlSession);
	}

	@Override
	public int countBudget_inoutStartDateKeyword(Budget bd) {
	    return bDao.countBudget_inoutStartDateKeyword(bd, sqlSession);
	}

	@Override
	public int countBudget_inoutEndDateKeyword(Budget bd) {
	    return bDao.countBudget_inoutEndDateKeyword(bd, sqlSession);
	}

	@Override
	public int countBudget_inoutDateKeyword(Budget bd) {
	    return bDao.countBudget_inoutDateKeyword(bd, sqlSession);
	}

	@Override
	public Budget selectBudget_budgetNo(Integer budgetNo) {
		return bDao.selectBudget_budgetNo(budgetNo, sqlSession);
	}

}
