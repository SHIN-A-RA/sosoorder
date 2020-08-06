package com.soso.app.storeorder.service;

import java.util.List;
import java.util.Map;

import com.soso.app.admin.service.AdminVO;

public interface ReorderService {


	public List<ReorderVO> getmailList(ReorderVO reorderVO);
	public List<Map> getEmail(AdminVO adminVO);
	public void mailInsert(ReorderVO reorderVO);
	public List<Map> getcountEmail(AdminVO adminVO);

	/* public String getName(Integer id); */
	/* public List<Map<String, Object>> getEmpMap(); */
}
