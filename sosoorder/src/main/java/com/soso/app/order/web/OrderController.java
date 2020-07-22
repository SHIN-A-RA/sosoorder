
package com.soso.app.order.web;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soso.app.menu.service.MenuSearchVO;
import com.soso.app.order.service.OrderCptVO;
import com.soso.app.order.service.OrderService;
import com.soso.app.point.service.PointService;
import com.soso.app.point.service.PointVO;

@Controller
public class OrderController {
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	PointService pointService;
	
	
	//by혜원, 주문페이지 
	@RequestMapping("/orderInsert")
	public String orderInsert(Model model, MenuSearchVO menuSearchVO, HttpSession session, HttpServletRequest request) {
		
		String storeId = (String)session.getAttribute("storeId");
		int orderNum =   Integer.parseInt(request.getParameter("orderNum"));
		
		//test용 setstoreId
		menuSearchVO.setStoreId(storeId);
		menuSearchVO.setOrderNum(orderNum);
		
		menuSearchVO.setMemberNum(1);
		model.addAttribute("oderList", orderService.getOrder(menuSearchVO));
		model.addAttribute("point", pointService.getTotalPoint(menuSearchVO));
		
		return "order/orderInsert";
	}
	
	
	//by혜원, 주소찾기팝업
	@RequestMapping("/jusoPopup")
	public String jusoPopup() {
		return "empty/order/jusoPopup";
	}
	
	//by혜원, 나의쿠폰함팝업
	@RequestMapping("/orderCoupon")
	public String orderCoupon() {
		return "empty/order/orderCoupon";
	}

}

