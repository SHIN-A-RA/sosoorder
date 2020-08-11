package com.soso.app.menu.web;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.soso.app.admin.service.AdminService;
import com.soso.app.admin.service.AdminVO;
import com.soso.app.home.service.HomeService;
import com.soso.app.menu.common.FileRenamePolicy;
import com.soso.app.menu.service.MenuService;
import com.soso.app.menu.service.MenuVO;

@Controller
public class MenuController {
	@Autowired
	MenuService menuService;
	
	@Autowired
	HomeService homeService;
	
	@Autowired
	AdminService adminService;

	// 메뉴관리 페이지(리스트에뿌림)
	@RequestMapping("storeMenuList")
	public String menuManager(Model model, MenuVO menuVO, AdminVO adminVO, HttpSession session) {
		String storeId = (String) session.getAttribute("storeId");
		 
		adminVO.setStoreId(storeId);
		menuVO.setStoreId(storeId);
		
		model.addAttribute("storeMenuList", menuService.getMenuList(menuVO));
		model.addAttribute("menuCategory", homeService.getMenuCategory(adminVO));
		return "menu/storeMenuList";
	}

	// 메뉴 등록페이지 이동(해당 메뉴탭을 누르면 해당메뉴 값을 가지고 수정페이지로 이동)
	@RequestMapping("storeMenuInsert")//insertForm
	public String storeMenuInsert(MenuVO vo, Model model, AdminVO adminVO,HttpSession session) {
		if (vo.getMenuNum() != null && !vo.getMenuNum().isEmpty()) {
			model.addAttribute("oneMenu", menuService.getMenu(vo));// oneMenu=단건조회
		}
		String storeId = (String) session.getAttribute("storeId");
		adminVO.setStoreId(storeId);
		model.addAttribute("storeMenu", adminService.getAdmin(adminVO));//스토어메뉴 단건조회
		return "menu/storeMenuInsert";
	}
	
	
	@RequestMapping(value = "storeMenuUpdate", method=RequestMethod.POST, consumes="application/json")
	@ResponseBody
	public void storeMenuUpdate(@RequestBody AdminVO adminVO, HttpSession session) {
		String storeId = (String) session.getAttribute("storeId");
		adminVO.setStoreId(storeId);
		adminService.getMenuUpdate(adminVO);
	}

	// 메뉴 등록 처리하고 관리페이지로 이동(수정부분도 여기있음)
	@RequestMapping("menuInsert")
	public String menuInsert(@ModelAttribute("evo") MenuVO vo, // 1. 커맨트 객체
			Model model, HttpServletRequest request

	) {
		// 업로드경로
		String path = request.getSession().getServletContext().getRealPath("resources/download");
		// 첨부파일 처리
		MultipartFile file = vo.getUploadFile();
		String filename = "";
		if (file != null && file.getSize() > 0) {
			filename = file.getOriginalFilename();
			File upFile = FileRenamePolicy.rename(new File(path, filename)); // 파일 이름이 rename되어 // 올라가도록
			filename = upFile.getName();
			try {
				file.transferTo(upFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		vo.setStoreId("test");
		vo.setMenuImage(filename);
		// 서비스호출
		if (vo.getMenuNum() != null && !vo.getMenuNum().isEmpty()) {
			if(vo.getMenuImage() == null || vo.getMenuImage() == "") {
				String updateFileName= request.getParameter("updateFile");
				vo.setMenuImage(updateFileName);
				menuService.menuUpdate(vo);
			}else {
				menuService.menuUpdate(vo);//메뉴번호가 있으면 수정, 없으면 등록
			}
		} else {
			menuService.menuInsert(vo);
		}
		return "redirect:storeMenuList";

	}

	// 메뉴삭제
	@RequestMapping("menuDelete")
	public String menuDelete(MenuVO menuVO) {
		menuService.menuDelete(menuVO);
		return "redirect:storeMenuList";
	}

}
