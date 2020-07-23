package com.soso.app.coupon.service;

import java.util.List;

public interface CouponService {
	
	//적용가능쿠폰조회
	public List<CouponVO> findCoupon(CouponVO couponVO);

}
