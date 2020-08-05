package com.soso.app.soso.mapper;

import java.util.List;

import com.soso.app.admin.service.AdminVO;
import com.soso.app.store.service.StoreCouponVO;

//by아라
public interface SosoListMapper {

	public List<AdminVO> sosoList(AdminVO adminVO);
	public List<StoreCouponVO> sosoCoupon(AdminVO adminVO);
}
