package com.soso.app.emp.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soso.app.emp.service.EmpService;
import com.soso.app.emp.service.EmpVO;
import com.soso.app.work.service.WorkService;

@Controller
public class EmpController {

	
	
	@Autowired
	EmpService empService;
	
	@Autowired
	WorkService workService;
	
	// employees 등록페이지 이동
	@RequestMapping("empInsertForm")
	public String empInsertForm(EmpVO vo,Model model) {
		return "emp/empInsertForm";
	}


	// employees 수정페이지 이동
	@RequestMapping("empEditForm") 
	public String empViewForm(EmpVO vo,Model model) {
		model.addAttribute("oneEmp", empService.getEmp(vo));// oneMenu=단건조회 } 
		return "empView"; 
	}
	  // 수정처리
	 @RequestMapping("empView") 
	 public String empView(EmpVO vo) {
		 empService.setUpdateEmp(vo);
	 return "redirect:empList"; 
	 }
	 
	
	// employees 등록DB처리
	@RequestMapping("empInsert")
	public String employeesInsert(EmpVO vo, Model model, HttpSession session) {
		String storeId =(String)session.getAttribute("storeId");
		vo.setStoreId(storeId);
		empService.empInsert(vo);
		model.addAttribute("empList", empService.getEmpList(storeId));
		return "redirect:/";

	}

	  // employees 목록조회
	  @RequestMapping("empList") public String empList(EmpVO vo,Model model,HttpSession session) { 
		  String storeId = (String) session.getAttribute("storeId");
		  model.addAttribute("empList",empService.getEmp(storeId));
	  return "emp/empList"; 
	  }

	//직원 근태관리 - 값 달력으로 보내기  
	@RequestMapping("empSchList") 
    public String getEmp(HttpSession session,Model model) {
		String storeId = (String) session.getAttribute("storeId");
		model.addAttribute("empList",empService.getEmp(storeId));
		model.addAttribute("getEmpListTime", workService.getEmpListTime(storeId));
		return "emp/empSchList"; 
	
	}
	//직원 삭제
	@RequestMapping("getEmpDelete")
	public String getEmpDelete(EmpVO vo,HttpSession sessoin) {
		empService.getEmpDelete(vo);
		return "redirect:empList";
		
	}
}