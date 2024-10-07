package com.kh.usTwo.gemini.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.usTwo.gemini.model.dao.GeminiDao;

@Service
public class GeminiServiceImpl implements GeminiService {
	@Autowired
	private GeminiDao gDao;
}
