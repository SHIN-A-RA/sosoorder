package com.soso.app.home.service;

import java.util.List;

import com.soso.app.admin.service.AdminVO;

public interface HomeService {
	public AdminVO getMenuCategory(AdminVO adminVO);
	public List<AdminVO> getStoreIdList(AdminVO adminVO);

}
