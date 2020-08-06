package com.soso.app.work.web;

import java.util.List;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.soso.app.work.service.SelDateVO;
import com.soso.app.work.service.WorkService;
import com.soso.app.work.service.WorkVO;

/**
 * 
 * 
 * 이대연
 * 
 * 
 *
 * */

@Controller
public class WorkController {

	@Autowired
	WorkService workService;
	
	//직원 조회(cmpNum)
	@RequestMapping("empNum")
	public String empNum(WorkVO vo,Model model) {
		return "";
	}
	
	//직원 조회(getEmpAjax)
	@RequestMapping("getEmpAjax")
	@ResponseBody
	public List<Map> getEmpAjax(HttpSession session,SelDateVO seldateVO) {
		//클릭시 데이트와 스토어아이디를 가져옴
		seldateVO.setStoreId((String) session.getAttribute("storeId"));
		return workService.empNum(seldateVO);
	}
	
	//직원 조회("getEmpSalAjax")
	@RequestMapping("getEmpSalAjax")
	@ResponseBody
	public List<Map> getEmpSalAjax(HttpSession session,SelDateVO seldateVO) {
		seldateVO.setStoreId((String) session.getAttribute("storeId"));
		return workService.getEmpSalAjax(seldateVO);
	}
	
	
	
	
	//총 급여 조회("getEmpSalAjax")
	@RequestMapping("totalSalAjax")
	@ResponseBody
	public List<Map> totalSalAjax(HttpSession session,SelDateVO seldateVO) {
		seldateVO.setStoreId((String) session.getAttribute("storeId"));
		return workService.totalSalAjax(seldateVO);
	}
	
	
	
	//업무 시작(workStart)
	@RequestMapping("workStart")
	@ResponseBody
	public void workStart(String empNum) {
		workService.workStart(empNum);
		
	}
	//업무 끝(workEnd)
	@RequestMapping("workEnd")
	@ResponseBody
	public void workEnd(String empNum) {
		workService.workEnd(empNum);
	}
	
	//캘린더 데이터
	@RequestMapping("workTimeData")
	public @ResponseBody List<Map<String,Object>> workTimeData(HttpSession session){
		String storeId = (String) session.getAttribute("storeId");
		return workService.getWorkTimeData(storeId);
	}
	
	//리로드 테이블
	@RequestMapping("reloadTable")
	public String reloadTable(Model model,HttpSession session){
		String storeId = (String) session.getAttribute("storeId");
		model.addAttribute("getEmpListTime", workService.getEmpListTime(storeId));
		return "noLayout/emp/reloadTable";
	}
		
	
	
	
}//end of controller
	
