package com.soso.app.coupon.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soso.app.coupon.mapper.CouponMapper;
import com.soso.app.coupon.service.CouponService;
import com.soso.app.coupon.service.CouponVO;

@Service
public class CouponServiceImpl implements CouponService{
	
	@Autowired CouponMapper couponMapper;

	@Override
	public List<CouponVO> findCoupon(CouponVO couponVO) {
		return couponMapper.findCoupon(couponVO);
	}
}
