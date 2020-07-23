package com.soso.app.order.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soso.app.menu.service.MenuSearchVO;
import com.soso.app.order.mapper.OrderMapper;
import com.soso.app.order.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService{
	
	@Autowired OrderMapper orderMapper;
	
	
	//주문메뉴리스트
	@Override
	public List<Map<String, Object>> getOrder(MenuSearchVO menuSearchVO) {
		return orderMapper.getOrder(menuSearchVO);
	}
	
	
	
	

	

}
