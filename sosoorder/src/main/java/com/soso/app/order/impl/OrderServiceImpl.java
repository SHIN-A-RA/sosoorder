package com.soso.app.order.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soso.app.order.mapper.OrderMapper;
import com.soso.app.order.service.OrderCptVO;
import com.soso.app.order.service.OrderService;


@Service
public class OrderServiceImpl implements OrderService{
	
	@Autowired OrderMapper orderMapper;
	
	
	//주문메뉴리스트
	@Override
	public List<Map<String, Object>> getOrder(OrderCptVO orderCptVO) {
		return orderMapper.getOrder(orderCptVO);
	}

	//총적립금조회
	@Override
	public List<OrderCptVO> getTotalPoint(OrderCptVO orderCptVO) {
		return orderMapper.getTotalPoint(orderCptVO);
	}

	@Override
	public List<OrderCptVO> findCoupon(OrderCptVO orderCptVO) {
		return orderMapper.findCoupon(orderCptVO);
	}
	
	
	
	

	

}
