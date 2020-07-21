package com.soso.app.mypage.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soso.app.member.service.MemberVO;
import com.soso.app.mypage.service.MypageService;
import com.soso.app.order.service.OrderCptVO;

@Controller
public class MypageController {

	@Autowired
	MypageService mypageService;

	// by아라

	// 마이페이지 적립금목록조회

	@RequestMapping("myPointList")
	public String getPointsList(MemberVO memberVO, Model model) {
		model.addAttribute("myPointsList", mypageService.getPointsList(memberVO));
		model.addAttribute("MyStoreList", mypageService.getStoreList(memberVO));
		return "mypage/myPointList";
	}
	

	@RequestMapping("myOrderList")
	public String getOrderList(MemberVO memberVO, Model model) {
		model.addAttribute("myOrderList", mypageService.getOrderList(memberVO));
		return "mypage/myOrderList";
	}
	
	public String orderStarUpdate(@ModelAttribute OrderCptVO vo, HttpServletRequest request) {
		String onClass= request.getParameter("starC");
		vo.setOrderStar(onClass);
		mypageService.orderStarUpdate(vo);
		return "mypage/myOrderList";
		
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