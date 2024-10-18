package com.kh.usTwo.home.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kh.usTwo.home.model.service.CoupleServiceImpl;
import com.kh.usTwo.home.model.vo.Couple;
import com.kh.usTwo.member.model.vo.Member;

@Controller
public class HomeController {
	
	@Autowired
	private CoupleServiceImpl cService;
	
	@RequestMapping("home")
	public String home(HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(loginUser == null) {
			return "home/homeGuest";
		}else {
			if(loginUser.getEmail().equals("admin@email.com")) { // 관리자인 경우
				return "adminPage/adminPage";
			}else if(!loginUser.getStatus().equals("Y")){ // 커플등록이 미완료된 경우, 탈퇴대기 상태인경우,
				return "mypage/myPage";
			}else { // 커플등록 완료
				Couple couple = cService.selectCouple(loginUser); // 커플정보 가져오기
				session.setAttribute("couple", couple);
				
				if (couple.getStartDate() != null) { // 시작일이 있으면
					Map<String, Object> dDay = cService.calculateDaysSinceStart(couple); // 데이카운트 계산
					session.setAttribute("dDay", dDay);
				}
				
				return "home/homeMember";
			}
		}
	}
	
	@RequestMapping("update.co")
	public String updateCouple(Couple c, MultipartFile reupfile, HttpSession session) {
		
		// 새로 넘어온 첨부파일이 있을 경우
		if(!reupfile.getOriginalFilename().equals("")) {
			
			// 기존에 첨부파일이 있었을 경우 => 기존의 첨부파일 지우기
			if(c.getOriginName() != null) {
				new File(session.getServletContext().getRealPath(c.getChangeName())).delete();
			}
			
			// 새로 넘어온 첨부파일 서버 업로드 시키기
			String changeName = saveFile(reupfile, session);
			
			// c에 새로 넘어온 첨부파일 대한 원본명, 저장경로 담기
			c.setOriginName(reupfile.getOriginalFilename());
			c.setChangeName("resources/uploadFiles/" + changeName);
		}
		
		int result = cService.updateCouple(c);
		
		if(result > 0) {
			Member loginUser = (Member)session.getAttribute("loginUser");
			Couple couple = cService.selectCouple(loginUser);
			session.setAttribute("couple", couple); // 갱싱된 커플정보로 세션 갈아끼기!
			session.setAttribute("alertMsg", "성공적으로 커플정보가 변경되었습니다.");
		} else {
			session.setAttribute("alertMsg", "커플정보 변경실패");
		}
		
		return "redirect:home";
	}
	
	// 현재 넘어온 첨부파일 그 자체를 서버의 폴더에 저장시키는 역할
	public String saveFile(MultipartFile upfile, HttpSession session) {
		String originName = upfile.getOriginalFilename(); // "flower.png"
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); // "20240926150855"
		int ranNum = (int)(Math.random() * 90000 + 10000); // 23125 (5자리 랜덤값)
		String ext = originName.substring(originName.lastIndexOf(".")); // ".png"
		
		String changeName = currentTime + ranNum + ext;
		
		// 업로드 시키고자 하는 폴더의 물리적인 경로 알아내기
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
	
}
