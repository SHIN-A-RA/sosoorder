package com.soso.app.storeMember.service;

import java.util.List;

public interface StoreMemberService {
	public List<StoreMemberVO> getStoreMemberList(StoreMemberVO storeMemberVO);

	public String getStoreMember(StoreMemberVO storeMemberVO);

	public void deleteStoreMember(StoreMemberVO storeMemberVO);
}
