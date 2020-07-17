package com.soso.app.admin.web;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soso.app.admin.service.AdminService;
import com.soso.app.admin.service.AdminVO;


@Controller // Bean �벑濡�, DispacherServlet�씠 �씤�떇�븷 �닔 �엳�뒗 Controller濡� 蹂��솚 => @Compnent
public class AdminController {

	@Autowired
	AdminService adminService;
    

	//사업자 등록폼
	@RequestMapping("adminInsertForm")
	public String adminInsertForm(AdminVO vo) {
		return "basic/admin/adminInsertForm";
	}

	// 등록처리
	@RequestMapping("adminInsert")
	public String adminInsert(AdminVO vo, Model model) {
		adminService.adminInsert(vo);
		//서비스 호출
		
		return "redirect:adminList";
		
	}

	/*
	 * // 단건조회
	 * 
	 * @RequestMapping("getEmp/{employeeId}/{lastName}") public String
	 * getEmp(@PathVariable Integer employeeId, String lastName) {
	 * System.out.println(employeeId); System.out.println(lastName); return "home";
	 * }
	 */
	
	  // 목록조회
	  @RequestMapping("adminList") 
	  public String adminList(Model model) {
	  model.addAttribute("adminList", adminService.getAdminList(null)); 
	  return "admin/admin/adminInsert";
	  }
	 /* 
	 * // emp관리
	 * 
	 * @RequestMapping("empClient") public String empClient() { return
	 * "admin/emp/empClient"; }
	 * 
	 * // ajax목록
	 * 
	 * @RequestMapping("ajaxEmpList") public @ResponseBody List<EmpVO> ajaxEmpList()
	 * { return empMapper.empList(null); }
	 */

	// 수정폼

	// 수정처리

	// 삭제처리

}