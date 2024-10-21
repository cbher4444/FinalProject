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
	public int insertBudget(Budget bd) {
		return bDao.insertBudget(bd, sqlSession);
	}
}
