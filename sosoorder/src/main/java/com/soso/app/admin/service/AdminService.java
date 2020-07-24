package com.soso.app.admin.service;

import java.util.List;

public interface AdminService {
	public AdminVO getAdmin(AdminVO adminVO);
	public List<AdminVO> getAdminList(AdminVO adminVO);
	public void adminInsert(AdminVO adminVO);
	public int idCheck(String id);
	public String getMenuUpdate(AdminVO adminVO);
}
