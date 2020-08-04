package com.soso.app.soso.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.soso.app.admin.service.AdminVO;
import com.soso.app.soso.mapper.SosoListMapper;
import com.soso.app.soso.service.SosoListService;
import com.soso.app.store.service.StoreCouponVO;

//by아라
@Service
public class SosoListServiceImpl implements SosoListService{

	@Autowired SosoListMapper sosoListMapper; 

	public List<AdminVO> sosoList(AdminVO adminVO) {
		return  sosoListMapper.sosoList(adminVO);
	}
	public List<StoreCouponVO> sosoCoupon(AdminVO adminVO) {
		return  sosoListMapper.sosoCoupon(adminVO);
	}
}	


