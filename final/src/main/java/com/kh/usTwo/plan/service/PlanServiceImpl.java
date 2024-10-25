package com.kh.usTwo.plan.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.server.Session;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.kh.usTwo.member.model.vo.Member;
import com.kh.usTwo.plan.dao.PlanDao;
import com.kh.usTwo.plan.model.vo.Calendar;
import com.kh.usTwo.plan.model.vo.Mindmap;
import com.kh.usTwo.plan.model.vo.Phone;
import com.kh.usTwo.plan.model.vo.Schedule;
import com.kh.usTwo.plan.model.vo.SelectSchedule;
import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

@Service
public class PlanServiceImpl implements PlanService{

	@Autowired
	private PlanDao pDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	@Override
	public ArrayList<Calendar> selectCalendarList(String coupleCode) {
		return pDao.selectCalendarList(sqlSession, coupleCode);
	}
	
	@Override
	public int insertCalendar(Member loginUser) {
		String coupleCode = loginUser.getCoupleCode();
		String myEmail = loginUser.getEmail();
		String partnerEmail = loginUser.getPartnerEmail();
		
		String pink = "rgb(236, 154, 236)";
		String skyBlue = "#3788d8";
		String green = "#27ae60";
		
		Calendar cBoth = new Calendar(coupleCode, "BOTH", pink);
		Calendar cMine = new Calendar(coupleCode, myEmail, skyBlue);
		Calendar cPartner = new Calendar(coupleCode, partnerEmail, green);
		
		int result = 1;
		result *= pDao.insertCalendar(sqlSession, cBoth);
		result *= pDao.insertCalendar(sqlSession, cMine);
		result *= pDao.insertCalendar(sqlSession, cPartner);
		return result;
	}
	
	@Override
	public int updateCalendarColors(ArrayList<Calendar> list) {
		return pDao.updateCalendarColors(sqlSession, list);
	}

	
	@Override
	public ArrayList<Schedule> selectScheduleList(SelectSchedule ss) {
		return pDao.selectScheduleList(sqlSession, ss);
	}

	@Override
	public int insertSchedule(Schedule s) {
		return pDao.insertSchedule(sqlSession, s);
	}

	@Override
	public int updateSchedule(Schedule s) {
		return pDao.updateSchedule(sqlSession, s);
	}

	@Override
	public int deleteSchedule(int scheduleNo) {
		return pDao.deleteSchedule(sqlSession, scheduleNo);
	}

	@Override
	public ArrayList<Mindmap> selectMindmapList(String coupleCode) {
		return pDao.selectMindmapList(sqlSession, coupleCode);
	}

	@Override
	public int updateMindmapList(ArrayList<Mindmap> mindmapList, HttpSession session) {
		String coupleCode = ((Member)session.getAttribute("loginUser")).getCoupleCode();
		pDao.deleteMindmapList(sqlSession, coupleCode); // 기존 데이터 지우기
		if(mindmapList.size() > 0) { // 새로 넣을 데이터가 있는경우
			return pDao.insertMindmapList(sqlSession, mindmapList); // 새로운 데이터로 새로 넣기
		}else { // 새로 넣을 데이터가 없는 경우.
			return 1;
		}
	}

	@Override
	@Scheduled(cron = "0 * * * * *") // 매분 00초 마다 실행
	public void sendNotifications() {
		System.out.println("PlanServiceImpl.java - sendNotifications() 실행됨. // 매분 00초에 실행됨. 알람이 있는 일정이 있는지 확인 후 문자메시지를 보내는 역할. - by 동규 ");
		ArrayList<Schedule> schedules = pDao.findScheduleWithAlertTime(sqlSession);
		
		for(Schedule schedule : schedules) {
			sendNotification(schedule);
		}
		
	}
	
	private void sendNotification(Schedule s) {
		// System.out.println(s);
		
		String ACCOUNT_SID = "";
		String AUTH_TOKEN = "";
		
		// Initialize Twilio
//        Twilio.init(ACCOUNT_SID, AUTH_TOKEN); // 실제 보낼때만 사용하기
        
		ArrayList<Phone> phoneList = getPhoneList(s);
		
		for(Phone p : phoneList) {
			if(p == null) {
				continue;
			}
			
			String myPhoneNumber = "+82" + p.getPhone().substring(1); //"+821099998888"
			String myTwilioNumber = "";
			String messageStr = makeMessage(s);
			
			System.out.println("--------------------------------------");
			System.out.println("문자받을번호: " + myPhoneNumber);
			System.out.println("전송될 메시지:");
			System.out.println(messageStr);
			System.out.println("--------------------------------------");
			
	        // Send SMS // 실제 보낼때만 사용하기~
//	        Message message = Message.creator(
//	                new PhoneNumber(myPhoneNumber), // Replace with your phone number
//	                new PhoneNumber(myTwilioNumber), // Replace with your Twilio number
//	                messageStr
//	        ).create();
	        
	       // System.out.println(message);
		}
	}
	
	private ArrayList<Phone> getPhoneList(Schedule s){
		ArrayList<Phone> phoneList = new ArrayList<Phone>();
		Phone phone = pDao.selectPhone(sqlSession, s); // 캘린더 번호로 조회 (캘린더번호, 커플코드, 오너이메일, 핸드폰번호) 
		
		if(phone.getOwner().equals("BOTH")) { // 두명 같이 사용하는 공유일정인 경우 -> 커플코드로 두사람 정보조회 (핸드폰번호, 커플코드)
			phoneList = pDao.selectPhoneList(sqlSession, phone.getCoupleCode());
		}else { // 한명의 일정인 경우
			phoneList.add(phone);
		}
		
		return phoneList;
	}
	
	private String makeMessage(Schedule s) {
        StringBuilder sb = new StringBuilder();
        sb.append("[UsTwo]일정알림");
        sb.append("\n-제목:" + s.getTitle());
        sb.append("\n-시작일시:" + s.getStartDate());
        
        if(s.getStartTime() != null) {
        	sb.append(" " + s.getStartTime());
        }
        
        if(s.getEndDate() != null) {
        	sb.append("\n-종료일시: " + s.getEndDate());
        }
        
        if(s.getEndTime() != null) {
        	sb.append(" " + s.getEndTime());
        }
        
        String messageStr = sb.toString();
        return messageStr;
	}


}
