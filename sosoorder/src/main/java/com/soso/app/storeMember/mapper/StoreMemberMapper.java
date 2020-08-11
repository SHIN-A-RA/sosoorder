package com.soso.app.storeMember.mapper;

import java.util.List;

import com.soso.app.member.service.MemberVO;
import com.soso.app.storeMember.service.StoreMemberVO;

public interface StoreMemberMapper {
	public List<StoreMemberVO> getStoreMemberList(StoreMemberVO storeMemberVO);
	public StoreMemberVO getStoreMember(StoreMemberVO storeMemberVO);
	public void storeMemberDelete(StoreMemberVO storeMemberVO);
	public void memberUpdate(MemberVO memberVO);
	public void storeMemberUpdate(StoreMemberVO storeMemberVo);
	public MemberVO getMember(MemberVO memberVO);
}
