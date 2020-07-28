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
}
