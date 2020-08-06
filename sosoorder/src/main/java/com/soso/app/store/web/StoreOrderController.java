package com.soso.app.store.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import com.soso.app.store.service.StoreOrderService;
import com.soso.app.store.service.StoreOrderVO;

@Controller
public class StoreOrderController {

   @Autowired StoreOrderService storeOrderService;

	@RequestMapping("getOrderList")
	public @ResponseBody List<Map<String,Object>> getOrderList(Model model, StoreOrderVO storeOrderVO){
		
		return storeOrderService.getOrderList(storeOrderVO);
	}
	
	@RequestMapping("storeOrderList")
	public String storeOrderList(Model model,HttpSession session, StoreOrderVO storeOrderVO) {
		model.addAttribute("orderList", storeOrderService.getOrderList(storeOrderVO));
		return "store/storeOrderList";
	}
	
	@RequestMapping(value="orderUpdate1", method=RequestMethod.POST)
	@ResponseBody
	public void oderUpdate1(StoreOrderVO storeOrderVO) {
		storeOrderService.orderUpdate1(storeOrderVO);
	}
	
	@RequestMapping(value="orderUpdate2", method=RequestMethod.POST)
	@ResponseBody
	public void oderUpdate2(StoreOrderVO storeOrderVO) {
		storeOrderService.orderUpdate2(storeOrderVO);
	}

}


