
package com.soso.app.order.web;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.soso.app.member.service.MemberService;
import com.soso.app.member.service.MemberVO;
import com.soso.app.order.call.EchoHandler;
import com.soso.app.order.service.OrderCptVO;
import com.soso.app.order.service.OrderService;

@Controller
public class OrderController {

	@Autowired
	OrderService orderService;

	@Autowired
	MemberService memberService;

	// by혜원, 주문페이지
	@RequestMapping("/orderInsert")
	public String orderInsert(Model model, OrderCptVO orderCptVO, HttpSession session) {

		String storeId = (String) session.getAttribute("storeInfo");
		String phone = (String) session.getAttribute("phone");

		orderCptVO.setStoreId(storeId);

		if (phone == null) {
			orderCptVO.setPhone("null");
			orderCptVO.setMemberNum(0);

		} else {
			orderCptVO.setPhone(phone);
		}

//      orderCptVO.setOrderNum(orderNum);

		model.addAttribute("oderList", orderService.getOrder(orderCptVO));
		model.addAttribute("point", orderService.getTotalPoint(orderCptVO));
		model.addAttribute("addr", orderService.getAddr(orderCptVO));
		model.addAttribute("coupon", orderService.findCoupon(orderCptVO));
		model.addAttribute("seat", orderService.getSeat(orderCptVO));

		return "order/orderInsert";
	}

	// by혜원, 주소찾기팝업
	@RequestMapping("/jusoPopup")
	public String jusoPopup() {
		return "empty/order/jusoPopup";
	}

	@RequestMapping("payInsert")
	public String payInsert(Model model, OrderCptVO orderCptVO, HttpSession session) {

		String storeId = (String) session.getAttribute("storeInfo");
		String phone = (String) session.getAttribute("phone");

		orderCptVO.setStoreId(storeId);

		if (phone == null) {
			orderCptVO.setPhone("0");
//         orderCptVO.setMemberNum(0);

		} else {
			orderCptVO.setPhone(phone);
		}

		orderService.payInsert(orderCptVO);
		
		session.setAttribute("payNum",orderCptVO.getPayNum());


		// 페이먼트 프로시저
		HashMap<String, Object> map = new HashMap<String, Object>();

		if (phone == null) {
			map.put("phone", "0");
		} else {
			map.put("phone", phone);
		}

		map.put("storeId", storeId);

		String serialNum = orderCptVO.getSerialNum();
		map.put("serialNum", serialNum);

		String pointUse = orderCptVO.getPointUse();
		map.put("pointUse", pointUse);
		
		String addr = orderCptVO.getAddr();
		map.put("addr", addr);
		
		String cellphone = orderCptVO.getCellPhone();
		map.put("cellphone", cellphone);
		
		map.put("payNum", orderCptVO.getPayNum());
		orderService.paymentProc(map);
		
	


		return "redirect:orderConfirm";
	}

	@RequestMapping("/orderConfirm")
	public String orderConfirm(Model model, OrderCptVO orderCptVO, HttpServletRequest request, HttpSession session) {
		
		return "order/orderConfirm";

	}

	@RequestMapping("insertPoint")
	public String insertPoint(Model model, OrderCptVO orderCptVO, HttpServletRequest request, HttpSession session) {
		String storeId = (String) session.getAttribute("storeInfo");
		orderCptVO.setStoreId(storeId);

		return "empty/order/insertPoint";
	}

	// 회원 적립금 적립
	@RequestMapping("insertPo")
	public String insertPo(Model model, MemberVO memberVO, OrderCptVO orderCptVO, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		String storeId = (String) session.getAttribute("storeInfo");
		orderCptVO.setStoreId(storeId);

		String path = null;
		MemberVO dbVO = memberService.getMember(memberVO);
		if (dbVO == null) {
			model.addAttribute("errorMsg", "없는 휴대폰번호");
			path = "order/insertPoint";

		} else if (!memberVO.getPwd().equals(dbVO.getPwd())) {
			model.addAttribute("errorMsg", "pwd오류");
			path = "order/insertPoint";

		} else {
			session.setAttribute("phone", memberVO.getPhone());
			String phone = (String) session.getAttribute("phone");
			orderCptVO.setPhone(phone);
		}

		orderService.insertPo(orderCptVO);
		model.addAttribute("pList", orderService.showPoint(orderCptVO));

		return "redirect:showPoint";
	}

	// 비회원 적립
	@RequestMapping("insertMem")
	public String insertMem(Model model, MemberVO memberVO, OrderCptVO orderCptVO, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		String storeId = (String) session.getAttribute("storeInfo");
		orderCptVO.setStoreId(storeId);

		orderService.insertMem(memberVO, orderCptVO);

		model.addAttribute("pList", orderService.showPoint(orderCptVO));
		return "redirect:showPoint";
	}

	// 적립금리스트보여주기
	@RequestMapping("/showPoint")
	public String showPoint(Model model, OrderCptVO orderCptVO, HttpSession session) {

		String phone = (String) session.getAttribute("phone");
		orderCptVO.setPhone(phone);

		model.addAttribute("pList", orderService.showPoint(orderCptVO));

		return "empty/order/pointList";
	}

	// 영수증
	@RequestMapping("/receipt")
	public String receipt(Model model, OrderCptVO orderCptVO) {
		System.out.println(orderCptVO.getOrderNum());
		model.addAttribute("receipt", orderService.receiptGet(orderCptVO));
		return "order/receipt";
	}

}
