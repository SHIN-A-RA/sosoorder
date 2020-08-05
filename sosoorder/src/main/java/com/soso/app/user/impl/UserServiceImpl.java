package com.soso.app.user.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soso.app.admin.service.AdminVO;
import com.soso.app.user.mapper.UserMapper;
import com.soso.app.user.service.UserService;

@Service
public class UserServiceImpl implements UserService{

	
	@Autowired UserMapper userMapper;

	@Override
	public AdminVO storeInfo(AdminVO adminVO) {
		return userMapper.storeInfo(adminVO);
	} 


	
}

