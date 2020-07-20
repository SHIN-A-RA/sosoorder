package com.soso.app.employees.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soso.app.employees.service.EmployeesService;
import com.soso.app.employees.service.EmployeesVO;

@Controller
public class EmployeesController {

	@Autowired
	EmployeesService employeesService;

	// employees 등록페이지 이동
	@RequestMapping("employeesInsertForm")
	public String employeesInsertForm(EmployeesVO vo) {
		return "employees/employeesInsertForm";
	}

	// employees 등록DB처리
	@RequestMapping("employeesInsert")
	public String employeesInsert(EmployeesVO vo, Model model, HttpSession session) {

		/*
		 * vo.setStoreId(session.getAttribute("storeId")); 로그인(토글인지 다른 것인지) 설정을 해야 세션값을
		 * 정획히 담을 수 있다 현재는 로그인을 하는 상황이 없었기 때문에 세션값에 아무것도 저장되지 않는다(로그인 까지만
		 * 구현됨(session=폰번,패스워드)
		 */

		employeesService.employeesInsert(vo);
		// 서비스 호출
		model.addAttribute("empList", employeesService.getEmployeesList(null));
		return "employees/employeesList";

	}

	
	  // employees 목록조회
	  
	  @RequestMapping("employeesList") public String employeesList(EmployeesVO vo,Model model) { 
		  model.addAttribute("empList",employeesService.getEmployeesList(null));
	  return "employees/employeesList"; 
	  }
	 

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