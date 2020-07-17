package com.soso.app.member.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soso.app.member.mapper.MemberMapper;
import com.soso.app.member.service.MemberService;
import com.soso.app.member.service.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired MemberMapper memberMapper; 
	//member단건조회
	@Override
	public MemberVO getMember(MemberVO memberVO) {
		return memberMapper.getMember(memberVO);
	}

	//member전체조회
	@Override
	public List<MemberVO> getMemberList(MemberVO memberVO) {
		return memberMapper.getMemberList(memberVO);
	}
	
	//admin등록폼
	@Override
	public void memberInsert(MemberVO memberVO) {
		memberMapper.memberInsert(memberVO);
		
	}

}
