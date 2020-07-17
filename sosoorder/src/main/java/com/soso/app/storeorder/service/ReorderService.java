package com.soso.app.storeorder.service;

import java.util.List;

import com.soso.app.storeorder.service.ReorderVO;

public interface ReorderService {


	public List<ReorderVO> getmailList(ReorderVO reorderVO);
	public void mailInsert(ReorderVO reorderVO);
	/* public String getName(Integer id); */
	/* public List<Map<String, Object>> getEmpMap(); */
}
