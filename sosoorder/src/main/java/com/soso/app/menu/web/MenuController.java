package com.soso.app.menu.web;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.soso.app.menu.common.FileRenamePolicy;
import com.soso.app.menu.service.MenuService;
import com.soso.app.menu.service.MenuVO;

@Controller
public class MenuController {
	@Autowired
	MenuService menuService;

	// 메뉴관리 페이지(리스트뿌림)
	@RequestMapping("storeMenuList")
	public String menuManager(Model model, MenuVO menuVO) {
		model.addAttribute("storeMenuList", menuService.getMenuList(menuVO));
		return "menu/storeMenuList";
	}

	// 메뉴 등록페이지 이동
	@RequestMapping("storeMenuInsert")
	public String storeMenuInsert(MenuVO vo, Model model) {
		if (vo.getMenuNum() != null && !vo.getMenuNum().isEmpty()) {
			model.addAttribute("oneMenu", menuService.getMenu(vo));
		}
		return "menu/storeMenuInsert";
	}

	// 메뉴 등록 처리하고 관리페이지로 이동
	@RequestMapping("menuInsert")
	public String menuInsert(@ModelAttribute("evo") MenuVO vo, // 1. 커맨트 객체
			Model model

	) throws IOException {

		// 첨부파일 처리
		MultipartFile file = vo.getUploadFile();
		String filename = "";
		if (file != null && file.getSize() > 0) {
			filename = file.getOriginalFilename();
			File upFile = FileRenamePolicy.rename(new File("/Users/mbp/Downloads/upload", filename)); // 파일 이름이 rename되어
																										// 올라가도록
			filename = upFile.getName();
			file.transferTo(upFile);
		}
		vo.setStoreId("test");
		vo.setProfile(filename);
		// 서비스호출
		if (vo.getMenuNum() != null && !vo.getMenuNum().isEmpty()) {
			menuService.menuUpdate(vo);
		} else {
			menuService.menuInsert(vo);
			System.out.println(vo.getMsg());
		}
		return "redirect:storeMenuList";

	}
}
