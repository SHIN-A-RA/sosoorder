package com.soso.app.store.service;

import java.util.List;

public interface StorePopupService {
	public void storePopupInsert(StorePopupVO storePopupVO);
	public List<StorePopupVO> storePopupList(StorePopupVO storePopupVO);
	public StorePopupVO storePopupOne(StorePopupVO storePopupVO);
	public void storePopupUpdate(StorePopupVO storePopupVO);
	public void storePopupDelete(StorePopupVO storePopupVO);

}
