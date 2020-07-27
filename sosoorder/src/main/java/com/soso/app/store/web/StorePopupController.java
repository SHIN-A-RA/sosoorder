package com.soso.app.store.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soso.app.store.service.StorePopupService;


@Controller
public class StorePopupController {
	@Autowired
	StorePopupService storePopUpService;
	
	@RequestMapping("storePopList")
	public String storePopList(Model model) {
		return "store/storePopupList";
	}
	
	@RequestMapping("storePopInsertForm")
	public String storePopInsertForm(Model model) {
		return "store/storePopupInsert";
	}
	
	@RequestMapping("storePopInsert")
	public String storePopInsert(Model model) {
		return "store/storePopupList";
	}


}
