package com.soso.app.mypage.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soso.app.member.service.MemberVO;
import com.soso.app.menu.service.MenuVO;
import com.soso.app.mypage.mapper.MypageMapper;
import com.soso.app.mypage.service.MypageService;
import com.soso.app.order.service.OrderCptVO;
import com.soso.app.payment.service.PaymentVO;

@Service
public class MypageServiceImpl implements MypageService{

	@Autowired MypageMapper mypageMapper; 
	
	@Override
	public List<Map> getStoreList(MemberVO memberVO) {
		return mypageMapper.getStoreList(memberVO);
	}
	@Override
	public List<Map> getOrderList(HashMap<String, Object> map) {
		return mypageMapper.getOrderList(map);
	}

	@Override
	public List<Map> StarOrderList(HashMap<String, Object> map) {
		return mypageMapper.StarOrderList(map);
	}
	@Override
	public List<Map> getPointsList(HashMap<String, Object> map) {
		return mypageMapper.getPointsList(map);
	}
	@Override
	public void orderStarUpdate(OrderCptVO ordercptVO) {
		// TODO Auto-generated method stub
		
	}
	

	/*
	 * public void orderStarUpdate(OrderCptVO ordercptVO) {
	 * mypageMapper.orderStarUpdate(ordercptVO); }
	 */
}
