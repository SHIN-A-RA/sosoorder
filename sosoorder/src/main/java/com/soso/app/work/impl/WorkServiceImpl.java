package com.soso.app.work.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soso.app.work.mapper.WorkMapper;
import com.soso.app.work.service.WorkService;
import com.soso.app.work.service.WorkVO;

@Service
public class WorkServiceImpl implements WorkService {

	@Autowired WorkMapper workMapper;
	
	@Override
	public List<WorkVO> empNum(String StoreId){
		return workMapper.empNum(StoreId);
	}

	@Override
	public void workStart(String empNum) {
		workMapper.workStart(empNum);
	}

	@Override
	public void workEnd(String empNum) {
		workMapper.workEnd(empNum);
	}

	@Override
	public List<Map<String, Object>> getWorkTimeData(String storeId) {
		return workMapper.getWorkTimeData(storeId);
	}


	
}
