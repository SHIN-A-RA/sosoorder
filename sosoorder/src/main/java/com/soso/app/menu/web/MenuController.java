package com.soso.app.menu.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soso.app.menu.service.MenuService;
import com.soso.app.menu.service.MenuVO;

@Controller
public class MenuController {
	@Autowired
	MenuService menuService;
	
	//메뉴관리
	@RequestMapping("menuManager")
	public String menuManager(Model model, MenuVO menuVO) {
		model.addAttribute("menuManager", menuService.getMenuList(menuVO));
		return "menu/menuManager";
	}
	
	//메뉴 등록페이지 이동
	@RequestMapping("menuInserForm")
	public String menuInserForm() {
		return "menu/menuInserForm";
	}
	
	//메뉴 등록 처리하고 관리페이지로 이동
		@RequestMapping("menuInsert")
		public String menuInsert() {
			
			return "menu/menuManager";
		}

		
}
