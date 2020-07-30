package com.soso.app.work.service;

import java.util.List;
import java.util.Map;

public interface WorkService {

	
	
	public List<Map> getEmpSalAjax(SelDateVO vo);
	public List<Map> empNum(SelDateVO vo);
	public List<Map> totalSalAjax(SelDateVO vo);
	
	
	
	public void workStart(String empNum);
	public void workEnd(String empNum);
	public List<Map<String, Object>> getWorkTimeData(String storeId);
	public List<Map<String, Object>> getEmpListTime(String storeId);
}
