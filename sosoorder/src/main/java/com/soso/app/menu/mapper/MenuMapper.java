package com.soso.app.menu.mapper;

import java.util.List;

import com.soso.app.menu.service.MenuVO;

public interface MenuMapper {
	public List<MenuVO> getMenuListHome(MenuVO menuVO);
	public MenuVO getMenu(MenuVO menuVO);
	public List<MenuVO> getMenuList(MenuVO menuVO);	
	public List<MenuVO> getMenuCategory(MenuVO menuVO);
	public void menuInsert(MenuVO menuVO);
	public void menuUpdate(MenuVO menuVO);
	
}
