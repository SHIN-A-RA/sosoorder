
package com.soso.app.order.web;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.soso.app.admin.service.AdminService;
import com.soso.app.admin.service.AdminVO;
import com.soso.app.member.service.MemberService;
import com.soso.app.member.service.MemberVO;
import com.soso.app.order.call.EchoHandler;
import com.soso.app.order.service.MessageVO;
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
			orderCptVO.setPhone("0");

		} else {
			orderCptVO.setPhone(phone);
		}

//      orderCptVO.setOrderNum(orderNum);

		model.addAttribute("oderList", orderService.getOrder(orderCptVO));
		model.addAttribute("point", orderService.getTotalPoint(orderCptVO));
		model.addAttribute("addr", orderService.getAddr(orderCptVO));
		model.addAttribute("coupon", orderService.findCoupon(orderCptVO));
		model.addAttribute("seat", orderService.getSeat(orderCptVO));
		model.addAttribute("admin", orderService.getAccount(orderCptVO));

		return "order/orderInsert";
	}

	// by혜원, 주소찾기팝업
	@RequestMapping("/jusoPopup")
	public String jusoPopup() {
		return "empty/order/jusoPopup";
	}

	@RequestMapping("payInsert")
	public String payInsert(Model model, OrderCptVO orderCptVO, HttpSession session, HttpServletResponse response)
			throws IOException {

		String storeId = (String) session.getAttribute("storeInfo");
		String phone = (String) session.getAttribute("phone");
		String path = null;
		orderCptVO.setStoreId(storeId);

		if (phone == null) {
			orderCptVO.setPhone("0");
		} else {
			orderCptVO.setPhone(phone);
		}
		orderService.payInsert(orderCptVO);
		session.setAttribute("payNum", orderCptVO.getPayNum());

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

		// mybatis select로 paynum 받기
		map.put("payNum", orderCptVO.getPayNum());
		orderService.paymentProc(map);

		// 주문현황에서 받을 리스트 list에 담아서 map에 담기
		List orderList = orderService.getOrder(orderCptVO);
		Map<String, Object> orderMap = new HashMap<String, Object>();
		orderMap.put("payInfo", orderCptVO);
		orderMap.put("orderList", orderList);

		// json -> string ->json
		ObjectMapper objectMapper = new ObjectMapper();
		MessageVO msg = new MessageVO();
		msg.setCmd("orderInsert");
		// 주문정보 string에 담기
		String msgJson = objectMapper.writeValueAsString(orderMap);
		// msg의 msg에 주문내역 담기
		msg.setMsg(msgJson);
		// 소켓으로 storeId찾아서 sendMessage 하기
		if (EchoHandler.map.get(storeId) != null) {
			EchoHandler.map.get(storeId).sendMessage(new TextMessage(objectMapper.writeValueAsString(msg)));
			path = "redirect:orderConfirm";
		} else if (EchoHandler.map.get(storeId) == null) {
			PrintWriter out = response.getWriter();
			response.setContentType("text/html; charset=utf-8");
			out.println("<script language='javascript'>");
			out.println("alert('현재 가게가 오픈하지 않았습니다.');");
			out.println("</script>");
			out.flush();
			path = "redirect:home";
		}
		return path;

	}

	@RequestMapping("/orderConfirm")
	public String orderConfirm(Model model, OrderCptVO orderCptVO, HttpServletRequest request, HttpSession session) {
		
		 String payNum = (String) session.getAttribute("payNum");
		 orderCptVO.setPayNum(payNum); model.addAttribute("oderList",
		 orderService.getOrder(orderCptVO));
		 

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
			model.addAttribute("errorMsg", "없는 휴대폰번호 입니다.");
			path = "empty/order/insertPoint";

		} else if (!memberVO.getPwd().equals(dbVO.getPwd())) {
			model.addAttribute("errorMsg", "pwd 오류입니다.");
			path = "empty/order/insertPoint";

		} else {
			session.setAttribute("phone", memberVO.getPhone());
			path = "redirect:showPoint";
			orderService.insertPo(orderCptVO);
			model.addAttribute("pList", orderService.showPoint(orderCptVO));
		}
		return path;
	}

	// 비회원 적립
	@RequestMapping("insertMem")
	public String insertMem(Model model, MemberVO memberVO, OrderCptVO orderCptVO, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		String storeId = (String) session.getAttribute("storeInfo");
		orderCptVO.setStoreId(storeId);

		orderService.insertMem(memberVO, orderCptVO);

		session.setAttribute("phone", memberVO.getPhone());

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

		return "order/receipt";
	}

}
