package com.soso.app.work.service;

import java.util.List;
import java.util.Map;

public interface WorkService {


	public List<WorkVO> empNum(String StoreId);
	public void workStart(String empNum);
	public void workEnd(String empNum);
	public List<Map<String, Object>> getWorkTimeData(String storeId);
	/* public String getName(Integer id); */
	
	/* public List<Map<String, Object>> getEmpMap(); */
}
