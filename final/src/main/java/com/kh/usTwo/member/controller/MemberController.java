package com.kh.usTwo.member.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String loginConditions() {
		return "member/loginConditions";
	}
	
	@RequestMapping("signupPage.me")
	public String enterSignupForm() {
		return "member/signupForm";
	}
	
	@RequestMapping(value="insert.me")
	public String insertMember(Member m, HttpSession session) {
		int result = mService.insertMember(m);
		
		System.out.println(result);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "회원가입 성공하였습니다.");
			return "member/loginForm";
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
	public String deleteMember(String email, String userPwd, HttpSession session) {
		
		// userId : session에 loginUser Member 객체 userId 필드
		// userPwd : 회원탈퇴시 요청시 사용자가 입력한 비밀번호 평문
		//         : session에 loingUser member 객체 userPwd 필드 : db로 부터 조회된 비번(암호문) => encPwd
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		String encPwd = loginUser.getUserPwd();
		
		//if(bcryptPasswordEncoder.matches(userPwd, encPwd)) { // 비번맞음 => 탈퇴처리
		if(encPwd.equals(userPwd)){
			int result = mService.deleteMember(email);
			System.out.println(result);
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
	
	
	
	
	
}
