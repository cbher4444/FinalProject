package com.kh.usTwo.budget.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	@RequestMapping(value="insertBudget", produces = "application/json; charset=utf-8")
	public int insertBudget(Budget bd) {
		return bService.insertBudget(bd);
	}
}