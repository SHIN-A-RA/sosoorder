package com.soso.app.home.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soso.app.admin.service.AdminVO;
import com.soso.app.home.mapper.HomeMapper;
import com.soso.app.home.service.HomeService;
import com.soso.app.menu.service.MenuVO;
import com.soso.app.order.service.OrderCptVO;
import com.soso.app.seat.service.SeatVO;

@Service
public class HomeServiceImpl  implements HomeService{

	@Autowired HomeMapper homeMapper;
	
	@Override
	public List<MenuVO> getMenuListHome(MenuVO menuVO) {
		return homeMapper.getMenuListHome(menuVO);
	}
	
	@Override
	public AdminVO getMenuCategory(AdminVO adminVO) {
		return homeMapper.getMenuCategory(adminVO);
	}

	@Override
	public List<AdminVO> getStoreIdList(AdminVO adminVO) {
		return homeMapper.getStoreIdList(adminVO);
	}

	@Override
	public void cartInert(List<OrderCptVO> list) {
		homeMapper.cartInert(list);		
	}

	@Override
	public OrderCptVO getOrderNum(OrderCptVO orderCptVO) {
		return homeMapper.getOrderNum(orderCptVO);
	}

	@Override
	public List<OrderCptVO> starListHome() {
		return homeMapper.starListHome();
	}

	@Override
	public List<SeatVO> seatListHome(SeatVO seatVO) {
		return homeMapper.seatListHome(seatVO);
	}
	
	
	
	

	
	
	
	


}
