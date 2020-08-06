package com.soso.app.store.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
		

}


