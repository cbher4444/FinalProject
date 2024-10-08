package com.kh.usTwo.gemini.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.usTwo.fun.model.service.FunServiceImpl;
import com.kh.usTwo.fun.model.vo.Alove;
import com.kh.usTwo.fun.model.vo.Aservey;
import com.kh.usTwo.fun.model.vo.Qlove;
import com.kh.usTwo.fun.model.vo.Qservey;
import com.kh.usTwo.gemini.model.service.GeminiServiceImpl;
import com.kh.usTwo.member.model.vo.Member;

@Controller
public class GeminiController {
	@Autowired
	private GeminiServiceImpl gService;
	
	@Autowired 
	private FunServiceImpl fService;
	
	@RequestMapping("geminiQnA")
	public void callGeminiQnA(Member m, String prompt) {
	 	try {
	 		Qlove q = new Qlove();
	 		q.setQloveContent(prompt);
	 		q.setEmail(m.getEmail());
	 		q.setCoupleCode(m.getCoupleCode());
	 		
	 		int qResult = fService.insertQlove(q);
	 		
	 		Alove a = new Alove();
	 		a.setAloveContent(gService.callGemini(prompt));
	 		a.setEmail(m.getEmail());
	 		a.setCoupleCode(m.getCoupleCode());
	 		a.setQloveNo(fService.selectQloveOne(m).getQloveNo());
	 		
			int aResult = fService.insertAlove(a);
		} catch (Exception e) {
			e.printStackTrace();
			prompt = "Error occurred while processing the request.";
			System.out.println(prompt);
		}
	}
	
	@RequestMapping("geminiTest")
	public void callGeminiTest(Member m, String prompt) {
		ArrayList<Qservey> qList = fService.selectQservey();
		ArrayList<Aservey> aList = fService.selectAservey(m);
		
		String list = "";
		
		for (int i = 0; i < qList.size(); i++) {
			for (int j = 0; j < aList.size(); j++) {
				if(qList.get(i).getQserveyNo() == aList.get(j).getQserveyNo()) {
					list += "Q" + i + ". " + qList.get(i).getQserveyContent() + "\n";
					list += "A" + i + ". " + aList.get(j).getAserveyContent() + "\n";
				}
			}
		}
		
		list += "위 설문조사에는 A가 참여하였습니다.";
		list += "위 설문조사를 결과를 바탕으로 질문 10개를 작성하세요.";
		list += "각 질문에 대한 보기를 각각 4개씩 제시하세요.";
		list += "작성된 질문에는 B가 답을 할 것입니다. 고로 질문의 주어는 A가 되어야합니다.";
		list += "A와 B는 연인 관계입니다.";
		list += "아래와 같은 형식으로 답을 작성하세요.";
		list += "Q1. A가 좋아하는 사람은?";
		list += "A1. 홍길동";
		list += "A2. 이길동";
		list += "A3. 김길동";
		list += "A4. 박길동(answer)";
		list += "설문조사 결과에 존재하지 않는 정보에 기반한 질문은 존재하지 않습니다.";
		list += "(answer) 표시는 누락될 수 없습니다.";
		list += "예시에 사용된 'A가 좋아하는 사람은?'이라는 문제는 출제될 수 없습니다.";
		
	 	try {
			String response = gService.callGemini(list);
			System.out.println("Response from API: " + response);
		} catch (Exception e) {
			e.printStackTrace();
			prompt = "Error occurred while processing the request.";
			System.out.println(prompt);
		}
	}
}
