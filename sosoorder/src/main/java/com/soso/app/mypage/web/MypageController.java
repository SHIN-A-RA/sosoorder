package com.soso.app.mypage.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.soso.app.member.service.MemberVO;
import com.soso.app.mypage.service.MypageService;
import com.soso.app.mypage.service.UserCouponVO;
import com.soso.app.order.service.OrderCptVO;
import com.soso.app.payment.service.PaymentVO;

@Controller
public class MypageController {

	@Autowired
	MypageService mypageService;
	// by아라
	// 마이페이지 적립금목록조회
	@RequestMapping("myPointsList")
	public String getPointsList(MemberVO memberVO, Model model, HttpSession session,
			@RequestParam(required = false, value="storeId") String storeId) {
		String phone = (String)session.getAttribute("phone");
		memberVO.setPhone(phone);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("phone", phone);
		map.put("storeId", storeId);
		model.addAttribute("myPointsList", mypageService.getPointsList(map));
		model.addAttribute("MyStoreList", mypageService.getStoreList(map));
		return "mypage/myPointsList";
	}
	
	//마이페이지 주문내역, 별점
	
	@RequestMapping("myOrderList")
	public String getOrderList(MemberVO memberVO, Model model, HttpSession session) {
		String phone = (String)session.getAttribute("phone");
		memberVO.setPhone(phone);
		/*
		 * HashMap<String, Object> map = new HashMap<String, Object>(); map.put("phone",
		 * phone); map.put("storeId", storeId);
		 */
		model.addAttribute("myOrderList", mypageService.getOrderList(memberVO));
		return "mypage/myOrderList";
	}
	
	@RequestMapping(value="StarOrderList", method=RequestMethod.GET)
	@ResponseBody
	public List<Map> StarOrderList(PaymentVO paymentVO) {
		return mypageService.StarOrderList(paymentVO);
	}
	
	@RequestMapping(value="orderStarUpdate", method=RequestMethod.PUT)
	@ResponseBody
	public OrderCptVO orderStarUpdate(@RequestBody OrderCptVO vo, HttpServletRequest request) {
		mypageService.orderStarUpdate(vo);
		return vo;
		
	}
	//마이페이지 나의 쿠폰함

	@RequestMapping("myCouponList")
	public String getCoupon(MemberVO memberVO, Model model, HttpSession session,
			@RequestParam(required = false, value="storeId") String storeId) {
		String phone = (String)session.getAttribute("phone");
		memberVO.setPhone(phone);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("phone", phone);
		map.put("storeId", storeId);
		model.addAttribute("myCouponList", mypageService.getCoupon(map));
	return "mypage/myCouponList";
	}
	
	
	@RequestMapping(value="myCouponDelete/{serialNum}", method=RequestMethod.DELETE)
	@ResponseBody
	public Map myCouponDelete(@PathVariable String serialNum, UserCouponVO usercouponVO) {
		mypageService.myCouponDelete(usercouponVO);
		Map result = new HashMap<String, Object>();
		result.put("result", Boolean.TRUE);
		return result;
	}
	
	
	
	

}