package com.soso.app;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soso.app.menu.service.MenuService;
import com.soso.app.menu.service.MenuVO;


@Controller
public class HomeController {
	@Autowired
	MenuService menuService;
	
	@RequestMapping("/")
	public String home() {
		return "home";
	}
	
	@RequestMapping("homeSample/")
	public String homeSample(Model model, MenuVO menuVO) {
		model.addAttribute("menuList", menuService.getMenuList(menuVO));
		model.addAttribute("menuCategory", menuService.getMenuCategory(menuVO));
		return "home";
	}
	
	
	
	
	
}
