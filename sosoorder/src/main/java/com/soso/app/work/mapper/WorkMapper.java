package com.soso.app.work.mapper;

import java.util.List;
import java.util.Map;

import com.soso.app.work.service.SelDateVO;




public interface WorkMapper {

	public void workStart(String empNum);
	public void workEnd(String empNum);
	public List<Map<String, Object>> getWorkTimeData(String storeId);
	public List<Map<String, Object>> getEmpListTime(String storeId);
	public List<Map> empNum(SelDateVO vo);
	public List<Map> getEmpSalAjax(SelDateVO vo);
	
}
