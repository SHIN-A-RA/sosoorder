package com.soso.app.admin.web;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.soso.app.admin.service.AdminService;
import com.soso.app.admin.service.AdminVO;


@Controller // Bean �벑濡�, DispacherServlet�씠 �씤�떇�븷 �닔 �엳�뒗 Controller濡� 蹂��솚 => @Compnent
public class AdminController {

	@Autowired
	AdminService adminService;
    

	//admin 등록페이지 이동
	@RequestMapping("adminInsertForm")
	public String adminInsertForm(AdminVO vo) {
		return "admin/adminInsertForm";
	}

	//admin 등록DB처리
	@RequestMapping("adminInsert")
	public String adminInsert(AdminVO vo, Model model) {
		adminService.adminInsert(vo);
		//서비스 호출
		
		return "redirect:memberLoginForm";
		
	}

	//아이디 중복 체크 
	@GetMapping("idCheck")
	public @ResponseBody int idCheck(@RequestParam("storeId")String id) {
		int cnt=adminService.idCheck(id);
		return cnt;
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
	  return "admin/adminInsert";
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