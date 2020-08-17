package com.soso.app.openClose.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.soso.app.openClose.service.OpenCloseService;
import com.soso.app.openClose.service.OpenCloseVO;
import com.soso.app.admin.service.AdminVO;

/**
 * 
 * 이대연
 *
 * */
@Controller
public class OpenCloseController {
	@Autowired 
	OpenCloseService openCloseService;
	
	
	
	@RequestMapping("storeOpen")
	public String storeOpen(OpenCloseVO ocVO,Model model,AdminVO vo, HttpSession session) {
		/* ocVO.setStoreId(vo.getStoreId()); */
		ocVO.setStoreId((String)session.getAttribute("storeId"));
		System.out.println(ocVO.getStoreId());
		return "openClose/open";
	}
	
	@RequestMapping("openInfoInsert")
	public String storeOpenInfo(OpenCloseVO ocVO,AdminVO vo,HttpSession session) {
		ocVO.setStoreId((String)session.getAttribute("storeId"));
		openCloseService.openInfoInsert(ocVO);
		return "redirect:/homeSample";
	}
	
	
	@RequestMapping("storeClose")
	public String storeClose(OpenCloseVO ocVO,AdminVO vo,HttpSession session) {
		ocVO.setStoreId((String)session.getAttribute("storeId"));
		return "openClose/close";
	}
	
	
	@RequestMapping("storeDay")
	@ResponseBody
	public OpenCloseVO storeDay(OpenCloseVO ocVO,AdminVO vo,HttpSession session,Model model) {
		ocVO.setStoreId((String)session.getAttribute("storeId"));
		
		if(openCloseService.closeTotalSales(ocVO)==null) {
			ocVO.setCloseTotalSales("0");
		}else if(openCloseService.closeAccount(ocVO)==null) {
			ocVO.setCloseAccount("0");
		}else if(openCloseService.closeCard(ocVO)==null) {
			ocVO.setCloseCard("0");
		}else if(openCloseService.closeCash(ocVO) ==null) {
			ocVO.setCloseCash("0");
		}else if(openCloseService.VAT(ocVO) ==null) {
			ocVO.setVat("0");
		}else if(openCloseService.netSales(ocVO) ==null) {
			ocVO.setNetSales("0");
		}	
				
		ocVO.setCloseTotalSales(openCloseService.closeTotalSales(ocVO));
		ocVO.setCloseAccount(openCloseService.closeAccount(ocVO));
		ocVO.setCloseCard(openCloseService.closeCard(ocVO));
		ocVO.setCloseCash(openCloseService.closeCash(ocVO));
		ocVO.setVat(openCloseService.VAT(ocVO));
		ocVO.setNetSales(openCloseService.netSales(ocVO));
		
		
		return ocVO;
	}
	
	@RequestMapping("afterCash")
	@ResponseBody
	public OpenCloseVO afterCash(OpenCloseVO ocVO,AdminVO vo,HttpSession session,Model model) {
		ocVO.setStoreId((String)session.getAttribute("storeId"));
		ocVO.setAfterCash(openCloseService.afterCash(ocVO));
		return ocVO;
	}
		
	@RequestMapping("closeInfoUpdate")
	public String closeInfoUpdate(OpenCloseVO ocVO) {
		openCloseService.closeInfoUpdate(ocVO);
		return "redirect:/homeSample";
	}
	
	
	@RequestMapping("closeMenu")
	@ResponseBody
	public List<Map> closeMenu(OpenCloseVO ocVO,AdminVO vo,HttpSession session) {
		ocVO.setStoreId((String)session.getAttribute("storeId"));
	return openCloseService.closeMenu(ocVO);
	}
	

	
	
}
