package com.dbal.app.emp.mapper;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dbal.app.emp.EmpVO;

@Repository //bean등록, connection 설정 //@Component 상속
public class EmpDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public EmpVO getEmp(EmpVO empVO) {
		return mybatis.selectOne("com.dbal.app.emp.service.Impl.EmpDAO.getEmp", empVO);
	}
	
	public List<EmpVO> getEmpList(EmpVO empVO){
		return mybatis.selectList("com.dbal.app.emp.service.Impl.EmpDAO.getEmpList", empVO);
	}
	
	public void insertEmp(EmpVO empVO) {
		mybatis.insert("com.dbal.app.emp.service.Impl.EmpDAO.insertEmp", empVO);
	}
	
	//getCnt 메서드선언
	//getEmp 메서트 선언
}
