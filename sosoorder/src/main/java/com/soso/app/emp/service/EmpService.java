package com.soso.app.emp.service;

import java.util.List;

public interface EmpService {

	public List<EmpVO> getEmp(Object object);
	public void empInsert(EmpVO employeesVO);
	public List<EmpVO> getEmpList(String storeId);
	public void getEmpDelete(EmpVO empVO);
	public EmpVO getEmpNum(EmpVO empVO);
	public void setUpdateEmp(EmpVO empVO);
}
