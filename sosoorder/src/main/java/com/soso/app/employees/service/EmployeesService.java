package com.soso.app.employees.service;

import java.util.List;

public interface EmployeesService {


	public EmployeesVO getEmployees(EmployeesVO employeesVO);
	public void employeesInsert(EmployeesVO employeesVO);
	public List<EmployeesVO> getEmployeesList(EmployeesVO employeesVO);

	/* public String getName(Integer id); */
	
	/* public List<Map<String, Object>> getEmpMap(); */
}
