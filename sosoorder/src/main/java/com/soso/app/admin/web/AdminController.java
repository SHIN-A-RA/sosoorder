package com.soso.app.admin.web;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.soso.app.admin.service.AdminService;
import com.soso.app.admin.service.AdminVO;

/**
 * 
 * 
 * 이대연
 * 
 * 
 *
 * */

@Controller // Bean �벑濡�, DispacherServlet�씠 �씤�떇�븷 �닔 �엳�뒗 Controller濡� 蹂��솚 => @Compnent
public class AdminController {

	@Autowired
	AdminService adminService;
    
	//admin로그인DB처리
	@RequestMapping("adminLogin")
	public String memberLogin(AdminVO vo, Model model,HttpSession session) {
		String path = null;
		AdminVO dbVO = adminService.getAdmin(vo);
		System.out.println(vo.getStoreId());
		
		//&& !vo.getPhone().equals(dbVO.getPhone())
		
		if (dbVO == null ) {
	         model.addAttribute("errorMsg", "id오류");
	          path = "member/memberLoginForm";
	         
	      } else if (!vo.getStorePwd().equals(dbVO.getStorePwd())) {
	    	  model.addAttribute("errorMsg", "pwd오류");
	    	  path = "member/memberLoginForm";

	      } else {
	         session.setAttribute("storeId", vo.getStoreId());
	         session.setAttribute("storePwd", vo.getStorePwd());
	         
	         path = "redirect:/";
	      }
		return path;
	}
	
	//admin 등록페이지 이동
	@RequestMapping("adminInsertForm")
	public String adminInsertForm(AdminVO vo) {
		return "admin/adminInsertForm";
	}

	//admin 등록DB처리
	@RequestMapping("adminInsert")
	public String adminInsert(AdminVO vo, Model model,String storeId) {
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
	
	  // 목록조회
	  @RequestMapping("adminList") 
	  public String adminList(Model model) {
	  model.addAttribute("adminList", adminService.getAdminList(null)); 
	  return "admin/adminInsert";
	  }
	  

	  
	// 수정폼

	// 수정처리

	// 삭제처리

}