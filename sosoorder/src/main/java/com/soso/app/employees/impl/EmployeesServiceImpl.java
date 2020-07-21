package com.soso.app.employees.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soso.app.employees.mapper.EmployeesMapper;
import com.soso.app.employees.service.EmployeesService;
import com.soso.app.employees.service.EmployeesVO;

@Service
public class EmployeesServiceImpl implements EmployeesService {

	@Autowired EmployeesMapper employeesMapper; 
	
	//employees 단건조회
	@Override
	public List<EmployeesVO> getEmployees(Object object) {
		return employeesMapper.getEmployees(object);
	}

	//employees 등록폼
	@Override
	public void employeesInsert(EmployeesVO employeesVO) {
		employeesMapper.employeesInsert(employeesVO);
		
	}
	
	//employees 전체조회
	@Override
	public List<EmployeesVO> getEmployeesList(EmployeesVO employeesVO) {
		return employeesMapper.getEmployeesList(employeesVO);
	}

}
