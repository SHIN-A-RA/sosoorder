
package com.soso.app.order.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.soso.app.home.service.HomeService;
import com.soso.app.order.call.EchoHandler;
import com.soso.app.order.service.CallService;
import com.soso.app.order.service.CallVO;
import com.soso.app.seat.service.SeatVO;


@Controller
public class callController {
	
	@Autowired
	HomeService homeService;
	
	@Autowired
	CallService callService;
	
	@RequestMapping(value="/seatList", method=RequestMethod.GET, consumes="application/json")
	@ResponseBody
	public List<SeatVO> callInsertForm(Model model, SeatVO seatVO, HttpSession session) {
		String storeId = (String)session.getAttribute("storeInfo");
		seatVO.setStoreId(storeId);
		return homeService.seatListHome(seatVO);
	}
	
	@RequestMapping(value="/callInsert", method=RequestMethod.POST, consumes="application/json")
	@ResponseBody
	public CallVO callInsert(@RequestBody CallVO callVO, HttpSession session) {
		try {
			callService.callInsert(callVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return callVO;
	}
	
	@RequestMapping("callListForm")
	public String callListForm(Model model, CallVO callVO, HttpSession session) {
		String storeId = (String)session.getAttribute("storeId");
		callVO.setStoreId(storeId);
		model.addAttribute("callListget", callService.callGet(callVO));
		return "empty/order/callList";
	}
	
	@RequestMapping(value="/callList", method=RequestMethod.GET, consumes="application/json")
	@ResponseBody
	public List<CallVO> callList(Model model, CallVO callVO, HttpSession session) {
		String storeId = (String)session.getAttribute("storeId");
		callVO.setStoreId(storeId);
		return callService.callGet(callVO);
	}
	
	@RequestMapping(value="/callUpdate", method=RequestMethod.PUT, consumes="application/json")
	@ResponseBody
	public CallVO callUpdate(@RequestBody CallVO callVO, HttpSession session) {
		callService.callUpdate(callVO);
		return callVO;
	}
	

}

