package com.soso.app.admin.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soso.app.admin.mapper.AdminMapper;
import com.soso.app.admin.service.AdminService;
import com.soso.app.admin.service.AdminVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminMapper adminMapper;

	// admin단건조회
	@Override
	public AdminVO getAdmin(AdminVO adminVO) {
		return adminMapper.getAdmin(adminVO);
	}

	// admin전체조회 슈퍼 관리자 구현시 사용
	@Override
	public List<AdminVO> getAdminList(AdminVO adminVO) {
		return adminMapper.getAdminList(adminVO);
	}

	// admin등록폼
	@Override
	public void adminInsert(AdminVO adminVO) {
		adminMapper.adminInsert(adminVO);

	}

	@Override
	public int idCheck(String id) {
		int cnt=adminMapper.idCheck(id);
		return cnt;
	}

	@Override
	public String getMenuUpdate(AdminVO adminVO) {
	return adminMapper.getMenuUpdate(adminVO);
	}

}
