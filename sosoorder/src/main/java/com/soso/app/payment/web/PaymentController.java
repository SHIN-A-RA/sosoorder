package com.soso.app.payment.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.soso.app.payment.service.PaymentService;
import com.soso.app.payment.service.PaymentVO;
/**
 * 
 * 
 * 이대연
 * 
 * 
 *
 * */
@Controller
public class PaymentController {

	@Autowired
	PaymentService paymentService;
	
	//한건 조회
	@RequestMapping("getPayment")
	public List<PaymentVO> getPayment(PaymentVO vo,Model model) {
	return paymentService.getPayment(vo);
	}
	
	//일별 판매량 조회
	@RequestMapping("getDayTotal")
	public @ResponseBody List<Map<String, Object>> getDayTotal() {
		return paymentService.getDayTotal();
	}
	
	//월별 판매량 조회
	@RequestMapping("getMonthTotal")
	public @ResponseBody List<Map<String, Object>> getMonthTotal(){
		return paymentService.getMonthTotal();
	}
	
	//총 매출 데이터 조회(일,월,년)
	@RequestMapping("salesData")
	public @ResponseBody List<Map> salesData(PaymentVO vo){
		
	System.out.println("컨트롤러 salesData 넘어가는지 체크 "
			+ vo.getYearSales()+vo.getDaySales()+vo.getMonthSales()
	);	
	
		return paymentService.salesData(vo);
	}
	
	
	
	
	
	
}
