package com.soso.app.seat.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soso.app.admin.service.AdminService;
import com.soso.app.admin.service.AdminVO;
import com.soso.app.menu.service.MenuVO;
import com.soso.app.seat.service.SeatService;
import com.soso.app.seat.service.SeatVO;

@Controller
public class SeatController {
	
	@Autowired
	SeatService seatService;
	
	@Autowired
	AdminService adminService;
	
	// 좌석 전체조회
//		@RequestMapping("seatList")
//		public String seatList(Model model, SeatVO seatVO, HttpSession session) {
//			String storeId = (String) session.getAttribute("storeId");
//			 
//			seatVO.setStoreId(storeId);
//			
//			model.addAttribute("SeatList", seatService.getSeatList(seatVO));
//			return "seat/SeatList";
//		}
		
		// 좌석 등록 (해당 메뉴탭을 누르면 해당메뉴 값을 가지고 수정)
		@RequestMapping("seatInsertForm")
		public String seatInsertForm(SeatVO seatVO, Model model,HttpSession session) {
//			if (seatVO.getSeatNum() != null && !seatVO.getSeatNum().isEmpty()) {
//				model.addAttribute("seat", seatService.getSeat(seatVO));// seat=단건조회
//			}
			String storeId = (String) session.getAttribute("storeId");
			seatVO.setStoreId(storeId);
			model.addAttribute("SeatList", seatService.getSeatList(seatVO));
			return "seat/storeSeatInsert";
		}

}
