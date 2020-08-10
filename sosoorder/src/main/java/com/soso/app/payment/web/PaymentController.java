package com.soso.app.payment.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.soso.app.menu.service.MenuVO;
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
	
	
	
	
	
	
	/*======================================
	 *  메뉴 판매량에 따른 차트와 관련된 기능
	 *  ==================================== */
	//메뉴 관리 페이지로 이동
	@RequestMapping("storeMng")
	public String storeMng(PaymentVO vo, HttpSession session,MenuVO menuvo){
		menuvo.setStoreId((String) session.getAttribute("storeId"));
		vo.setStoreId((String) session.getAttribute("storeId"));
		return "admin/storeMng";
	}
	
	
	
	//메뉴 순위 리스트(top3)
	@RequestMapping("menuSales")
	@ResponseBody
	public List<Map> menuSales(PaymentVO vo,HttpSession session,MenuVO menuvo,Model model){
		menuvo.setStoreId((String) session.getAttribute("storeId"));
		vo.setStoreId((String) session.getAttribute("storeId"));
		return paymentService.menuSales(vo);
		

	}
	
	//차트 출력
	@RequestMapping("menuSalesChart")
	public @ResponseBody List<Map<String, Object>> menuSalesChart(PaymentVO vo,HttpSession session,MenuVO menuvo){
		menuvo.setStoreId((String) session.getAttribute("storeId"));
		vo.setStoreId((String) session.getAttribute("storeId"));
		return paymentService.menuSalesChart(vo);
		
	}
	
	
	
	
	/*======================
	 *  일별과 월별은 삭제 해야하는 기능 
	 *  =====================*/	
	//일별 판매량 조회
	@RequestMapping("getDayTotal")
	public @ResponseBody List<Map<String, Object>> getDayTotal(PaymentVO vo,HttpSession session,MenuVO menuvo,Model model) {
		menuvo.setStoreId((String) session.getAttribute("storeId"));
		vo.setStoreId((String) session.getAttribute("storeId"));
		return paymentService.getDayTotal();
	}
	
	
	//월별 판매량 조회
	@RequestMapping("getMonthTotal")
	public @ResponseBody List<Map<String, Object>> getMonthTotal(PaymentVO vo,HttpSession session,MenuVO menuvo,Model model){
		menuvo.setStoreId((String) session.getAttribute("storeId"));
		vo.setStoreId((String) session.getAttribute("storeId"));
		return paymentService.getMonthTotal(vo);
	}
	
	
	
	
	//총 매출 데이터 조회(일,월,년)
	@RequestMapping("salesData")
	public @ResponseBody List<Map> salesData(PaymentVO vo,HttpSession session,MenuVO menuvo,Model model){
		menuvo.setStoreId((String) session.getAttribute("storeId"));
		vo.setStoreId((String) session.getAttribute("storeId"));
		return paymentService.salesData(vo);
	}
	
	
	
	
	
	
}
