package com.soso.app.work.mapper;

import com.soso.app.work.service.WorkVO;




public interface WorkMapper {

	public String empNum(Object object);
	public void workStart(WorkVO vo);
	public void workEnd(WorkVO vo);
	
	/* public String getName(Integer id); */
	
	/* public List<Map<String, Object>> getEmpMap(); */
}
