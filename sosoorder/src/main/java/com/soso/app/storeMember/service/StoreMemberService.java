package com.soso.app.storeMember.service;

import java.util.List;

import com.soso.app.member.service.MemberVO;

public interface StoreMemberService {
	public List<StoreMemberVO> getStoreMemberList(StoreMemberVO storeMemberVO);

	public StoreMemberVO getStoreMember(StoreMemberVO storeMemberVO);

	public void storeMemberDelete(StoreMemberVO storeMemberVO);
	
	public void memberUpdate(MemberVO memberVO);
	public void storeMemberUpdate(StoreMemberVO storeMemberVo);
	
	public MemberVO getMember(MemberVO memberVO);
}
