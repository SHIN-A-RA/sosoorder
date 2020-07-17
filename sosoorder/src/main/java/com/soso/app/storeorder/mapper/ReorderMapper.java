package com.soso.app.storeorder.mapper;

import java.util.List;



import com.soso.app.storeorder.service.ReorderVO;

public interface ReorderMapper {
	public List<ReorderVO> getmailList(ReorderVO reorderVO);	
	public void mailInsert(ReorderVO reorderVO);
}
