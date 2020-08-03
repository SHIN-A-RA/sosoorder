package com.soso.app.store.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soso.app.store.mapper.StoreOrderMapper;
import com.soso.app.store.service.StoreOrderService;

@Service
public class StoreOrderServiceImpl  implements StoreOrderService{

	@Autowired StoreOrderMapper storeOrderMapper;

	
	

}
