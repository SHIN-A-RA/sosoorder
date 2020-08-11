package com.soso.app.order.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soso.app.member.service.MemberVO;
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
	public List<Map<String, Object>> findCoupon(OrderCptVO orderCptVO) {
		return orderMapper.findCoupon(orderCptVO);
	}

	@Override
	public List<OrderCptVO> getSeat(OrderCptVO orderCptVO) {
		return orderMapper.getSeat(orderCptVO);
	}

	@Override
	public void payInsert(OrderCptVO orderCptVO) {
		orderMapper.payInsert(orderCptVO);
		
	}

	@Override
	public void paymentProc(HashMap<String, Object> map) {
		orderMapper.paymentProc(map);		
	}

	//회원적립금인서트
	@Override
	public void insertPo(OrderCptVO orderCptVO) {		
		orderMapper.insertPo(orderCptVO);		
	}

	@Override
	public List<Map<String, Object>> showPoint(OrderCptVO orderCptVO) {
		return orderMapper.showPoint(orderCptVO);
	}

	@Override
	public void insertMem(MemberVO memberVO, OrderCptVO orderCptVO) {
		orderMapper.insertMem(memberVO);
		orderMapper.insertMemProc(orderCptVO);
		
	}

	@Override
	public OrderCptVO receiptGet(OrderCptVO orderCptVO) {
		return orderMapper.receiptGet(orderCptVO);
	}

	@Override
	public List<OrderCptVO> getAddr(OrderCptVO orderCptVO) {
		return orderMapper.getAddr(orderCptVO);
	}


	
}
