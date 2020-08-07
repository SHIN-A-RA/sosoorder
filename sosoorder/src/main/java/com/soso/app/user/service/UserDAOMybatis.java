package com.soso.app.user.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOMybatis {

	@Autowired
	SqlSessionTemplate mybatis;

	// 단건조회
	public UserVO getUser(UserVO vo) {
		return mybatis.selectOne("UserDAO.getUser", vo);
	}

	// 등록
	public List<Map> getRole(UserVO vo) {
		return mybatis.selectList("UserDAO.getRole", vo);
	}
}