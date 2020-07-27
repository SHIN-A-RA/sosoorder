package com.soso.app.store.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soso.app.store.mapper.StorePopupMapper;
import com.soso.app.store.service.StorePopupService;
import com.soso.app.store.service.StorePopupVO;

@Service
public class StorePopupServiceImpl  implements StorePopupService{
	
	@Autowired
	StorePopupMapper storePopupMapper;
	
	@Override
	public void storePopupInsert(StorePopupVO storePopupVO) {
		storePopupMapper.storePopupInsert(storePopupVO);
	}

	@Override
	public List<StorePopupVO> storePopupList(StorePopupVO storePopupVO) {
		return storePopupMapper.storePopupList(storePopupVO);
	}

	@Override
	public StorePopupVO storePopupOne(StorePopupVO storePopupVO) {
		return storePopupMapper.storePopupOne(storePopupVO);
	}

	@Override
	public void storePopupUpdate(StorePopupVO storePopupVO) {
		storePopupMapper.storePopupUpdate(storePopupVO);
	}

	@Override
	public void storePopupDelete(StorePopupVO storePopupVO) {
		storePopupMapper.storePopupDelete(storePopupVO);
	}
	
	
	
	
	
	

}
