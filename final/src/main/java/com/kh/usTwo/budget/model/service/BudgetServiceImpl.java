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
	public ArrayList<Budget> selectBudget_currency(Budget bd) {
		return bDao.selectBudget_currency(bd, sqlSession);
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
}
