package com.soso.app.emp.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soso.app.admin.service.AdminVO;
import com.soso.app.emp.service.EmpService;
import com.soso.app.emp.service.EmpVO;
import com.soso.app.menu.service.MenuVO;
import com.soso.app.work.service.WorkService;
/**
 * 
 * 
 * 이대연
 * 
 * 
 *
 * */
@Controller
public class EmpController {

	
	@Autowired
	WorkService workService;
	
	@Autowired
	EmpService empService;
	
	//employees 등록페이지 이동(tr 클릭시 판별후 수정,조회 판별)
		@RequestMapping("empInsertForm")
		public String empInsertForm(EmpVO vo,Model model) {
			if(vo.getEmpNum() != null && !vo.getEmpNum().isEmpty()) {
				System.out.println("========================================="+empService.getEmpNum(vo));
				model.addAttribute("one", empService.getEmpNum(vo));
			}
			//비어있는 form으로 보냄
			return "emp/empInsertForm";
		}
		
		
	 //employee 수정
		 @RequestMapping("setUpdateEmp")
		 public String setUpdateEmp(EmpVO vo) {
			 empService.setUpdateEmp(vo);
		 return "redirect:empList"; 
		 }
		 
		
		// employees 등록DB처리
		@RequestMapping("empInsert")
		public String employeesInsert(EmpVO vo, Model model, HttpSession session) {
			String storeId = (String) session.getAttribute("storeId");
			vo.setStoreId(storeId);
			if(vo.getEmpNum()!= null && !vo.getEmpNum().isEmpty()) {			
				 empService.setUpdateEmp(vo);
			}else {
			     empService.empInsert(vo);
			}
			return "redirect:empList";
		}

		 // employees 목록조회
		 @RequestMapping("empList")
		 public String empList(EmpVO vo,Model model,HttpSession session) { 
				String storeId = (String) session.getAttribute("storeId");
				model.addAttribute("emp", empService.getEmp(storeId));
				return "emp/empList";
			}
	  
	  
	  
	  
	  
	  
	  
	  
	  // employees 근태관리 Bar 리스트 출력
	  @RequestMapping("empSalaryList") public String empBarList(EmpVO vo,Model model,HttpSession session) { 
		  String storeId = (String) session.getAttribute("storeId");
		  vo.setStoreId(storeId);  
		  model.addAttribute("empSalaryList",empService.getEmp(storeId));
	  return "emp/empSalaryList"; 
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
	
	
	//세션 초기화
	@RequestMapping("removeSession")
	public String removeSession(HttpSession session) {
		session.removeAttribute("storeId");
		session.removeAttribute("phone");
		return "redirect:/";
	}
	
	
}