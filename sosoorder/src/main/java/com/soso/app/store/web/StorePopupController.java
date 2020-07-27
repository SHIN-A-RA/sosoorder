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
public class StorePopupController {
	@Autowired
	StorePopupService storePopupService;
	
	@RequestMapping("storePopupListForm")
	public String storePopupListForm(Model model) {
		return "store/storePopupList";
	}
	
	@RequestMapping("storePopupList")
	@ResponseBody
	public List<StorePopupVO> storePopupList(Model model, StorePopupVO storePopupVO, HttpSession session) {
		String storeId = (String)session.getAttribute("storeId");
		storePopupVO.setStoreId(storeId);
		return storePopupService.storePopupList(storePopupVO);
	}
	
	@RequestMapping("storePopupInsertForm")
	public String storePopInsertForm(Model model) {
		return "store/storePopupInsert";
	}
	
	@RequestMapping("storePopupInsert")
	public String storePopInsert(Model model, HttpServletRequest request, StorePopupVO storePopupVO, HttpSession session) {
		// 업로드경로
		String path = request.getSession().getServletContext().getRealPath("resources/download");
		// 첨부파일 처리
		MultipartFile file = storePopupVO.getUploadFile();
		String filename = "";
		if (file != null && file.getSize() > 0) {
			filename = file.getOriginalFilename();
			File upFile = FileRenamePolicy.rename(new File(path, filename)); // 파일 이름이 rename되어 // 올라가도록
			filename = upFile.getName();
			try {
				file.transferTo(upFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		String storeId = (String)session.getAttribute("storeId");
		storePopupVO.setStoreId(storeId);
		storePopupVO.setPopImage(filename);
		
		if(storePopupVO.getPopCheck() == null || storePopupVO.getPopCheck() == "") {
			storePopupVO.setPopCheck("0");
		}
		
		if (storePopupVO.getPopNum() != null && !storePopupVO.getPopNum().isEmpty()) {
			if(storePopupVO.getPopImage() == null || storePopupVO.getPopImage() == "") {
				String updateFileName= request.getParameter("updateFile");
				storePopupVO.setPopImage(updateFileName);
				storePopupService.storePopupUpdate(storePopupVO);
			}else {
				storePopupService.storePopupUpdate(storePopupVO);
			}
		} else {
			storePopupService.storePopupInsert(storePopupVO);
		 } 
		
			return "redirect:storePopupListForm";
	}
	
	@RequestMapping("storePopupOne")
	public String storePopupOne(Model model, StorePopupVO storePopupVO) {
		model.addAttribute("popupOne", storePopupService.storePopupOne(storePopupVO));
		return "store/storePopupInsert";
	}

	
	@RequestMapping(value="/storePopupDelete/{popNum}", method=RequestMethod.DELETE)
	@ResponseBody
	public Map storePopupDelete(@PathVariable String popNum, StorePopupVO storePopupVO) {
		storePopupService.storePopupDelete(storePopupVO);
		Map result = new HashMap<String, Object>();
		result.put("result", Boolean.TRUE);
		return result;
	}


}


