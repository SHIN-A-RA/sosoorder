package com.soso.app.home.web;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.soso.app.admin.service.AdminVO;
import com.soso.app.home.service.HomeService;
import com.soso.app.menu.service.MenuService;
import com.soso.app.menu.service.MenuVO;
import com.soso.app.order.service.OrderCptVO;


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
	
	@RequestMapping("homeSample/{storeId}")
	public String homeSample(Model model, MenuVO menuVO, AdminVO adminVO, OrderCptVO orderCptVO,
			HttpSession session, @PathVariable String storeId) {
		//세션 저장
		session.setAttribute("storeId", storeId);
		
		//세션 가져오기
		//(String)session.getAttribute("storeId")
		
		//adminVO.setStoreId(storeId);
		//menuVO.setStoreId(storeId);
		model.addAttribute("menuList", homeService.getMenuListHome(menuVO));
		model.addAttribute("menuCategory", homeService.getMenuCategory(adminVO));
		model.addAttribute("menuOrderNum", homeService.getOrderNum(orderCptVO));
		return "home";
	}
	
	@RequestMapping("homeSample")
	public String home(Model model, MenuVO menuVO, AdminVO adminVO, OrderCptVO orderCptVO,
			HttpSession session) {
		
		//세션 가져오기
		String storeId = (String)session.getAttribute("storeId");
		
		adminVO.setStoreId(storeId);
		menuVO.setStoreId(storeId);
		model.addAttribute("menuList", homeService.getMenuListHome(menuVO));
		model.addAttribute("menuCategory", homeService.getMenuCategory(adminVO));
		model.addAttribute("menuOrderNum", homeService.getOrderNum(orderCptVO));
		return "home";
	}
	
	@RequestMapping(value="cartList", method=RequestMethod.POST, 
		   headers = {"Content-type=application/json"})
    @ResponseBody
    public String cartInert(@RequestBody List<OrderCptVO> ocVO, Model model) {
		homeService.cartInert(ocVO);
		return "order/orderInsert";
    }

	


}
