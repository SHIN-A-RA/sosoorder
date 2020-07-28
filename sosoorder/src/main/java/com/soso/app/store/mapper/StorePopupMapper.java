 package com.soso.app.store.mapper;

import java.util.List;

import com.soso.app.store.service.StorePopupVO;

public interface StorePopupMapper {
	public void storePopupInsert(StorePopupVO storePopupVO);
	public List<StorePopupVO> storePopupList(StorePopupVO storePopupVO);
	public StorePopupVO storePopupOne(StorePopupVO storePopupVO);
	public void storePopupUpdate(StorePopupVO storePopupVO);
	public void storePopupDelete(StorePopupVO storePopupVO);
	public void storePopupListPro(StorePopupVO storePopupVO);
}
