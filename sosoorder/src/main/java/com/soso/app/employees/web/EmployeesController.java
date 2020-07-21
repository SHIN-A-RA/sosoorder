package com.soso.app.employees.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soso.app.employees.service.EmployeesService;
import com.soso.app.employees.service.EmployeesVO;

@Controller
public class EmployeesController {

	@Autowired
	EmployeesService employeesService;

	// employees 등록페이지 이동
	@RequestMapping("employeesInsertForm")
	/*@RequestMapping("employeesInsertForm/{storeId}")*/
	public String employeesInsertForm(EmployeesVO vo) {
		/* kkkk\ */
		/*변수*/
		/*return "employees/employeesInsertForm?storeId="변수;*/
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

	  
	@RequestMapping("empSchList") 
    public String getEmployees(HttpSession session,Model model) {
	model.addAttribute("empList",employeesService.getEmployees(session.getAttribute("storeId")));
	return "employees/empSchList"; 
	
	}

}