package com.soso.app.member.service;

import lombok.Data;   
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MemberVO {
	String memberNum;
	String phone;
	String pwd;
	String email;
	String delAddr;
}
