package com.dbal.app.emp.mapper;

import java.util.List;
import java.util.Map;

import com.dbal.app.emp.EmpVO;

public interface EmpMapper {
	public EmpVO getEmp(EmpVO empVO);	
	public List<EmpVO> getEmpList();	
	public void insertEmp(EmpVO empVO);
	public String getName(Integer id);
	public List<Map<String, Object>> getEmpMap();
}
