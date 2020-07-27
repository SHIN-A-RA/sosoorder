package com.soso.app.work.mapper;

import java.util.List;
import java.util.Map;

import com.soso.app.work.service.WorkVO;




public interface WorkMapper {

	public List<WorkVO> empNum(String StoreId);
	public void workStart(String empNum);
	public void workEnd(String empNum);
	public List<Map<String, Object>> getWorkTimeData(String storeId);
	public List<Map<String, Object>> getEmpListTime(String storeId);
	/* public String getName(Integer id); */
	
	/* public List<Map<String, Object>> getEmpMap(); */
}
