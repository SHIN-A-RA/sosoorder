package com.soso.app.coupon.mapper;

import java.util.List;

import org.springframework.test.context.ContextConfiguration;

import com.soso.app.coupon.service.CouponVO;

@ContextConfiguration(locations = "classpath:/config/*-context.xml")
public interface CouponMapper {
	
	//적용가능쿠폰조회
	public List<CouponVO> findCoupon(CouponVO couponVO);

}
