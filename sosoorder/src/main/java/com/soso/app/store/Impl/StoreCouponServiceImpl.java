package com.soso.app.store.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soso.app.store.mapper.StoreCouponMapper;
import com.soso.app.store.service.StoreCouponService;
import com.soso.app.store.service.StoreCouponVO;

@Service
public class StoreCouponServiceImpl  implements StoreCouponService{

	@Autowired StoreCouponMapper storeCouponMapper;

	@Override
	public void storeCouponInsert(StoreCouponVO storeCouponVO) {
		storeCouponMapper.storeCouponInsert(storeCouponVO);
	}

	@Override
	public List<Map> storeCouponList(StoreCouponVO storeCouponVO) {
		return storeCouponMapper.storeCouponList(storeCouponVO);
	}
	
	@Override
	public void storeCouponDelete(StoreCouponVO storeCouponVO) {
		storeCouponMapper.storeCouponDelete(storeCouponVO);
	}

	@Override
	public StoreCouponVO storeCouponOne(StoreCouponVO storeCouponVO) {
		return storeCouponMapper.storeCouponOne(storeCouponVO);
	}

	@Override
	public void storeCouponUpdate(StoreCouponVO storeCouponVO) {
		storeCouponMapper.storeCouponUpdate(storeCouponVO);
		
	}
	
	
	

}
