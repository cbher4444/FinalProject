package com.kh.usTwo.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.usTwo.member.model.service.MemberServiceImpl;
import com.kh.usTwo.member.model.vo.Member;


@Controller
public class MemberController {
	
	@Autowired
	private MemberServiceImpl mService;
	
	@RequestMapping("loginForm")
	public String loginForm() {
		return "member/loginForm";
	}
	
	@RequestMapping("login")
	public String homeMember(HttpSession session, Member m) {
		Member loginUser = mService.loginMember(m);
		if(loginUser != null) {
			Member partner = mService.selectPartnerEmail(m);
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("partner", partner);
			return "redirect:home"; // 홈으로 리다이렉트 되도록 수정함. - by 동규 (2024.10.13)
		}else {
			session.setAttribute("alertMsg", "로그인 실패");
			return "member/loginForm";
		}
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "home/homeGuest";
	}
	
	@RequestMapping("signupForm")
	public String loginConditions(@RequestParam(value = "checkCode", required = false) String checkCode, Model model) {
		// 초대코드 url로 전달받고, 다음 페이지로 넘어갈때 가져감. - 수정 by 동규 (2024.10.15)
		model.addAttribute("checkCode", checkCode);
		return "member/loginConditions";
	}
	
	@RequestMapping("signupPage.me")
	public String enterSignupForm(String checkCode, Model model) {
		// 초대코드 url로 전달받고, 다음 페이지로 넘어갈때 가져감. - 수정 by 동규 (2024.10.15)
		model.addAttribute("checkCode", checkCode);
		return "member/signupForm";
	}
	
	@RequestMapping(value="insert.me")
	public String insertMember(Member m, String checkCode, HttpSession session) {
		int result = mService.insertMember(m);
		
		System.out.println(result);
		
		if(result > 0) {
			Member loginUser = mService.loginMember(m);
			if(loginUser != null) {
				session.setAttribute("loginUser", loginUser);
				session.setAttribute("checkCode", checkCode);
				return "mypage/myPage"; // 홈으로 리다이렉트 되도록 수정함. - by 동규 (2024.10.13)
			}else {
				session.setAttribute("alertMsg", "로그인 실패");
				return "member/loginForm";
			}
		}else {
			session.setAttribute("alertMsg", "회원가입 실패");
			return "member/signupForm";
		}
		
	}
	
	@RequestMapping("reEnrollFrom.me")
	public String reEnrollForm(){
		return "member/loginForm";		
	}
	
	// 회원정보수정 - 추가함 by 동규 (2024.10.13)
	@RequestMapping("update.me")
	public String updateMember(Member m, HttpSession session) {
		
		int result = mService.updateMember(m);
		
		if(result > 0) { // 수정 성공
			// db로부터 수정된 회원정보를 다시 조회해와서
			// session에 loginUser 키값으로 덮어씌워야됨
			Member updateMem = mService.loginMember(m);
			session.setAttribute("loginUser", updateMem); // 갱싱된 회원정보로 세션 갈아끼기!
			
			// alert 띄워 줄 문구 담기
			session.setAttribute("alertMsg", "성공적으로 회원정보 변경되었습니다.");
			
		}else { // 수정 실패
			session.setAttribute("alertMsg", "회원정보 수정 실패!");
		}
		
		// 마이페이지 url 재요청
		return "redirect:myPage";
	}
	
	// 회원탈퇴 - 추가함 by 동규 (2024.10.13)
	@RequestMapping("delete.me")
	public String deleteMember(String userPwd, HttpSession session) {
		
		// userId : session에 loginUser Member 객체 userId 필드
		// userPwd : 회원탈퇴시 요청시 사용자가 입력한 비밀번호 평문
		//         : session에 loingUser member 객체 userPwd 필드 : db로 부터 조회된 비번(암호문) => encPwd
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		String encPwd = loginUser.getUserPwd();
		
		//if(bcryptPasswordEncoder.matches(userPwd, encPwd)) { // 비번맞음 => 탈퇴처리
		if(encPwd.equals(userPwd)){
			int result = mService.deleteMember(loginUser);
			if(result > 0) { // 탈퇴처리 성공 => session에 loginUSer 지움, alert 문구 담기 => 메인페이지 url 재요청
				session.removeAttribute("loginUser");
				session.setAttribute("alertMsg", "성공적으로 탈퇴되었습니다. 그동안 이용해주셔서 감사합니다.");
				return "redirect:/";
			}else { // 탈퇴처리 실패
				session.setAttribute("alertMsg", "회원탈퇴실패!");
				return "redirect:myPage";
			}
			
		}else { // 비번틀림 => 비밀번호가 틀림을 알리고 마이페이지 보여지게
			session.setAttribute("alertMsg", "비밀번호를 잘못 입력하셨습니다. 확인해주세요.");
			return "redirect:myPage";
		}
	}
	
	@RequestMapping("findIdForm")
	public String findIdform() {
		return "member/findId";
	}
	
	@RequestMapping("findPwdForm")
	public String findPwdform() {
		return "member/findPwd";
	}
	
	@RequestMapping("findId")
	public String findId(Member m, HttpSession session) {
		String email = mService.findId(m);
		
		if(email != null) {
			session.setAttribute("alertMsg", "당신의 아이디는 "+email+" 입니다.");
			session.setAttribute("email", email);
			return "member/findId";
		}else {
			session.setAttribute("alertMsg", "아이디를 찾지 못했습니다.");
			return "member/loginForm";
		}
		
	}
	
	@RequestMapping("checkUser")
	public String checkUser(Member m, HttpSession session) {
		String checkUser = mService.checkUser(m);
		System.out.println(checkUser);
		
		if(checkUser != null) {
			session.setAttribute("checkUser", checkUser);
			return "member/findPwd2";
		}else {
			session.setAttribute("alertMsg", "잘못 입력하셨습니다. 정확히 입력해주세요.");
			return "member/findPwd";
		}
		
	}
	
	@RequestMapping("updatePwd")
	public String updatePwd(Member m , HttpSession session) {
		
		int updatePwd = mService.updatePwd(m);
		
		
		if(updatePwd > 0) {
			session.setAttribute("alertMsg", "비밀번호 변경 완료했습니다.");
			return "member/loginForm";
		}else {
			session.setAttribute("alertMsg", "비밀번호 변경에 실패했습니다.");
			return "member/findPwd";
		}
	}
	
	// 초대코드 중복체크 - 추가함 by 동규 (2024.10.14)
	@ResponseBody
	@RequestMapping("iccheck.me")
	public String inviteCodeCheck(String inviteCode) {
		int result = mService.inviteCodeCheck(inviteCode);
		return result == 0 ? "success" : "fail";
	}
	
	// 내 초대코드 업데이트 - 추가함 by 동규 (2024.10.14)
	@ResponseBody
	@RequestMapping("icupdate.me")
	public String updateInviteCode(Member m, HttpSession session) {
		int result = mService.updateInviteCode(m);
		
		if (result > 0) { // 성공
			Member updateMem = mService.loginMember(m);
			session.setAttribute("loginUser", updateMem); // 갱싱된 회원정보로 세션 갈아끼기!
			return "success";
		} else { // 실패
			return "fail";
		}
	}
	
	// 상대방 초대코드 체크 - 추가함 by 동규 (2024.10.14)
	@RequestMapping("piccheck.me")
	public String partnerInviteCodeCheck(String inviteCode, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(loginUser.getInviteCode().equals(inviteCode)) { // 본인초대코드 입력한 경우
			session.setAttribute("alertMsg", "본인의 초대코드를 입력하셨습니다.\\n상대방의 초대코드를 입력해주세요.");
		}else { // 본인초대코드가 아닌경우
			Member partner = mService.partnerInviteCodeCheck(inviteCode);
			
			if(partner != null) {
				session.setAttribute("partner", partner);
			}else {
				session.setAttribute("alertMsg", "해당 초대코드와 일치하는 유저가 없습니다.\\n다시 한번 확인해주세요.");
			}
		}

		return "redirect:myPage";
	}
	
	// 상대방 세션에서 없애기 - 추가함 by 동규 (2024.10.14)
	@ResponseBody
	@RequestMapping("invalidatePartner.me")
	public String invalidatePartner(HttpSession session) {
		session.removeAttribute("partner");
		if((Member)session.getAttribute("partner") == null) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	// 커플등록 - 추가함 by 동규 (2024.10.14)
	@RequestMapping(value="insert.co")
	public String insertCouple(HttpSession session) {
		
		String coupleCode = generateRandomString(15);
		
		int isValid;
		while(true) {
			isValid = mService.coupleCodeCheck(coupleCode); // 1: 중복값있음. 0: 중복값없음.
			if (isValid == 0) { // 중복값 없을경우 -> 사용가능한 커플코드임!
				break;
			}
		}

		int result = mService.insertCouple(coupleCode, session);
		
		if(result > 0) { // 커플등록 성공 -> 새로운 정보로 세션에 갈아끼기
			
			Member loginUser = (Member)session.getAttribute("loginUser");
			
			Member updatedLoginUser = mService.loginMember(loginUser);
			Member partner = mService.selectPartnerEmail(updatedLoginUser);
			
			session.setAttribute("loginUser", updatedLoginUser);
			session.setAttribute("partner", partner);
			
			session.setAttribute("alertMsg", "커플등록에 성공하였습니다.");
			return "redirect:home";
			
		}else {  // 커플등록 실패
			session.setAttribute("alertMsg", "커플등록 실패");
			return "redirect:myPage";
		}
		
	}
	
	// 랜덤코드 생성기 -> 커플코드에 사용됨 - 추가함 by 동규 (2024.10.14)
    public static String generateRandomString(int length) {
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        StringBuilder result = new StringBuilder();
        Random random = new Random();
        
        for (int i = 0; i < length; i++) {
            int index = random.nextInt(characters.length());
            result.append(characters.charAt(index));
        }
        
        return result.toString();
    }
    
	// 계정복구 - 추가함 by 동규 (2024.10.15)
	@RequestMapping("revert.me")
	public String revertMember(HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		Member partner = null;
		
		// 1. 상대방이 있는 경우
		int result1 = 1;
		if (loginUser.getPartnerEmail() != null) {
			// 2_1. 커플코드 복구
			result1 = mService.revertCoupleCode(loginUser.getCoupleCode());
			
			// 2_2. 상대방 계정 복구
			partner = mService.selectPartnerEmail(loginUser);
			result1 *= mService.revertMember(partner);
		}
			
		// 2. 내 계정 복구
		int result2 = mService.revertMember(loginUser);
		
		// 3. 결과
		if (result1 * result2 > 0) { // 성공
			Member updateloginUser = mService.loginMember(loginUser);
			session.setAttribute("loginUser", updateloginUser); // 갱싱된 회원정보로 세션 갈아끼기!
			
			// 상대방이 있는 경우
			if (updateloginUser.getPartnerEmail() != null) {
				Member updatePartner = mService.loginMember(partner);
				session.setAttribute("partner", updatePartner); // 갱싱된 회원정보로 세션 갈아끼기!
			}
			
			session.setAttribute("alertMsg", "성공적으로 계정 복구하였습니다.");
			return "redirect:home";
			
		} else { // 실패
			session.setAttribute("alertMsg", "계정복구 실패");
			return "redirect:myPage";
		}
	}  

	// 프로필 사진변경 - 추가함 by 동규 (2024.10.18)
	@RequestMapping("profileUpdate.me")
	public String updateProfile(Member m, MultipartFile reupfile, HttpSession session) {
		System.out.println(reupfile);
		
		// 기존에 첨부파일이 있었을 경우 => 기존의 첨부파일 지우기
		if(m.getOriginName() != null) {
			new File(session.getServletContext().getRealPath(m.getChangeName())).delete();
		}
		
		// 새로 넘어온 첨부파일 서버 업로드 시키기
		String changeName = saveFile(reupfile, session);
		
		// m에 새로 넘어온 첨부파일 대한 원본명, 저장경로 담기
		m.setOriginName(reupfile.getOriginalFilename());
		m.setChangeName("resources/uploadFiles/" + changeName);
		
		int result = mService.updateProfile(m);
		
		if(result > 0) {
			Member updateloginUser = mService.loginMember(m);
			session.setAttribute("loginUser", updateloginUser); // 갱싱된 회원정보로 세션 갈아끼기!
			session.setAttribute("alertMsg", "성공적으로 프로필사진이 변경되었습니다.");
		} else {
			session.setAttribute("alertMsg", "프로필사진 변경실패");
		}
		
		return "redirect:myPage";
	}

	// 현재 넘어온 첨부파일 그 자체를 서버의 폴더에 저장시키는 역할 - 추가함 by 동규 (2024.10.18) 
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
