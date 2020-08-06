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
	
	
	@RequestMapping("sosoList1")
	   public String callapihttp(HttpServletResponse reponse) {
	      StringBuffer result = new StringBuffer();
	      try { 
	         String urlstr = "http://apis.data.go.kr/B553077/api/open/sdsc/storeListInRadius?radius=500&cx=35.8704736&cy=128.5896283&ServiceKey=VwbBoXQgv%2B5U%2FxwjpiRV7TkZgK461se9253O5m%2Fg7s%2F7eVxbqfJZg5ECYk4g4XvqmPoXeYemAPFzG7Ndk9uetw%3D%3D";
	      URL url = new URL(urlstr);
	      HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
	      urlconnection.setRequestMethod("GET");
	      BufferedReader br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8"));
	      String returnLine;
	      result.append("<xmp>");
	      while((returnLine = br.readLine()) != null) {
	         result.append(returnLine + "\n");
	      }
	      urlconnection.disconnect();
	      System.out.println(result);
	      }catch(Exception e) {
	         e.printStackTrace();
	      }
	      return result+"</xmp>";
	   }
	
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

