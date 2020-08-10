package com.soso.app.order.service;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.soso.app.menu.service.MenuVO;

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
	String paynum;
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

}
