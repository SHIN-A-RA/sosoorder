package com.soso.app.openClose.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soso.app.openClose.mapper.OpenCloseMapper;
import com.soso.app.openClose.service.OpenCloseService;
import com.soso.app.openClose.service.OpenCloseVO;

@Service
public class OpenCloseImpl implements OpenCloseService{
	
	@Autowired OpenCloseMapper openCloseMapper;
	
	@Override
	public void openInfoInsert(OpenCloseVO openCloseVO) {
		openCloseMapper.openInfoInsert(openCloseVO);
		
	}

	@Override
	public List<Map> openTime(OpenCloseVO openCloseVO) {
		return 	openCloseMapper.openTime(openCloseVO);
	}

	
	/* 요소들 집어 넣기 */
	@Override
	public String closeAccount(OpenCloseVO openCloseVO) {
		return openCloseMapper.closeAccount(openCloseVO);
	}

	@Override
	public String closeCard(OpenCloseVO openCloseVO) {
		return openCloseMapper.closeCard(openCloseVO);
	}

	@Override
	public String closeCash(OpenCloseVO openCloseVO) {
		return openCloseMapper.closeCash(openCloseVO);
	}

	@Override
	public String VAT(OpenCloseVO openCloseVO) {
		return openCloseMapper.VAT(openCloseVO);
	}

	@Override
	public String netSales(OpenCloseVO openCloseVO) {
		return openCloseMapper.netSales(openCloseVO);
	}

	@Override
	public String closeTotalSales(OpenCloseVO openCloseVO) {
		return openCloseMapper.closeTotalSales(openCloseVO);
	}

	@Override
	public void closeInfoUpdate(OpenCloseVO openCloseVO) {
		openCloseMapper.closeInfoUpdate(openCloseVO);
	}

	@Override
	public List<Map> closeMenu(OpenCloseVO openCloseVO) {
		return openCloseMapper.closeMenu(openCloseVO);
	}

	@Override
	public String afterCash(OpenCloseVO openCloseVO) {
		return openCloseMapper.afterCash(openCloseVO);
	}


}
