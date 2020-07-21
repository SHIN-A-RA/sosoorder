package com.soso.app.point.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soso.app.menu.service.MenuSearchVO;
import com.soso.app.point.mapper.PointMapper;
import com.soso.app.point.service.PointService;
import com.soso.app.point.service.PointVO;

@Service
public class PointServiceImpl implements PointService{
	
	@Autowired PointMapper pointMapper;
	
	//by혜원, 총적립금
	@Override
	public List<MenuSearchVO> totalPoint(MenuSearchVO menuSearchVO) {
		return pointMapper.totalPoint(menuSearchVO);
	}
	
	
	
	

	

}
