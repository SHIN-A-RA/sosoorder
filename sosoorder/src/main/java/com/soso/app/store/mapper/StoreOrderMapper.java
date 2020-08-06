 package com.soso.app.store.mapper;

import java.util.List;
import java.util.Map;

import com.soso.app.store.service.StoreOrderVO;

public interface StoreOrderMapper {
	public List<Map<String, Object>> getOrderList(StoreOrderVO storeOrderVO);
	public void orderUpdate1(StoreOrderVO storeOrderVO);
	public void orderUpdate2(StoreOrderVO storeOrderVO);
}
