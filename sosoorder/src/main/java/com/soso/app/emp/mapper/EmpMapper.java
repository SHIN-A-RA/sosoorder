package com.soso.app.emp.mapper;

import java.util.List;

import com.soso.app.emp.service.EmpVO;


public interface EmpMapper {

	public List<EmpVO> getEmp(Object object);
	public void empInsert(EmpVO employeesVO);
	public List<EmpVO> getEmpList(String storeId);
	public void getEmpDelete(EmpVO empVO);
	public void getEmpNum(EmpVO empVO);
	public void setUpdateEmp(EmpVO empVO);
	
}
