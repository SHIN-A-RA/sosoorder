package com.soso.app.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.soso.app.admin.service.AdminVO;
import com.soso.app.user.service.UserService;

public class MyInterceptor implements HandlerInterceptor{
	
	@Autowired
	private UserService userService;
	// controller로 보내기 전에 처리하는 인터셉터
	// 반환이 false라면 controller로 요청을 안함
	// 매개변수 Object는 핸들러 정보를 의미한다. ( RequestMapping , DefaultServletHandler ) 
	@Override
	public boolean preHandle(
			HttpServletRequest request, HttpServletResponse response, Object handler) 
			throws Exception {
		
		return true;
		}

	// controller의 handler가 끝나면 처리됨
	@Override
	public void postHandle(
			HttpServletRequest request, HttpServletResponse response,
			Object obj, ModelAndView mav)
			throws Exception {
		
		//세션 가져오기
		HttpSession session = request.getSession();
		String storeId = (String)session.getAttribute("storeInfo");
		AdminVO adminVO = new AdminVO();
		adminVO.setStoreId(storeId);
		AdminVO storeInfo = userService.storeInfo(adminVO);
		String storeName = storeInfo.getStoreName();
		String storeAddr = storeInfo.getStoreAddr();
		request.setAttribute("s_storeName", storeName);
		request.setAttribute("s_storeAddr", storeAddr);
				
	}

	// view까지 처리가 끝난 후에 처리됨
	@Override
	public void afterCompletion(
			HttpServletRequest request, HttpServletResponse response,
			Object obj, Exception e)
			throws Exception {
	}
}