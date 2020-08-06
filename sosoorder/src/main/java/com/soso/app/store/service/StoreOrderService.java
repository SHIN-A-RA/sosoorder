package com.soso.app.store.service;

import java.util.List;
import java.util.Map;

public interface StoreOrderService {
	public List<Map<String, Object>> getOrderList(StoreOrderVO storeOrderVO);	
	public void orderUpdate1(StoreOrderVO storeOrderVO);
	public void orderUpdate2(StoreOrderVO storeOrderVO);
}
