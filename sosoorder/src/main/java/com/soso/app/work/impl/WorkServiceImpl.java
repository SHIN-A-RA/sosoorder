package com.soso.app.work.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soso.app.work.mapper.WorkMapper;
import com.soso.app.work.service.WorkService;
import com.soso.app.work.service.WorkVO;

@Service
public class WorkServiceImpl implements WorkService {

	@Autowired WorkMapper workMapper;

	@Override
	public String empNum(Object object) {
		return workMapper.empNum(object);
	}

	@Override
	public void workStart(WorkVO vo) {
		workMapper.workStart(vo);
	}

	@Override
	public void workEnd(WorkVO vo) {
		workMapper.workEnd(vo);
	}


	
}
