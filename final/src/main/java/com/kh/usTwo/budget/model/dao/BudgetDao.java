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
	
	public ArrayList<Budget> existCurrencyRecord(Budget bd, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("budgetMapper.existCurrencyRecord", bd);
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

	public ArrayList<Budget> selectBudget_startDate(Budget bd, PageInfo pi, SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getTestLimit();
		int limit = pi.getTestLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("budgetMapper.selectBudget_startDate", bd, rowBounds);
	}

	public ArrayList<Budget> selectBudget_endDate(Budget bd, PageInfo pi, SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getTestLimit();
		int limit = pi.getTestLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("budgetMapper.selectBudget_endDate", bd, rowBounds);
	}

	public ArrayList<Budget> selectBudget_date(Budget bd, PageInfo pi, SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getTestLimit();
		int limit = pi.getTestLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("budgetMapper.selectBudget_date", bd, rowBounds);
	}

	public ArrayList<Budget> selectBudget_currencyInout(Budget bd, PageInfo pi, SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getTestLimit();
		int limit = pi.getTestLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("budgetMapper.selectBudget_currencyInout", bd, rowBounds);
	}

	public ArrayList<Budget> selectBudget_currencyInoutStartDate(Budget bd, PageInfo pi,
			SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getTestLimit();
		int limit = pi.getTestLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("budgetMapper.selectBudget_currencyInoutStartDate", bd, rowBounds);
	}

	public ArrayList<Budget> selectBudget_currencyInoutEndDate(Budget bd, PageInfo pi, SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getTestLimit();
		int limit = pi.getTestLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("budgetMapper.selectBudget_currencyInoutEndDate", bd, rowBounds);
	}

	public ArrayList<Budget> selectBudget_currencyInoutDate(Budget bd, PageInfo pi, SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getTestLimit();
		int limit = pi.getTestLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("budgetMapper.selectBudget_currencyInoutDate", bd, rowBounds);
	}

	public ArrayList<Budget> selectBudget_currency(Budget bd, PageInfo pi, SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getTestLimit();
		int limit = pi.getTestLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("budgetMapper.selectBudget_currency", bd, rowBounds);
	}

	public ArrayList<Budget> selectBudget_currencyStartDate(Budget bd, PageInfo pi, SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getTestLimit();
		int limit = pi.getTestLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("budgetMapper.selectBudget_currencyStartDate", bd, rowBounds);
	}

	public ArrayList<Budget> selectBudget_currencyEndDate(Budget bd, PageInfo pi, SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getTestLimit();
		int limit = pi.getTestLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("budgetMapper.selectBudget_currencyEndDate", bd, rowBounds);
	}

	public ArrayList<Budget> selectBudget_currencyDate(Budget bd, PageInfo pi, SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getTestLimit();
		int limit = pi.getTestLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("budgetMapper.selectBudget_currencyDate", bd, rowBounds);
	}

	public ArrayList<Budget> selectBudget_inout(Budget bd, PageInfo pi, SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getTestLimit();
		int limit = pi.getTestLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("budgetMapper.selectBudget_inout", bd, rowBounds);
	}

	public ArrayList<Budget> selectBudget_inoutStartDate(Budget bd, PageInfo pi, SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getTestLimit();
		int limit = pi.getTestLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("budgetMapper.selectBudget_inoutStartDate", bd, rowBounds);
	}

	public ArrayList<Budget> selectBudget_inoutEndDate(Budget bd, PageInfo pi, SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getTestLimit();
		int limit = pi.getTestLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("budgetMapper.selectBudget_inoutEndDate", bd, rowBounds);
	}

	public ArrayList<Budget> selectBudget_inoutDate(Budget bd, PageInfo pi, SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getTestLimit();
		int limit = pi.getTestLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("budgetMapper.selectBudget_inoutDate", bd, rowBounds);
	}

	public ArrayList<Budget> selectBudget_keyword(Budget bd, PageInfo pi, SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getTestLimit();
		int limit = pi.getTestLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("budgetMapper.selectBudget_keyword", bd, rowBounds);
	}

	public ArrayList<Budget> selectBudget_startDateKeyword(Budget bd, PageInfo pi, SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getTestLimit();
		int limit = pi.getTestLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("budgetMapper.selectBudget_startDateKeyword", bd, rowBounds);
	}

	public ArrayList<Budget> selectBudget_endDateKeyword(Budget bd, PageInfo pi, SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getTestLimit();
		int limit = pi.getTestLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("budgetMapper.selectBudget_endDateKeyword", bd, rowBounds);
	}

	public ArrayList<Budget> selectBudget_dateKeyword(Budget bd, PageInfo pi, SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getTestLimit();
		int limit = pi.getTestLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("budgetMapper.selectBudget_dateKeyword", bd, rowBounds);
	}

	public ArrayList<Budget> selectBudget_currencyInoutKeyword(Budget bd, PageInfo pi, SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getTestLimit();
		int limit = pi.getTestLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("budgetMapper.selectBudget_currencyInoutKeyword", bd, rowBounds);
	}

	public ArrayList<Budget> selectBudget_currencyInoutStartDateKeyword(Budget bd, PageInfo pi,
			SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getTestLimit();
		int limit = pi.getTestLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("budgetMapper.selectBudget_currencyInoutStartDateKeyword", bd, rowBounds);
	}

	public ArrayList<Budget> selectBudget_currencyInoutEndDateKeyword(Budget bd, PageInfo pi,
			SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getTestLimit();
		int limit = pi.getTestLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("budgetMapper.selectBudget_currencyInoutEndDateKeyword", bd, rowBounds);
	}

	public ArrayList<Budget> selectBudget_currencyInoutDateKeyword(Budget bd, PageInfo pi,
			SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getTestLimit();
		int limit = pi.getTestLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("budgetMapper.selectBudget_currencyInoutDateKeyword", bd, rowBounds);
	}

	public ArrayList<Budget> selectBudget_currencyKeyword(Budget bd, PageInfo pi, SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getTestLimit();
		int limit = pi.getTestLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("budgetMapper.selectBudget_currencyKeyword", bd, rowBounds);
	}

	public ArrayList<Budget> selectBudget_currencyStartDateKeyword(Budget bd, PageInfo pi,
			SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getTestLimit();
		int limit = pi.getTestLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("budgetMapper.selectBudget_currencyStartDateKeyword", bd, rowBounds);
	}

	public ArrayList<Budget> selectBudget_currencyEndDateKeyword(Budget bd, PageInfo pi,
			SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getTestLimit();
		int limit = pi.getTestLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("budgetMapper.selectBudget_currencyEndDateKeyword", bd, rowBounds);
	}

	public ArrayList<Budget> selectBudget_currencyDateKeyword(Budget bd, PageInfo pi, SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getTestLimit();
		int limit = pi.getTestLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("budgetMapper.selectBudget_currencyDateKeyword", bd, rowBounds);
	}

	public ArrayList<Budget> selectBudget_inoutKeyword(Budget bd, PageInfo pi, SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getTestLimit();
		int limit = pi.getTestLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("budgetMapper.selectBudget_inoutKeyword", bd, rowBounds);
	}

	public ArrayList<Budget> selectBudget_inoutStartDateKeyword(Budget bd, PageInfo pi, SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getTestLimit();
		int limit = pi.getTestLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("budgetMapper.selectBudget_inoutStartDateKeyword", bd, rowBounds);
	}

	public ArrayList<Budget> selectBudget_inoutEndDateKeyword(Budget bd, PageInfo pi, SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getTestLimit();
		int limit = pi.getTestLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("budgetMapper.selectBudget_inoutEndDateKeyword", bd, rowBounds);
	}

	public ArrayList<Budget> selectBudget_inoutDateKeyword(Budget bd, PageInfo pi, SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getTestLimit();
		int limit = pi.getTestLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("budgetMapper.selectBudget_inoutDateKeyword", bd, rowBounds);
	}

	public int countBudget_startDate(Budget bd, SqlSessionTemplate sqlSession) {
	    return sqlSession.selectOne("budgetMapper.countBudget_startDate", bd);
	}

	public int countBudget_endDate(Budget bd, SqlSessionTemplate sqlSession) {
	    return sqlSession.selectOne("budgetMapper.countBudget_endDate", bd);
	}

	public int countBudget_date(Budget bd, SqlSessionTemplate sqlSession) {
	    return sqlSession.selectOne("budgetMapper.countBudget_date", bd);
	}

	public int countBudget_currencyInout(Budget bd, SqlSessionTemplate sqlSession) {
	    return sqlSession.selectOne("budgetMapper.countBudget_currencyInout", bd);
	}

	public int countBudget_currencyInoutStartDate(Budget bd, SqlSessionTemplate sqlSession) {
	    return sqlSession.selectOne("budgetMapper.countBudget_currencyInoutStartDate", bd);
	}

	public int countBudget_currencyInoutEndDate(Budget bd, SqlSessionTemplate sqlSession) {
	    return sqlSession.selectOne("budgetMapper.countBudget_currencyInoutEndDate", bd);
	}

	public int countBudget_currencyInoutDate(Budget bd, SqlSessionTemplate sqlSession) {
	    return sqlSession.selectOne("budgetMapper.countBudget_currencyInoutDate", bd);
	}

	public int countBudget_currency(Budget bd, SqlSessionTemplate sqlSession) {
	    return sqlSession.selectOne("budgetMapper.countBudget_currency", bd);
	}

	public int countBudget_currencyStartDate(Budget bd, SqlSessionTemplate sqlSession) {
	    return sqlSession.selectOne("budgetMapper.countBudget_currencyStartDate", bd);
	}

	public int countBudget_currencyEndDate(Budget bd, SqlSessionTemplate sqlSession) {
	    return sqlSession.selectOne("budgetMapper.countBudget_currencyEndDate", bd);
	}

	public int countBudget_currencyDate(Budget bd, SqlSessionTemplate sqlSession) {
	    return sqlSession.selectOne("budgetMapper.countBudget_currencyDate", bd);
	}

	public int countBudget_inout(Budget bd, SqlSessionTemplate sqlSession) {
	    return sqlSession.selectOne("budgetMapper.countBudget_inout", bd);
	}

	public int countBudget_inoutStartDate(Budget bd, SqlSessionTemplate sqlSession) {
	    return sqlSession.selectOne("budgetMapper.countBudget_inoutStartDate", bd);
	}

	public int countBudget_inoutEndDate(Budget bd, SqlSessionTemplate sqlSession) {
	    return sqlSession.selectOne("budgetMapper.countBudget_inoutEndDate", bd);
	}

	public int countBudget_inoutDate(Budget bd, SqlSessionTemplate sqlSession) {
	    return sqlSession.selectOne("budgetMapper.countBudget_inoutDate", bd);
	}

	public int countBudget_keyword(Budget bd, SqlSessionTemplate sqlSession) {
	    return sqlSession.selectOne("budgetMapper.countBudget_keyword", bd);
	}

	public int countBudget_startDateKeyword(Budget bd, SqlSessionTemplate sqlSession) {
	    return sqlSession.selectOne("budgetMapper.countBudget_startDateKeyword", bd);
	}

	public int countBudget_endDateKeyword(Budget bd, SqlSessionTemplate sqlSession) {
	    return sqlSession.selectOne("budgetMapper.countBudget_endDateKeyword", bd);
	}

	public int countBudget_dateKeyword(Budget bd, SqlSessionTemplate sqlSession) {
	    return sqlSession.selectOne("budgetMapper.countBudget_dateKeyword", bd);
	}

	public int countBudget_currencyInoutKeyword(Budget bd, SqlSessionTemplate sqlSession) {
	    return sqlSession.selectOne("budgetMapper.countBudget_currencyInoutKeyword", bd);
	}

	public int countBudget_currencyInoutStartDateKeyword(Budget bd, SqlSessionTemplate sqlSession) {
	    return sqlSession.selectOne("budgetMapper.countBudget_currencyInoutStartDateKeyword", bd);
	}

	public int countBudget_currencyInoutEndDateKeyword(Budget bd, SqlSessionTemplate sqlSession) {
	    return sqlSession.selectOne("budgetMapper.countBudget_currencyInoutEndDateKeyword", bd);
	}

	public int countBudget_currencyInoutDateKeyword(Budget bd, SqlSessionTemplate sqlSession) {
	    return sqlSession.selectOne("budgetMapper.countBudget_currencyInoutDateKeyword", bd);
	}

	public int countBudget_currencyKeyword(Budget bd, SqlSessionTemplate sqlSession) {
	    return sqlSession.selectOne("budgetMapper.countBudget_currencyKeyword", bd);
	}

	public int countBudget_currencyStartDateKeyword(Budget bd, SqlSessionTemplate sqlSession) {
	    return sqlSession.selectOne("budgetMapper.countBudget_currencyStartDateKeyword", bd);
	}

	public int countBudget_currencyEndDateKeyword(Budget bd, SqlSessionTemplate sqlSession) {
	    return sqlSession.selectOne("budgetMapper.countBudget_currencyEndDateKeyword", bd);
	}

	public int countBudget_currencyDateKeyword(Budget bd, SqlSessionTemplate sqlSession) {
	    return sqlSession.selectOne("budgetMapper.countBudget_currencyDateKeyword", bd);
	}

	public int countBudget_inoutKeyword(Budget bd, SqlSessionTemplate sqlSession) {
	    return sqlSession.selectOne("budgetMapper.countBudget_inoutKeyword", bd);
	}

	public int countBudget_inoutStartDateKeyword(Budget bd, SqlSessionTemplate sqlSession) {
	    return sqlSession.selectOne("budgetMapper.countBudget_inoutStartDateKeyword", bd);
	}

	public int countBudget_inoutEndDateKeyword(Budget bd, SqlSessionTemplate sqlSession) {
	    return sqlSession.selectOne("budgetMapper.countBudget_inoutEndDateKeyword", bd);
	}

	public int countBudget_inoutDateKeyword(Budget bd, SqlSessionTemplate sqlSession) {
	    return sqlSession.selectOne("budgetMapper.countBudget_inoutDateKeyword", bd);
	}
}
