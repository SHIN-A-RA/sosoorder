package com.soso.app.order.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soso.app.order.mapper.CallMapper;
import com.soso.app.order.service.CallService;
import com.soso.app.order.service.CallVO;


@Service
public class CallServiceImpl implements CallService{
	
	@Autowired CallMapper callMapper;

	@Override
	public void callInsert(CallVO callVO) {
		callMapper.callInsert(callVO);
	}

}
