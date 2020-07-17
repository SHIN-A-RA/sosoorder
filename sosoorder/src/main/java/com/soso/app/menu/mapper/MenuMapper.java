package com.soso.app.menu.mapper;

import java.util.List;

import com.soso.app.menu.service.MenuVO;

public interface MenuMapper {
	public List<MenuVO> getMenuList(MenuVO menuVO);	
	public List<MenuVO> getMenuCategory(MenuVO menuVO);	
	
}
