 package com.soso.app.home.mapper;


import java.util.List;

import com.soso.app.admin.service.AdminVO;

public interface HomeMapper {

	public AdminVO getMenuCategory(AdminVO adminVO);
	public List<AdminVO> getStoreIdList(AdminVO adminVO);
	
}
