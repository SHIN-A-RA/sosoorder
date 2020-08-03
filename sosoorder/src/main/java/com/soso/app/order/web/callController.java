
package com.soso.app.order.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.soso.app.home.service.HomeService;
import com.soso.app.order.service.CallService;
import com.soso.app.order.service.CallVO;
import com.soso.app.seat.service.SeatVO;


@Controller
public class callController {
	
	@Autowired
	HomeService homeService;
	
	@Autowired
	CallService callService;
	
	@RequestMapping("callInsertForm")
	public String callInsertForm(Model model, SeatVO seatVO, HttpSession session) {
		String storeId = (String)session.getAttribute("storeId");
		seatVO.setStoreId(storeId);
		model.addAttribute("seatListCall", homeService.seatListHome(seatVO));
		
		String seat = (String)session.getAttribute("seat");
		seatVO.setSeat(seat);
		model.addAttribute("seatCheck", seatVO);
		return "empty/order/callInsert";
	}
	
	@RequestMapping(value="/callInsert", method=RequestMethod.POST, consumes="application/json")
	@ResponseBody
	public CallVO callInsert(@RequestBody CallVO callVO, HttpSession session) {
		String storeId = (String)session.getAttribute("storeId");
		callVO.setStoreId(storeId);
		callService.callInsert(callVO);
		return callVO;
	}
	
	@RequestMapping("callInsertList")
	public String callInsertList(Model model, SeatVO seatVO, HttpSession session) {
		return "empty/order/callIList";
	}

}

