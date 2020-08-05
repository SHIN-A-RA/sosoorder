package com.soso.app.seat.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soso.app.admin.service.AdminService;

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
//			model.addAttribute("List", seatService.getSeatList(seatVO));
//			return "seat/seatList";
//		}

	// 좌석 등록폼으로 이동(해당 메뉴탭을 누르면 해당메뉴 값을 가지고 수정)
	@RequestMapping("seatInsertForm")
	public String seatInsertForm(SeatVO seatVO, Model model, HttpSession session) {
		String storeId = (String) session.getAttribute("storeId");
		seatVO.setStoreId(storeId);
		model.addAttribute("SeatList", seatService.getSeatList(seatVO));// 전체 조회(뿌려줌)
		// if (seatVO.getSeatNum() != null && !seatVO.getSeatNum().isEmpty()) {
		// model.addAttribute("seat", seatService.getSeat(seatVO));// seat=단건조회
		// }
		return "seat/storeSeatInsert";
	}

	// 좌석등록
	@RequestMapping("seatInsert")
	public String seatInsert(SeatVO seatVO, Model model, HttpSession session) {
		String storeId = (String) session.getAttribute("storeId");
		seatVO.setStoreId(storeId);
		System.out.println(seatVO);
		if (seatVO.getSeatNum() != null && !seatVO.getSeatNum().isEmpty()) {
			seatService.seatUpdate(seatVO);
		} else {
			seatService.seatInsert(seatVO);
		}
		
		return "redirect:seatInsertForm";
		
	}
	
	//좌석삭제
	@RequestMapping("seatDelete")
	public String seatDelete(SeatVO seatVO) {
		seatService.seatDelete(seatVO);
		return "redirect:seatInsertForm";
	}
	//인트
	@RequestMapping("intro")
	public String intro() {
		return "seat/intro";
	}
}
