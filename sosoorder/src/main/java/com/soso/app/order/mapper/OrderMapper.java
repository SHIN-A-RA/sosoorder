package com.soso.app.order.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.test.context.ContextConfiguration;

import com.soso.app.order.service.OrderCptVO;



@ContextConfiguration(locations = "classpath:/config/*-context.xml")
public interface OrderMapper {
	
	//주문메뉴리스트
	public List<Map<String, Object>> getOrder(OrderCptVO orderCptVO);	
	
	//by혜원, 총적립금 확인
	public List<OrderCptVO> getTotalPoint(OrderCptVO orderCptVO);	
	
	//by혜원, 쿠폰조회
	public List<OrderCptVO> findCoupon(OrderCptVO orderCptVO);
	
	

}
