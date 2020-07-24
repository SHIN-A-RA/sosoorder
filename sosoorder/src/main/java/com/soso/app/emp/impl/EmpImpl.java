package com.soso.app.emp.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soso.app.emp.mapper.EmpMapper;
import com.soso.app.emp.service.EmpService;
import com.soso.app.emp.service.EmpVO;


@Service
public class EmpImpl implements EmpService {

	@Autowired 
	EmpMapper empMapper; 
	
	//employees 단건조회
	@Override
	public List<EmpVO> getEmp(Object object) {
		return empMapper.getEmp(object);
	}

	//employees 등록폼
	@Override
	public void empInsert(EmpVO vo) {
		empMapper.empInsert(vo);
		
	}
	
	//employees 전체조회
	@Override
	public List<EmpVO> getEmpList(String storeId) {
		return empMapper.getEmpList(storeId);
	}

	
	//employees 삭제
	@Override
	public void getEmpDelete(EmpVO empVO) {
		empMapper.getEmpDelete(empVO);
	}


	@Override
	public void setUpdateEmp(EmpVO empVO) {
		empMapper.setUpdateEmp(empVO);
	}

	@Override
	public void getEmpNum(EmpVO empVO) {
		empMapper.getEmpNum(empVO);
	}


}
