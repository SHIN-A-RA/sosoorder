package com.soso.app.member.mapper;

import java.util.List;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.soso.app.member.service.MemberVO;



public interface MemberMapper {

	public MemberVO getMember(MemberVO memberVO);
	
	public List<MemberVO> getMemberList(MemberVO memberVO);

	public void memberInsert(MemberVO memberVO);

	/* public String getName(Integer id); */
	
	/* public List<Map<String, Object>> getEmpMap(); */
}
