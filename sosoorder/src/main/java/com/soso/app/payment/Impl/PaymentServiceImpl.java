package com.soso.app.payment.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.soso.app.payment.mapper.PaymentMapper;
import com.soso.app.payment.service.PaymentService;
import com.soso.app.payment.service.PaymentVO;

public class PaymentServiceImpl implements PaymentService {

	@Autowired
	PaymentMapper paymentMapper;
	
	@Override
	public List<PaymentVO> getPayment(PaymentVO paymentVO) {
		return paymentMapper.getPayment(paymentVO);
	}

	@Override
	public List<Map<String, Object>> getDayTotal() {
		return paymentMapper.getDayTotal();
	}

	@Override
	public List<Map<String, Object>> getMonthTotal() {
		return paymentMapper.getMonthTotal();
	}

}
