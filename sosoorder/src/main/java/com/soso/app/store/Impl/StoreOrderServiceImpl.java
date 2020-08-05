package com.soso.app.store.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soso.app.store.mapper.StoreOrderMapper;
import com.soso.app.store.service.StoreOrderService;
import com.soso.app.store.service.StoreOrderVO;

@Service
public class StoreOrderServiceImpl  implements StoreOrderService{

	@Autowired StoreOrderMapper storeOrderMapper;

	@Override
	public List<Map<String, Object>> getOrderList(StoreOrderVO storeOrderVO) {
		return storeOrderMapper.getOrderList(storeOrderVO);
	}

	
	

}
