package com.soso.app.employees.mapper;

import java.util.List;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.soso.app.employees.service.EmployeesVO;



@ContextConfiguration(locations = "classpath:/config/*-context.xml")
public interface EmployeesMapper {

	public EmployeesVO getEmployees(EmployeesVO employeesVO);
	public void employeesInsert(EmployeesVO employeesVO);
	public List<EmployeesVO> getEmployeesList(EmployeesVO employeesVO);

	/* public String getName(Integer id); */
	
	/* public List<Map<String, Object>> getEmpMap(); */
}
