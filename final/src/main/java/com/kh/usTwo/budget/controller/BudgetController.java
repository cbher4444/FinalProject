package com.kh.usTwo.budget.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.usTwo.budget.model.service.BudgetServiceImpl;
import com.kh.usTwo.budget.model.vo.Budget;
import com.kh.usTwo.common.model.vo.PageInfo;
import com.kh.usTwo.common.template.Pagination;

@Controller
public class BudgetController {
	@Autowired
	private BudgetServiceImpl bService;
	
	@RequestMapping("goBudget")
	public String goBudget() {
		return "budget/budget";
	}
	
	@RequestMapping("goList")
	public ModelAndView goList(@RequestParam(value="cpage", defaultValue="1") int currentPage, String coupleCode, ModelAndView mv) {
		int listCount = bService.countBudget(coupleCode);
		int pageLimit = 10;
		int budgetLimit = 20;

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, budgetLimit);
		
		ArrayList<Budget> list = bService.selectBudget(coupleCode, pi);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("budget/list");
		
		return mv;
	}
	
	
	@ResponseBody
	@RequestMapping("insertBudget.bd")
	public int insertBudget(Budget bd) {
		int balance = 0;
		int insertResult;
		
		if (bService.selectBudget_currency(bd).size() > 0) { // bd.date 이전에 특정 통화를 사용한 적이 있는가
			balance = bService.selectBalanceOne(bd);
		}
		
		if (bd.getBudgetInout().equals("I")) {
			balance += bd.getBudgetHowMuch();
			bd.setBudgetBalance(balance);

			insertResult = bService.insertBudgetI(bd);
		} else {
			balance -= bd.getBudgetHowMuch();
			bd.setBudgetBalance(balance);

			insertResult = bService.insertBudgetO(bd);
		}

		if (insertResult > 0) {
			int updateResult = 1;
			if (bService.countBalance(bd) > 0) {
				for (Budget b : bService.selectBudgetSpecific(bd)) {
					bd.setBudgetNo(b.getBudgetNo());
					
					if (b.getBudgetInout().equals("I")) {
						bd.setBudgetBalance(bd.getBudgetBalance() + b.getBudgetHowMuch());
					} else {
						bd.setBudgetBalance(bd.getBudgetBalance() - b.getBudgetHowMuch());
					}
					
					updateResult *= bService.updateBudget(bd);
				}
			}
			
			return updateResult;
		} else {
			return insertResult;
		}
	}
	
	@ResponseBody
	@RequestMapping(value="selectBudget.bd", produces = "application/json; charset=utf-8")
	public String selectBudget(String coupleCode) {
		return new Gson().toJson(bService.selectBudget(coupleCode));
	}
}