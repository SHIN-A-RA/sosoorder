package com.soso.app.storeMember.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

import com.soso.app.admin.service.AdminVO;
import com.soso.app.member.service.MemberVO;
import com.soso.app.storeMember.service.StoreMemberService;
import com.soso.app.storeMember.service.StoreMemberVO;

@Controller
public class StoreMemberContoller {
	@Autowired StoreMemberService storeMemberService;
	
	// 회원정보 전체조회
	@RequestMapping("storeMemberList")
	public String seatList(Model model, StoreMemberVO storeMemberVO, HttpSession session) {
//		String StoreId = (String) session.getAttribute("storeId");
//		
//		storeMemberVO.setStoreId(StoreId);
//		
		model.addAttribute("storeMemberList", storeMemberService.getStoreMemberList(storeMemberVO));
		return "member/storeMemberList";
	}
	
//	@RequestMapping(value = "storeMenuUpdate", method=RequestMethod.POST, consumes="application/json")
//	@ResponseBody
//	public void storeMenuUpdate(@RequestBody AdminVO adminVO, @RequestBody MemberVO memberVO, 
//			@RequestBody PHttpSession session) {
//		String storeId = (String) session.getAttribute("storeId");
//		adminVO.setStoreId(storeId);
//		adminService.getMenuUpdate(adminVO);
//	}

}
