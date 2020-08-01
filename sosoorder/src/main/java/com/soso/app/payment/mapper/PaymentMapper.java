package com.soso.app.payment.mapper;

import java.util.List;
import java.util.Map;

import com.soso.app.payment.service.PaymentVO;

public interface PaymentMapper {

	public List<PaymentVO> getPayment(PaymentVO paymentVO);
	public List<Map<String, Object>> getDayTotal();
	public List<Map<String, Object>> getMonthTotal();
	
	
	
	public List<Map> salesData(PaymentVO vo);
	
}
