package com.soso.app.mypage.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.soso.app.member.service.MemberVO;
import com.soso.app.mypage.service.MypageService;
import com.soso.app.mypage.service.UserCouponVO;
import com.soso.app.order.service.OrderCptVO;

@Controller
public class MypageController {

	@Autowired
	MypageService mypageService;

	// by아라

	// 마이페이지 적립금목록조회

	@RequestMapping("myPointList")
	public String getPointsList(MemberVO memberVO, Model model, HttpSession session,
			@RequestParam(required = false, value="storeId") String storeId) {
		String phone = (String)session.getAttribute("phone");
		memberVO.setPhone(phone);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("phone", phone);
		map.put("storeId", storeId);

		model.addAttribute("myPointsList", mypageService.getPointsList(map));
		model.addAttribute("MyStoreList", mypageService.getStoreList(memberVO));
		return "mypage/myPointList";
	}
	
	//마이페이지 주문내역, 별점
	
	@RequestMapping("myOrderList")
	public String getOrderList(MemberVO memberVO, Model model, HttpSession session,
			@RequestParam(required = false, value="storeId") String storeId) {
		String phone = (String)session.getAttribute("phone");
		memberVO.setPhone(phone);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("phone", phone);
		map.put("storeId", storeId);
		model.addAttribute("myOrderList", mypageService.getOrderList(map));
		model.addAttribute("myStarOrderList", mypageService.StarOrderList(map));
		return "mypage/myOrderList";
	}
	
	@RequestMapping("orderStarUpdate")
	public String orderStarUpdate(@ModelAttribute OrderCptVO vo, HttpServletRequest request) {
		String onClass= request.getParameter("starC");
		vo.setOrderStar(onClass);
		mypageService.orderStarUpdate(vo);
		return "mypage/myOrderList";
		
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
		model.addAttribute("getCoupon", mypageService.getCoupon(map));
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
	
	
	
	/*
	 * @RequestMapping("myPointsList") public String getStoreList(PointVO vo, Model
	 * model) {
	 * 
	 * return "mypage/myPoinstList"; }
	 */
	// 아이디 중복 체크 이름 중복체크로 이용될 수 있음
	/*
	 * @GetMapping("idCheck") public int idCheck(AdminVO vo, String id) { int cnt =
	 * employeesService.idCheck(vo.getStoreId()); return cnt; }
	 */

	// employees 단건조회
	/*
	 * @RequestMapping("getEmp/{employeeId}/{lastName}") public String
	 * getEmp(@PathVariable Integer employeeId, String lastName) {
	 * System.out.println(employeeId); System.out.println(lastName); return "home";
	 * }
	 */
	/*
	 * // employees ajax목록
	 * 
	 * @RequestMapping("ajaxGetEmployeesList") public @ResponseBody
	 * List<EmployeesVO> ajaxGetEmployeesList(EmployeesVO vo) { return
	 * employeesService.getEmployeesList(vo); }
	 */

	// 수정폼

	// 수정처리

	// 삭제처리

}