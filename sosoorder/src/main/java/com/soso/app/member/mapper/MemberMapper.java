package com.soso.app.member.mapper;

import java.util.List;

import com.soso.app.member.service.MemberVO;



public interface MemberMapper {

	public MemberVO getMember(MemberVO memberVO);
	
	public List<MemberVO> getMemberList(MemberVO memberVO);

	public void memberInsert(MemberVO memberVO);

	/* public String getName(Integer id); */
	
	/* public List<Map<String, Object>> getEmpMap(); */
}
