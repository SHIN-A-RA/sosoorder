package com.soso.app.payment.service;
import lombok.Data;   
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PaymentVO {
	String payCheck;
	String payDay;
	String pointUse;
	String couponUse;
	String totalPay;
	String payNum;
	
	
	String yearSales;
	String monthSales;
	String daySales;
	
	
	
	/*메뉴 매출관리와 순위에 대한 추가 VO*/
	String menuName;
	String menuPrice;
	String allAcount;

	String salesValues;
	String salesRank;
	String storeId;
	
	
}
