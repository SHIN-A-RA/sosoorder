package com.soso.app.storeMember.service;

import java.util.List;

public interface StoreMemberService {
	public List<StoreMemberVO> getStoreMemberList(StoreMemberVO storeMemberVO);

	public StoreMemberVO getStoreMember(StoreMemberVO storeMemberVO);

	public void storeMemberDelete(StoreMemberVO storeMemberVO);
	
	public void storeMemberUpdate(StoreMemberVO storeMemberVO);
}
