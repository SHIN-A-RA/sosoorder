 package com.soso.app.home.mapper;

import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.soso.app.admin.service.AdminVO;


@ContextConfiguration(locations = "classpath:/config/*-context.xml")
public interface HomeMapper {

	public AdminVO getMenuCategory(AdminVO adminVO);
	
}
