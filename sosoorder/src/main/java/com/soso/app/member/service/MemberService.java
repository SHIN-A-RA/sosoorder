package com.soso.app.member.service;

import java.util.List;

public interface MemberService {

	public MemberVO getMember(MemberVO memberVO);
	public List<MemberVO> getMemberList(MemberVO memberVO);
	public void memberInsert(MemberVO memberVO);
	/* public String getName(Integer id); */
	/* public List<Map<String, Object>> getEmpMap(); */
}
