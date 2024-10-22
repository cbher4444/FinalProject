package com.kh.usTwo.budget.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.usTwo.budget.model.vo.Budget;
import com.kh.usTwo.common.model.vo.PageInfo;

@Repository
public class BudgetDao {

	public int countBudget(String coupleCode, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("budgetMapper.countBudget", coupleCode);
	}

	public ArrayList<Budget> selectBudget(String coupleCode, PageInfo pi, SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getTestLimit();
		int limit = pi.getTestLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("budgetMapper.selectBudget", coupleCode, rowBounds);
	}
	
	public ArrayList<Budget> selectBudget(String coupleCode, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("budgetMapper.selectBudget", coupleCode);
	}
	
	public ArrayList<Budget> selectBudget_currency(Budget bd, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("budgetMapper.selectBudget_currency", bd);
	}

	public int insertBudgetI(Budget bd, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("budgetMapper.insertBudgetI", bd);
	}
	
	public int insertBudgetO(Budget bd, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("budgetMapper.insertBudgetO", bd);
	}

	public int selectBalanceOne(Budget bd, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("budgetMapper.selectBalanceOne", bd);
	}

	public int countBalance(Budget bd, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("budgetMapper.countBalance", bd);
	}
	
	public ArrayList<Budget> selectBudgetSpecific(Budget bd, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("budgetMapper.selectBudgetSpecific", bd);
	}

	public int updateBudget(Budget bd, SqlSessionTemplate sqlSession) {
		return sqlSession.update("budgetMapper.updateBudget", bd);
	}
}
