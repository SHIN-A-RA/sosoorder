package com.soso.app.order.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.test.context.ContextConfiguration;

import com.soso.app.menu.service.MenuSearchVO;
import com.soso.app.order.service.OrderCptVO;


@ContextConfiguration(locations = "classpath:/config/*-context.xml")
public interface OrderMapper {
	
	//주문메뉴리스트
	public List<Map<String, Object>> getOrder(MenuSearchVO menuSearchVO);	

}
