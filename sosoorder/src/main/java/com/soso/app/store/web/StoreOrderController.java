package com.soso.app.store.web;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.soso.app.common.FileRenamePolicy;
import com.soso.app.store.service.StoreCouponVO;
import com.soso.app.store.service.StorePopupService;
import com.soso.app.store.service.StorePopupVO;


@Controller
public class StoreOrderController {
	/*
	 * @Autowired StoreOrder storeOrderService;
	 */
	@RequestMapping("storeOrder")
	public String storePopupListForm(Model model) {
		return "store/storePopupList";
	}



}


