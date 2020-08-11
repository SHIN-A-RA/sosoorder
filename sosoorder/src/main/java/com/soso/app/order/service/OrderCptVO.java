package com.soso.app.order.service;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class OrderCptVO {
	String menuOrderNum;
	String orderStar;
	String menuNum;
	String orderCount;
	Integer orderNum;
	String price;
	Integer memberNum;
	String storeId;
	
	String pointNum;
	String pointDate;
	String point;
	String pointCheck;
	
	String serialNum;
	String expStart;
	String expEnd;
	Integer discount;
	String useCheck;
	String storeName;
	String phone;
	
	String seat;
	String pointUse;
	String couponUse;
	String payCheck;
	String totalPay;
	String payNum;
	String addr;
	String cellPhone;

}
