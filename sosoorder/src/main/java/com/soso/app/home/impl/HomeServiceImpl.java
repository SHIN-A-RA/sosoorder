package com.soso.app.home.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soso.app.admin.service.AdminVO;
import com.soso.app.home.mapper.HomeMapper;
import com.soso.app.home.service.HomeService;

@Service
public class HomeServiceImpl  implements HomeService{

	@Autowired HomeMapper homeMapper;
	
	@Override
	public AdminVO getMenuCategory(AdminVO adminVO) {
		return homeMapper.getMenuCategory(adminVO);
	}

	@Override
	public List<AdminVO> getStoreIdList(AdminVO adminVO) {
		return homeMapper.getStoreIdList(adminVO);
	}
	
	


}
