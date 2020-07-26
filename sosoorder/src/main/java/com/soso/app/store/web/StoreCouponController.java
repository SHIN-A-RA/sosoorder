package com.soso.app.store.web;



import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.soso.app.store.service.StoreCouponService;
import com.soso.app.store.service.StoreCouponVO;


@Controller
public class StoreCouponController {
	@Autowired
	StoreCouponService storeCouponService;
	
	@RequestMapping("storeCouponList")
	@ResponseBody
	public List<Map> storeCouponList(Model model, StoreCouponVO storeCouponVO, HttpSession session) {
		String storeId = (String)session.getAttribute("storeId");
		storeCouponVO.setStoreId(storeId);
		return storeCouponService.storeCouponList(storeCouponVO);
	}
	
	
	@RequestMapping("storeCouponListForm")
	public String storeCouponListForm(Model model, StoreCouponVO storeCouponVO, HttpSession session) {
		return "store/storeCouponList";
	}
	
	@RequestMapping("storeCouponInsert")
	@ResponseBody
	public void storeCouponInsert(Model model, StoreCouponVO storeCouponVO, HttpServletRequest request ,HttpSession session) {
		String storeId = (String)session.getAttribute("storeId");
		storeCouponVO.setStoreId(storeId);
		//쿠폰 시리얼번호
		  final char[] possibleCharacters =
		    {'1','2','3','4','5','6','7','8','9','0','A','B','C','D','E','F',
		     'G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V',
		     'W','X','Y','Z'};
		  
		  final int possibleCharacterCount = possibleCharacters.length;
		  Random rnd = new Random();
		  int i = 0;
		   StringBuffer buf = new StringBuffer(16);
		   //i는 8자리의 랜덤값을 의미
		   for (i= 8; i > 0; i--) {
		    buf.append(possibleCharacters[rnd.nextInt(possibleCharacterCount)]);
		   }
		   String couponnum = buf.toString();
		   System.out.println("couponnum==>"+couponnum);   
		//
	   storeCouponVO.setSerialNum(couponnum);
	   storeCouponService.storeCouponInsert(storeCouponVO);

	}
	
	@RequestMapping(value="/storeCouponDelete/{serialNum}", method=RequestMethod.DELETE)
	@ResponseBody
	public Map storeCouponDelete(@PathVariable String serialNum, StoreCouponVO storeCouponVO) {
		storeCouponService.storeCouponDelete(storeCouponVO);
		Map result = new HashMap<String, Object>();
		result.put("result", Boolean.TRUE);
		return result;
	}
	
	@RequestMapping(value="storeCouponOne", method=RequestMethod.GET)
	@ResponseBody
	public StoreCouponVO storeCouponOne(StoreCouponVO storeCouponVO) {
		return storeCouponService.storeCouponOne(storeCouponVO);
	}
	
	@RequestMapping(value="storeCouponUpdate", method=RequestMethod.POST)
	@ResponseBody
	public void storeCouponUpdate(StoreCouponVO storeCouponVO) {
		storeCouponService.storeCouponUpdate(storeCouponVO);
	}
	
	

}
