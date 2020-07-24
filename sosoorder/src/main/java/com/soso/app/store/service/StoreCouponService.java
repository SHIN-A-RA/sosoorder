package com.soso.app.store.service;

import java.util.List;
import java.util.Map;

public interface StoreCouponService {
	public void storeCouponInsert(StoreCouponVO storeCouponVO);
	public List<Map> storeCouponList(StoreCouponVO storeCouponVO);
	public void storeCouponDelete(StoreCouponVO storeCouponVO);
}
