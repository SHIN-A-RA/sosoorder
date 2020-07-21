package com.soso.app.storeorder.mapper;

import java.util.List;
import java.util.Map;

import com.soso.app.admin.service.AdminVO;
import com.soso.app.storeorder.service.ReorderVO;

public interface ReorderMapper {
	public List<ReorderVO> getmailList(ReorderVO reorderVO);	
	public List<Map> getEmail(AdminVO adminVO);

	public void mailInsert(ReorderVO reorderVO);
}
