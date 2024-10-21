
package com.kh.usTwo.member.model.vo;

import java.sql.Date;
import java.util.Calendar;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Member {
	
	/*
	 * EMAIL
		USER_PWD
		USER_NAME
		NICKNAME
		GENDER
		PHONE
		ADDRESS
		BRITHDAY
		ENROLL_DATE
		MODIFY_DATE
		INVITE_CODE
		COUPLE_CODE
		PARTNER_EMAIL
		ORIGIN_NAME
		CHANGE_NAME
		STATUS
	 */
	private String email;
	private String userPwd;
	private String userName;
	private String nickName;
	private String gender;
	private String phone;
	private String address;
	private Date brithday;
	private Date enrollDate;
	private Date modifyDate;
	private String inviteCode;
	private String coupleCode;
	private String partnerEmail;
	private String originName;
	private String changeName;
	private String status;
	private String updatePwd; // 변경할 Pwd. "마이페이지" 비밀번호 변경시 사용 - 추가함 by 동규 (2024.10.18)
	
	
	// 계정삭제일 구하는 메소드 - 추가함 by 동규 (2024.10.15)
	public Date getDeleteDate() {
	    Calendar cal = Calendar.getInstance();
	    cal.setTime(this.modifyDate);
	    cal.add(Calendar.DATE, 30);
	    return new Date(cal.getTimeInMillis());
	}
	
}
