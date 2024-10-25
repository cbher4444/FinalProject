package com.kh.usTwo.fun.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.kh.usTwo.fun.model.service.FunServiceImpl;
import com.kh.usTwo.fun.model.vo.Atoday;
import com.kh.usTwo.member.model.service.MemberServiceImpl;
import com.kh.usTwo.member.model.vo.Member;

@Component
public class ScheduledTasks {
	@Autowired
	private MemberServiceImpl mService;
	
	@Autowired
	private FunServiceImpl fService;
	
	@Scheduled(cron = "0 05 10 * * ?")
	public void executeTask() {
		System.out.println(new Date() + " : 코드 실행됨");
		ArrayList<Member> members = mService.selectMember();
		
		for (Member m : members) {
			boolean flag = true;
			int num = 0;
			int count = fService.countAtoday(m);
			
			for (int i = 0; flag; i++) {
				if (count <= (550 * (i + 1))) {
					num = i;
					flag = false;
				}
			}
			
			HashMap<String, String> hm = new HashMap<String, String>();
			hm.put("email", m.getEmail());
			hm.put("coupleCode", m.getCoupleCode());
			hm.put("num", String.valueOf(num));
			
			ArrayList<Atoday> a = fService.checkAtodayDupl(hm);
			
			final int[] random = new int[1];
			
			do {
			    random[0] = (int)(Math.random() * 550) + 1;
			} while (a.stream().anyMatch(item -> item.getQtodayNo() == random[0]));

			hm.put("random", String.valueOf(random[0]));

			int result1 = fService.insertAtoday(hm);
			
			hm.replace("email", m.getPartnerEmail());
			
			int result2 = fService.insertAtoday(hm);
		}
	}
}
