package com.soso.app.home.web;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String home(Model model, AdminVO adminVO) {
		model.addAttribute("storeIdList", homeService.getStoreIdList(adminVO));
		return "main";
	}
	//HttpSession session = request.getSession();
	//session.setAttribute("loginId", id);
	
	@RequestMapping("homeSample")
	public String homeSample(Model model, MenuVO menuVO, AdminVO adminVO, 
			HttpServletRequest request) {
		// 세션 선언
		HttpSession session = request.getSession();
		String storeId = request.getParameter("storeId");
		//세션 저장
		session.setAttribute("storeId", storeId);
		 
		adminVO.setStoreId(storeId);
		model.addAttribute("menuList", menuService.getMenuListHome(menuVO));
		model.addAttribute("menuCategory", homeService.getMenuCategory(adminVO));
		return "home";
	}

	
	


}
