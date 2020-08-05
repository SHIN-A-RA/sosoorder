package com.soso.app.soso.service;
import java.util.List;
import com.soso.app.admin.service.AdminVO;
import com.soso.app.store.service.StoreCouponVO;

public interface SosoListService {
	
	public List<AdminVO> sosoList(AdminVO adminVO);
	public List<StoreCouponVO> sosoCoupon(AdminVO adminVO);
}
