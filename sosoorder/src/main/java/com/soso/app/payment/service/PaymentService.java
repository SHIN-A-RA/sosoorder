package com.soso.app.payment.service;

import java.util.List;
import java.util.Map;

public interface PaymentService {

	public List<PaymentVO> getPayment(PaymentVO paymentVO);
	public List<Map<String, Object>> getDayTotal();
	public List<Map<String, Object>> getMonthTotal();
}
