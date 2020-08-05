package com.soso.app.payment.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soso.app.payment.mapper.PaymentMapper;
import com.soso.app.payment.service.PaymentService;
import com.soso.app.payment.service.PaymentVO;

@Service
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
	public List<Map<String, Object>> getMonthTotal(PaymentVO paymentVO) {
		return paymentMapper.getMonthTotal(paymentVO);
	}

	@Override
	public List<Map> salesData(PaymentVO vo) {
		return paymentMapper.salesData(vo);
	}

	
	/*=========================================
	 *  메뉴 매출량 및 판매량에 따른 차트와 리스트 
	 *  =======================================*/
	@Override
	public List<Map<String, Object>>  menuSalesChart(PaymentVO vo) {
		return paymentMapper.menuSalesChart(vo);
	}

	@Override
	public List<Map> menuSales(PaymentVO vo) {
		return paymentMapper.menuSales(vo);
	}


}
