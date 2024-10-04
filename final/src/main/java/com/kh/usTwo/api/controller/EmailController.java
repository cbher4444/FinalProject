package com.kh.usTwo.api.controller;

import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.usTwo.api.service.EmailServiceImpl;

@Controller
public class EmailController {
	private static final Logger log = LoggerFactory.getLogger(EmailController.class);

	@Autowired
	EmailServiceImpl emailService;
	
	@RequestMapping(value="/mailtest", method= RequestMethod.GET)
	public ModelAndView quartztest(Locale locale, Model model) {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("jsp/mailTest");
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/mailTest/send", method= {RequestMethod.POST}, produces="application/json; charset=utf-8")
	public String vscstrt_call_editing(@RequestBody Map<String, Object>params, HttpServletRequest request) {
		int result = 0;
		Gson gson = new Gson();
		
		log.info(params.toString());
		
		try {
			emailService.sendSingle(params);
			
			params.clear();
			params.put("status", "000");
			params.put("msg", "성공");
			
		}catch(Exception e) {
			params.clear();
			params.put("status", "-100");
			params.put("msg", "실패");
		}
		
		
	
		
		return gson.toJson(params);
		
		
	}
	
	
}
