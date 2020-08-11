package com.soso.app.mypage.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soso.app.member.service.MemberVO;
import com.soso.app.mypage.mapper.MypageMapper;
import com.soso.app.mypage.service.MypageService;
import com.soso.app.mypage.service.UserCouponVO;
import com.soso.app.order.service.OrderCptVO;
import com.soso.app.payment.service.PaymentVO;

@Service
public class MypageServiceImpl implements MypageService{

	@Autowired MypageMapper mypageMapper; 
	
	@Override
	public List<Map> getStoreList(HashMap<String, Object> map) {
		return mypageMapper.getStoreList(map);
	}
	@Override
	public List<Map> getOrderList(MemberVO memberVO) {
		return mypageMapper.getOrderList(memberVO);
	}

	@Override
	public List<Map> StarOrderList(PaymentVO paymentVO) {
		return mypageMapper.StarOrderList(paymentVO);
	}
	@Override
	public List<Map> getPointsList(HashMap<String, Object> map) {
		return mypageMapper.getPointsList(map);
	}
	@Override
	public void orderStarUpdate(OrderCptVO ordercptVO) {
		mypageMapper.orderStarUpdate(ordercptVO);
	}
	
	@Override
	public List<Map> getCoupon(MemberVO memberVO) {
		return mypageMapper.getCoupon(memberVO);
	}
	@Override
	public void myCouponDelete(UserCouponVO usercouponVO) {
		mypageMapper.myCouponDelete(usercouponVO);
	}
	}
	

	/*
	 * public void orderStarUpdate(OrderCptVO ordercptVO) {
	 * mypageMapper.orderStarUpdate(ordercptVO); }
	 */

