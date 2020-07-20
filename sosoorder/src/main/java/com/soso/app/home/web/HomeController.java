package com.soso.app.home.web;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soso.app.admin.service.AdminVO;
import com.soso.app.home.service.HomeService;
import com.soso.app.menu.service.MenuService;
import com.soso.app.menu.service.MenuVO;


@Controller
public class HomeController {
	@Autowired
	MenuService menuService;
	
	@Autowired
	HomeService homeService;
	
	@RequestMapping("/")
	public String home() {
		return "home";
	}

	
	@RequestMapping("homeSample/{storeId}")
	public String homeSample(Model model, MenuVO menuVO, AdminVO adminVO, @PathVariable String storeId) {
		model.addAttribute("menuList", menuService.getMenuListHome(menuVO));
		model.addAttribute("menuCategory", homeService.getMenuCategory(adminVO));
		return "home";
	}
	
	//세션에 저장
	@RequestMapping(value = "cart")
	public String cartInsert(){
		return "home";
	}
	
	
	


}
