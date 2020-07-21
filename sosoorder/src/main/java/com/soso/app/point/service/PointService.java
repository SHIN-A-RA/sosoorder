package com.soso.app.point.service;

import java.util.List;

import com.soso.app.menu.service.MenuSearchVO;

public interface PointService {
	
	//by혜원, 총적립금 확인
	public List<PointVO> getTotalPoint(MenuSearchVO menuSearchVO);	

}
