
package com.soso.app.order.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrderController {
	
	
	//by혜원, 주문페이지 
	@RequestMapping("/orderInsert")
	public String orderInsert() {
		return "order/orderInsert";
	}
	
	//by혜원, 주소찾기팝업
	@RequestMapping("/jusoPopup")
	public String jusoPopup() {
		return "empty/order/jusoPopup";
	}
	
	//by혜원, 나의쿠폰함팝업
	@RequestMapping("/myCouponList")
	public String myCouponList() {
		return "empty/order/myCouponList";
	}

}

