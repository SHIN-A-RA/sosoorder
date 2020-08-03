package com.soso.app.payment.mapper;

import java.util.List;
import java.util.Map;

import com.soso.app.payment.service.PaymentVO;

public interface PaymentMapper {

	public List<PaymentVO> getPayment(PaymentVO paymentVO);
	public List<Map<String, Object>> getDayTotal();
	public List<Map<String, Object>> getMonthTotal();
	
	
	/* 매출과 관련된 메소드 */
	public List<Map> salesData(PaymentVO vo);
	
	/* 메뉴 매출에 관한 메소드 */
	public List<Map> menuSales(PaymentVO vo);
	public List<Map<String, Object>>  menuSalesChart(PaymentVO vo);
}
