package com.soso.app.storeMember.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soso.app.member.service.MemberVO;
import com.soso.app.storeMember.mapper.StoreMemberMapper;
import com.soso.app.storeMember.service.StoreMemberService;
import com.soso.app.storeMember.service.StoreMemberVO;

@Service
public class StoreMemberServiceImpl implements StoreMemberService{
	
	@Autowired StoreMemberMapper storeMemberMapper;

	@Override
	public List<StoreMemberVO> getStoreMemberList(StoreMemberVO storeMemberVO) {
		
		return storeMemberMapper.getStoreMemberList(storeMemberVO);
	}

	@Override
	public StoreMemberVO getStoreMember(StoreMemberVO storeMemberVO) {
		return storeMemberMapper.getStoreMember(storeMemberVO);
	}

	@Override
	public void storeMemberDelete(StoreMemberVO storeMemberVO) {
		storeMemberMapper.storeMemberDelete(storeMemberVO);
	}

	@Override
	public void storeMemberUpdate(MemberVO memberVO) {
		storeMemberMapper.storeMemberUpdate(memberVO);
		
	}
	@Override
	public MemberVO getMember(MemberVO memberVO) {
		return storeMemberMapper.getMember(memberVO);
	}
	

}
