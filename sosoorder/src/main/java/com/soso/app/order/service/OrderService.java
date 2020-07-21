package com.soso.app.order.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.soso.app.menu.service.MenuSearchVO;

public interface OrderService {
	

	//주문메뉴리스트
	public List<Map<String, Object>> getOrder(MenuSearchVO menuSearchVO);

}
