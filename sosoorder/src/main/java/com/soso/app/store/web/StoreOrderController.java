package com.soso.app.store.web;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.soso.app.order.call.EchoHandler;
import com.soso.app.store.service.StoreOrderService;
import com.soso.app.store.service.StoreOrderVO;

@Controller
public class StoreOrderController {

   @Autowired StoreOrderService storeOrderService;

	@RequestMapping("storeOrderList")
	public String storeOrderList(Model model,HttpSession session, StoreOrderVO storeOrderVO) {
		String storeId = (String)session.getAttribute("storeId");
		storeOrderVO.setStoreId(storeId);
		model.addAttribute("orderList", storeOrderService.getOrderList(storeOrderVO));
		return "store/storeOrderList";
	}
	
	@RequestMapping(value="orderUpdate1", method=RequestMethod.POST)
	@ResponseBody
	public String oderUpdate1(StoreOrderVO storeOrderVO, HttpServletRequest request) {	
		storeOrderService.orderUpdate1(storeOrderVO);
		
		return "ok";
	}
	
	@RequestMapping(value="orderUpdate2", method=RequestMethod.POST)
	@ResponseBody
	public String oderUpdate2(StoreOrderVO storeOrderVO, HttpServletRequest request) {
		storeOrderService.orderUpdate2(storeOrderVO);
		
		return "ok2";
	}

}


