package com.soso.app.storeMember.mapper;

import java.util.List;

import com.soso.app.storeMember.service.StoreMemberVO;

public interface StoreMemberMapper {
	public List<StoreMemberVO> getStoreMemberList(StoreMemberVO storeMemberVO);
	public String getStoreMember(StoreMemberVO storeMemberVO);
	public void deleteStoreMember(StoreMemberVO storeMemberVO);
}
