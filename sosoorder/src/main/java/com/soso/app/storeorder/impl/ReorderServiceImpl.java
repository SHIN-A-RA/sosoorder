package com.soso.app.storeorder.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.soso.app.storeorder.mapper.ReorderMapper;
import com.soso.app.storeorder.service.ReorderService;
import com.soso.app.storeorder.service.ReorderVO;

@Service
public class ReorderServiceImpl implements ReorderService{

	@Autowired ReorderMapper reorderMapper; 



	@Override
	public List<ReorderVO> getmailList(ReorderVO reorderVO) {
		return  reorderMapper.getmailList(reorderVO);
	}
	@Override
	public void mailInsert(ReorderVO reorderVO) {
		reorderMapper.mailInsert(reorderVO);
	}
}

