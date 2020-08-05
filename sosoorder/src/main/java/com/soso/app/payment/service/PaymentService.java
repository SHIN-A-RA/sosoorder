package com.soso.app.payment.service;

import java.util.List;
import java.util.Map;

public interface PaymentService {

	public List<PaymentVO> getPayment(PaymentVO paymentVO);
	public List<Map<String, Object>> getDayTotal();
	
	public List<Map<String, Object>> getMonthTotal(PaymentVO vo);
	
	
	
	/* 메뉴에 대한 매출관리 */
	public List<Map> salesData(PaymentVO vo);
	public List<Map<String, Object>>  menuSalesChart(PaymentVO vo);
	public List<Map> menuSales(PaymentVO vo);
}
