package com.soso.app.storeMember.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.soso.app.admin.service.AdminVO;
import com.soso.app.member.service.MemberService;
import com.soso.app.member.service.MemberVO;
import com.soso.app.menu.service.MenuVO;
import com.soso.app.storeMember.service.StoreMemberService;
import com.soso.app.storeMember.service.StoreMemberVO;

@Controller
public class StoreMemberContoller {

	@Autowired
	StoreMemberService storeMemberService;
	
	@Autowired
	MemberService memberService;

	// 회원정보 전체조회
	@RequestMapping("storeMemberList")
	public String seatList(Model model, StoreMemberVO storeMemberVO, HttpSession session) {
	String StoreId = (String) session.getAttribute("storeId");
		storeMemberVO.setStoreId(StoreId);		
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

	// admin이 회원정보 수정 페이지 이동(해당 메뉴탭을 누르면 해당메뉴 값을 가지고 수정페이지로 이동)
	@RequestMapping("storeMemberUpdateForm")
	public String storeMemberUpdateForm(StoreMemberVO vo, Model model, HttpSession session) {
		String storeId = (String) session.getAttribute("storeId");
		vo.setStoreId(storeId);
		if (vo.getPhone() != null && !vo.getPhone().isEmpty()) {
			model.addAttribute("oneSm", storeMemberService.getStoreMember(vo));// oneMenu=단건조회
		}
		return "member/storeMemberUpdateForm";
	}
	// 회원이 회원정보 수정 페이지 이동(해당 메뉴탭을 누르면 해당메뉴 값을 가지고 수정페이지로 이동)
		@RequestMapping("memberUpdateForm")
		public String MemberUpdateForm(StoreMemberVO vo, Model model, HttpSession session) {
			String phone = (String) session.getAttribute("phone");
			vo.setPhone(phone);
			vo.setStoreId("test");
			if (vo.getPhone() != null && !vo.getPhone().isEmpty()) {
				model.addAttribute("oneSm", storeMemberService.getStoreMember(vo));// oneSm=단건조회
			}
			return "member/memberUpdateForm";
		}

	// 회원정보 수 처리하고 관리페이지로 이동(어드민)
	@RequestMapping("storeMemberUpdate")
	public String storeMemberUpdate(StoreMemberVO vo, // 1. 커맨트 객체
			Model model, HttpServletRequest request) {
		storeMemberService.storeMemberUpdate(vo);
		return "redirect:storeMemberList";
	}
	
	// 회원정보 수 처리하고 관리페이지로 이동(회원)
		@RequestMapping("memberUpdate")
		public String memberUpdate(StoreMemberVO vo, // 1. 커맨트 객체
				Model model, HttpServletRequest request) {
			storeMemberService.storeMemberUpdate(vo);
			return "redirect:storeMemberList";
		}
	
	// 회원정보 삭제
		@RequestMapping("storeMemberDelete")
		public String storeMemberDelete(StoreMemberVO vo) {
			storeMemberService.storeMemberDelete(vo);
			return "redirect:storeMemberList";
		}

}
