 package com.soso.app.store.mapper;

import java.util.List;
import java.util.Map;

import com.soso.app.store.service.StoreCouponVO;

public interface StoreCouponMapper {
	public void storeCouponInsert(StoreCouponVO storeCouponVO);
	public List<Map> storeCouponList(StoreCouponVO storeCouponVO);
	public void storeCouponDelete(StoreCouponVO storeCouponVO);
}
