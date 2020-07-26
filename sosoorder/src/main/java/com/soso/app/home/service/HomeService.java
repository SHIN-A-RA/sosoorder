package com.soso.app.home.service;

import java.util.List;

import com.soso.app.admin.service.AdminVO;
import com.soso.app.menu.service.MenuVO;
import com.soso.app.order.service.OrderCptVO;

public interface HomeService {
	public List<MenuVO> getMenuListHome(MenuVO menuVO);
	public AdminVO getMenuCategory(AdminVO adminVO);
	public List<AdminVO> getStoreIdList(AdminVO adminVO);
	public void cartInert(List<OrderCptVO> list);
	public OrderCptVO getOrderNum(OrderCptVO orderCptVO);
	

}
