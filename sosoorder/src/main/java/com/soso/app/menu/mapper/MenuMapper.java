package com.soso.app.menu.mapper;

import java.util.List;
import java.util.Map;

import com.soso.app.menu.service.MenuVO;

public interface MenuMapper {
	public Map getMenu(MenuVO menuVO);
	public List<MenuVO> getMenuList(MenuVO menuVO);	
	public List<MenuVO> getMenuCategory(MenuVO menuVO);
	public void menuInsert(MenuVO menuVO);
	public void menuUpdate(MenuVO menuVO);
	public void menuDelete(MenuVO menuVO);
	
}
