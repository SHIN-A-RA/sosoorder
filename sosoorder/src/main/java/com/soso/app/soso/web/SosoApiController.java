package com.soso.app.soso.web;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.soso.app.admin.service.AdminVO;
import com.soso.app.mypage.service.UserCouponVO;
import com.soso.app.soso.service.SosoListService;
import com.soso.app.store.service.StoreCouponVO;


@Controller
public class SosoApiController {


	@Autowired
	SosoListService sosoListService;
		
	@RequestMapping("gps")
	   public String gps(HttpServletResponse reponse) {
		return "sosoList/gps";
	}
	
	@RequestMapping("gps2")
	@ResponseBody
	   public  List<StoreCouponVO> gps2(HttpServletResponse reponse,AdminVO adminVO, Model model) {
		return sosoListService.sosoCoupon(adminVO);
	}
	
	
	@RequestMapping(value="couponInsert", method=RequestMethod.POST, consumes="application/json")
	@ResponseBody
	public Map couponInsert(HttpServletResponse reponse, HttpSession session,@RequestBody UserCouponVO userCouponVO) {
		String phone = (String)session.getAttribute("phone");
		String serialNum = userCouponVO.getSerialNum();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("phone", phone);
		map.put("serialNum", serialNum);
		sosoListService.couponInsert(map);
		return map;
	}
	
}

