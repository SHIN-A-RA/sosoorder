 package com.soso.app.admin.mapper;

import java.util.List;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.soso.app.admin.service.AdminVO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:/config/*-context.xml")
public interface AdminMapper {

	public AdminVO getAdmin(AdminVO adminVO);
	
	// 슈퍼 관리자만 사용 가능하도록 나중에 별도로 설정해야함
	 public List<AdminVO> getAdminList(AdminVO adminVO); 

	public void adminInsert(AdminVO adminVO);

	public int idCheck(String id);
}
