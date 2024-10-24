package com.kh.usTwo.budget.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
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
	
	@RequestMapping(value="goList", produces = "text/html;charset=UTF-8")
	public ModelAndView goList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Budget bd, ModelAndView mv) throws IOException {
		int pageLimit = 10;
		int budgetLimit = 20;

		PageInfo pi;
		ArrayList<Budget> list;
		
		bd.setKeyword("%" + bd.getKeyword() + "%");
		
		System.out.println(bd);
		if (!bd.getBudgetCurrency().equals("")) {
		    if (!bd.getBudgetInout().equals("")) {
		        if (!bd.getStartDate().equals("") && !bd.getEndDate().equals("")) {
		            if (!bd.getKeyword().equals("")) {
		                int listCount = bService.countBudget_currencyInoutDateKeyword(bd); 
		                pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, budgetLimit);
		                list = bService.selectBudget_currencyInoutDateKeyword(bd, pi);
		            } else {
		                int listCount = bService.countBudget_currencyInoutDate(bd); 
		                pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, budgetLimit);
		                list = bService.selectBudget_currencyInoutDate(bd, pi);
		            }
		        } else if (!bd.getStartDate().equals("")) {
		            if (!bd.getKeyword().equals("")) {
		                int listCount = bService.countBudget_currencyInoutStartDateKeyword(bd); 
		                pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, budgetLimit);
		                list = bService.selectBudget_currencyInoutStartDateKeyword(bd, pi);
		            } else {
		                int listCount = bService.countBudget_currencyInoutStartDate(bd); 
		                pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, budgetLimit);
		                list = bService.selectBudget_currencyInoutStartDate(bd, pi);
		            }
		        } else if (!bd.getEndDate().equals("")) {
		            if (!bd.getKeyword().equals("")) {
		                int listCount = bService.countBudget_currencyInoutEndDateKeyword(bd); 
		                pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, budgetLimit);
		                list = bService.selectBudget_currencyInoutEndDateKeyword(bd, pi);
		            } else {
		                int listCount = bService.countBudget_currencyInoutEndDate(bd); 
		                pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, budgetLimit);
		                list = bService.selectBudget_currencyInoutEndDate(bd, pi);
		            }
		        } else {
		            if (!bd.getKeyword().equals("")) {
		                int listCount = bService.countBudget_currencyInoutKeyword(bd); 
		                pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, budgetLimit);
		                list = bService.selectBudget_currencyInoutKeyword(bd, pi);
		            } else {
		                int listCount = bService.countBudget_currencyInout(bd); 
		                pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, budgetLimit);
		                list = bService.selectBudget_currencyInout(bd, pi);
		            }
		        }
		    } else {
		        if (!bd.getStartDate().equals("") && !bd.getEndDate().equals("")) {
		            if (!bd.getKeyword().equals("")) {
		                int listCount = bService.countBudget_currencyDateKeyword(bd); 
		                pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, budgetLimit);
		                list = bService.selectBudget_currencyDateKeyword(bd, pi);
		            } else {
		                int listCount = bService.countBudget_currencyDate(bd); 
		                pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, budgetLimit);
		                list = bService.selectBudget_currencyDate(bd, pi);
		            }
		        } else if (!bd.getStartDate().equals("")) {
		            if (!bd.getKeyword().equals("")) {
		                int listCount = bService.countBudget_currencyStartDateKeyword(bd); 
		                pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, budgetLimit);
		                list = bService.selectBudget_currencyStartDateKeyword(bd, pi);
		            } else {
		                int listCount = bService.countBudget_currencyStartDate(bd); 
		                pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, budgetLimit);
		                list = bService.selectBudget_currencyStartDate(bd, pi);
		            }
		        } else if (!bd.getEndDate().equals("")) {
		            if (!bd.getKeyword().equals("")) {
		                int listCount = bService.countBudget_currencyEndDateKeyword(bd); 
		                pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, budgetLimit);
		                list = bService.selectBudget_currencyEndDateKeyword(bd, pi);
		            } else {
		                int listCount = bService.countBudget_currencyEndDate(bd); 
		                pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, budgetLimit);
		                list = bService.selectBudget_currencyEndDate(bd, pi);
		            }
		        } else {
		            if (!bd.getKeyword().equals("")) {
		                int listCount = bService.countBudget_currencyKeyword(bd); 
		                pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, budgetLimit);
		                list = bService.selectBudget_currencyKeyword(bd, pi);
		            } else {
		                int listCount = bService.countBudget_currency(bd); 
		                pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, budgetLimit);
		                list = bService.selectBudget_currency(bd, pi);
		            }
		        }
		    }
		} else if (!bd.getBudgetInout().equals("")) {
		    if (!bd.getStartDate().equals("") && !bd.getEndDate().equals("")) {
		        if (!bd.getKeyword().equals("")) {
		            int listCount = bService.countBudget_inoutDateKeyword(bd); 
		            pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, budgetLimit);
		            list = bService.selectBudget_inoutDateKeyword(bd, pi);
		        } else {
		            int listCount = bService.countBudget_inoutDate(bd); 
		            pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, budgetLimit);
		            list = bService.selectBudget_inoutDate(bd, pi);
		        }
		    } else if (!bd.getStartDate().equals("")) {
		        if (!bd.getKeyword().equals("")) {
		            int listCount = bService.countBudget_inoutStartDateKeyword(bd); 
		            pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, budgetLimit);
		            list = bService.selectBudget_inoutStartDateKeyword(bd, pi);
		        } else {
		            int listCount = bService.countBudget_inoutStartDate(bd); 
		            pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, budgetLimit);
		            list = bService.selectBudget_inoutStartDate(bd, pi);
		        }
		    } else if (!bd.getEndDate().equals("")) {
		        if (!bd.getKeyword().equals("")) {
		            int listCount = bService.countBudget_inoutEndDateKeyword(bd); 
		            pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, budgetLimit);
		            list = bService.selectBudget_inoutEndDateKeyword(bd, pi);
		        } else {
		            int listCount = bService.countBudget_inoutEndDate(bd); 
		            pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, budgetLimit);
		            list = bService.selectBudget_inoutEndDate(bd, pi);
		        }
		    } else {
		        if (!bd.getKeyword().equals("")) {
		            int listCount = bService.countBudget_inoutKeyword(bd); 
		            pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, budgetLimit);
		            list = bService.selectBudget_inoutKeyword(bd, pi);
		        } else {
		            int listCount = bService.countBudget_inout(bd); 
		            pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, budgetLimit);
		            list = bService.selectBudget_inout(bd, pi);
		        }
		    }
		} else {
		    if (!bd.getStartDate().equals("") && !bd.getEndDate().equals("")) {
		        if (!bd.getKeyword().equals("")) {
		            int listCount = bService.countBudget_dateKeyword(bd); 
		            pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, budgetLimit);
		            list = bService.selectBudget_dateKeyword(bd, pi);
		        } else {
		            int listCount = bService.countBudget_date(bd); 
		            pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, budgetLimit);
		            list = bService.selectBudget_date(bd, pi);
		        }
		    } else if (!bd.getStartDate().equals("")) {
		        if (!bd.getKeyword().equals("")) {
		            int listCount = bService.countBudget_startDateKeyword(bd); 
		            pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, budgetLimit);
		            list = bService.selectBudget_startDateKeyword(bd, pi);
		        } else {
		            int listCount = bService.countBudget_startDate(bd); 
		            pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, budgetLimit);
		            list = bService.selectBudget_startDate(bd, pi);
		        }
		    } else if (!bd.getEndDate().equals("")) {
		        if (!bd.getKeyword().equals("")) {
		            int listCount = bService.countBudget_endDateKeyword(bd); 
		            pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, budgetLimit);
		            list = bService.selectBudget_endDateKeyword(bd, pi);
		        } else {
		            int listCount = bService.countBudget_endDate(bd); 
		            pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, budgetLimit);
		            list = bService.selectBudget_endDate(bd, pi);
		        }
		    } else {
		        if (!bd.getKeyword().equals("")) {
		            int listCount = bService.countBudget_keyword(bd); 
		            pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, budgetLimit);
		            list = bService.selectBudget_keyword(bd, pi);
		        } else {
		            int listCount = bService.countBudget(bd.getCoupleCode()); 
		            pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, budgetLimit);
		            list = bService.selectBudget(bd.getCoupleCode(), pi);
		        }
		    }
		}


		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .addObject("bd", bd)
		  .setViewName("budget/list");
		
		return mv;
	}
	
	@RequestMapping("goDetail")
	public ModelAndView goDetail(Integer budgetNo, ModelAndView mv) throws IOException {
		mv.addObject("bd", bService.selectBudget_budgetNo(budgetNo))
		  .setViewName("budget/detail");
		
		return mv;
	}
	
	
	@ResponseBody
	@RequestMapping("insertBudget.bd")
	public int insertBudget(Budget bd) {
		int balance = 0;
		int insertResult;
		
		if (bService.existCurrencyRecord(bd).size() > 0) { // bd.date 이전에 특정 통화를 사용한 적이 있는가
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