
package com.kh.usTwo.member.model.vo;

import java.sql.Date;

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
}
