package com.soso.app.menu.service;

import java.util.List;

public interface MenuService {
	public List<MenuVO> getMenuListHome(MenuVO menuVO);
	public List<MenuVO> getMenuList(MenuVO menuVO);
	public List<MenuVO> getMenuCategory(MenuVO menuVO);	
	
}
