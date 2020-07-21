package com.soso.app.mypage.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soso.app.member.service.MemberVO;
import com.soso.app.menu.service.MenuVO;
import com.soso.app.mypage.mapper.MypageMapper;
import com.soso.app.mypage.service.MypageService;
import com.soso.app.order.service.OrderCptVO;

@Service
public class MypageServiceImpl implements MypageService{

	@Autowired MypageMapper mypageMapper; 
	
	@Override
	public List<Map> getPointsList(MemberVO memberVO) {
		return mypageMapper.getPointsList(memberVO);
	}

	
	@Override
	public List<Map> getStoreList(MemberVO memberVO) {
		return mypageMapper.getStoreList(memberVO);
	}
	@Override
	public List<Map> getOrderList(MemberVO memberVO) {
		return mypageMapper.getOrderList(memberVO);
	}
	public void orderStarUpdate(OrderCptVO ordercptVO) {
		mypageMapper.orderStarUpdate(ordercptVO);
	}

}
