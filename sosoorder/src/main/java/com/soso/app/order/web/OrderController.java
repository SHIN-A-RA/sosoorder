
package com.soso.app.order.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soso.app.menu.service.MenuSearchVO;
import com.soso.app.order.service.OrderCptVO;
import com.soso.app.order.service.OrderService;

@Controller
public class OrderController {
	
	@Autowired
	OrderService orderService;
	
	//by혜원, 주문페이지 
	@RequestMapping("/orderInsert")
	public String orderInsert(Model model, MenuSearchVO menuSearchVO) {
		//test용 set
		menuSearchVO.setStoreId("test");
		menuSearchVO.setOrderNum(1);
		model.addAttribute("oderList", orderService.getOrder(menuSearchVO));
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

