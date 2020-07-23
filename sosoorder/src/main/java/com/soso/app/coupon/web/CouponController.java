package com.soso.app.coupon.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soso.app.coupon.service.CouponService;

@Controller
public class CouponController {
	
	@Autowired
	CouponService couponService;
	

}
