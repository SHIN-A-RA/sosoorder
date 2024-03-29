package com.soso.app.admin.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
 */

@Controller // Bean �벑濡�, DispacherServlet�씠 �씤�떇�븷 �닔 �엳�뒗 Controller濡� 蹂��솚 => @Compnent
public class AdminController {

	@Autowired
	AdminService adminService;

	// admin로그인DB처리
	@RequestMapping("adminLogin")
	public String memberLogin(AdminVO vo, Model model, HttpSession session) {
		String path = null;
		AdminVO dbVO = adminService.getAdmin(vo);

		// && !vo.getPhone().equals(dbVO.getPhone())

		if (dbVO == null) {
			model.addAttribute("errorMsg", "관리자 아이디를 확인해주세요");
			path = "member/memberLoginForm";

		} else if (!vo.getStorePwd().equals(vo.getStorePwd()) ) {
			model.addAttribute("errorMsg", "관리자 패스워드를 확인해주세요.");
			path = "member/memberLoginForm";

		} else {
			session.setAttribute("storeId", vo.getStoreId());
			 model.addAttribute("loginMsg", "로그인 되었습니다."); 
			path = "redirect:/homeSample";
		}
		return path;
	}

	// admin 등록페이지 이동
	@RequestMapping("adminInsertForm")
	public String adminInsertForm(AdminVO vo) {
		return "admin/adminInsertForm";
	}

	// admin 등록DB처리
	@RequestMapping("adminInsert")
	public String adminInsert(AdminVO vo, Model model, String storeId) {
		adminService.adminInsert(vo);
		// 서비스 호출
		return "redirect:memberLoginForm";
	}

	// 아이디 중복 체크
	@GetMapping("idCheck")
	public @ResponseBody int idCheck(@RequestParam("storeId") String id) {
		int cnt = adminService.idCheck(id);
		return cnt;
	}

	// 목록조회
	@RequestMapping("adminList")
	public String adminList(Model model) {
		model.addAttribute("adminList", adminService.getAdminList(null));
		return "admin/adminInsert";
	}

	//모달컨텐츠
	@RequestMapping(value = "/adminNameSch", method = RequestMethod.GET)
	public String adminNameSch() {
		return "empty/admin/adminNameSch";
	}

	
	/* ================================================== 
	 * StoreSales(매출분석)
	 =================================================== */
	 
	@RequestMapping("storeSales")
	public String storeSales(Model model) {
		return "admin/storeSales";
	}

}