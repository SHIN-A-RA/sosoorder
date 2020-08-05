package com.soso.app.user.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soso.app.admin.service.AdminVO;
import com.soso.app.user.mapper.UserMapper;


@Controller
public class UserController {
	@Autowired
	private UserMapper userMapper;
	
	@RequestMapping("storeInfo")
	public void storeInfo(Model model, AdminVO adminVO, HttpSession session) {
		
		//세션 가져오기
		String storeId = (String)session.getAttribute("storeId");
		adminVO.setStoreId(storeId);
		model.addAttribute("storeInfo", userMapper.storeInfo(adminVO));
	
	}
	

}
