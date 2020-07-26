package com.soso.app.menu.service;

import java.util.List;
import java.util.Map;

public interface MenuService {
	public List<MenuVO> getMenuList(MenuVO menuVO);
	public Map getMenu(MenuVO menuVO);
	public List<MenuVO> getMenuCategory(MenuVO menuVO);
	public void menuInsert(MenuVO menuVO);	
	public void menuUpdate(MenuVO menuVO);
	public void menuDelete(MenuVO menuVO);
}
