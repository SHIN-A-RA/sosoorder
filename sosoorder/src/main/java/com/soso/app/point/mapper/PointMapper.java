package com.soso.app.point.mapper;

import java.util.List;

import org.springframework.test.context.ContextConfiguration;

import com.soso.app.menu.service.MenuSearchVO;
import com.soso.app.point.service.PointVO;


@ContextConfiguration(locations = "classpath:/config/*-context.xml")
public interface PointMapper {
	
	//by혜원, 총적립금 확인
	public List<PointVO> getTotalPoint(MenuSearchVO menuSearchVO);	

}
