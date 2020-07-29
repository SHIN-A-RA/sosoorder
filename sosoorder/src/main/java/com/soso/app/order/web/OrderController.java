
package com.soso.app.order.web;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.soso.app.order.service.OrderCptVO;
import com.soso.app.order.service.OrderService;


@Controller
public class OrderController {
	
	@Autowired
	OrderService orderService;
	
	//by혜원, 주문페이지 
	@RequestMapping("/orderInsert")
	public String orderInsert(Model model, OrderCptVO orderCptVO, HttpSession session) {
		
		String storeId = (String)session.getAttribute("storeId");
		String phone = (String)session.getAttribute("phone");
		
		orderCptVO.setStoreId(storeId);
		
		if (phone == null) {
			orderCptVO.setPhone("null");
			orderCptVO.setMemberNum(0);
			
		}else {			
			orderCptVO.setPhone(phone);
		}
	
//		orderCptVO.setOrderNum(orderNum);
		
		model.addAttribute("oderList", orderService.getOrder(orderCptVO));
		model.addAttribute("point", orderService.getTotalPoint(orderCptVO));
		model.addAttribute("coupon", orderService.findCoupon(orderCptVO));
		model.addAttribute("seat", orderService.getSeat(orderCptVO));
		
		return "order/orderInsert";
	}
	
	
	//by혜원, 주소찾기팝업
	@RequestMapping("/jusoPopup")
	public String jusoPopup() {
		return "empty/order/jusoPopup";
	}
	
	@RequestMapping("payInsert")
	public String payInsert(Model model, OrderCptVO orderCptVO, HttpSession session) {
		
		String storeId = (String)session.getAttribute("storeId");
		String phone = (String)session.getAttribute("phone");

		orderCptVO.setStoreId(storeId);

		
		if (phone == null) {
			orderCptVO.setPhone("0");
//			orderCptVO.setMemberNum(0);
			
		}else {			
			orderCptVO.setPhone(phone);
		}

		System.out.println("orderCptVO" + orderCptVO);
		orderService.payInsert(orderCptVO);
		
		//페이먼트 프로시저
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if(phone == null) {
			map.put("phone", "0"); 			
		}else {
			map.put("phone", phone); 			
		}
		
		map.put("storeId", storeId);
			
		String serialNum = orderCptVO.getSerialNum();
		map.put("serialNum", serialNum);
		
		String pointUse = orderCptVO.getPointUse();
		map.put("pointUse", pointUse);
		
		orderService.paymentProc(map);
		
		return "order/orderConfirm";
	}
	
	@RequestMapping("/orderConfirm")
	public String orderConfirm(Model model, OrderCptVO orderCptVO, HttpServletRequest request) {
		
		
		return "";
		
	}
	
	@RequestMapping("insertPoint")
	public String insertPoint(Model model, OrderCptVO orderCptVO, HttpServletRequest request) {
		String orderNum = request.getParameter("orderNum");
		
		return "empty/order/insertPoint";
	}

}

