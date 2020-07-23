package com.soso.app.coupon.service;

import com.soso.app.order.service.OrderCptVO;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CouponVO {
	String serialNum;
	String expStart;
	String expEnd;
	String storeId;
	Integer discount;
	String memberNum;
	String userCheck;
	
	
}
