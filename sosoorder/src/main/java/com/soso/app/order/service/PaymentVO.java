package com.soso.app.order.service;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PaymentVO {
	String payNum;
	String payCheck;
	String payDay;
	String pointUse;
	String couponUse;
	String seatNum;
	String memberNum;
	String amount;
	String totalPay;

}
