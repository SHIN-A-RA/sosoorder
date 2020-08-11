package com.soso.app.common;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter {
	
	//컨트롤러 실행 직전에 동작.
	//반환 값이 true일 경우 정상적으로 진행, false일 경우 실행이 멈춤
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		return super.preHandle(request, response, handler);
	}
	//컨트롤러 진입 후 view가 랜더링 되기 전 수행.
	//modelAndView을 통해 화면 단에 들어가는 데이터 등의 조작이 가능.
	//메뉴체크
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		//스토어아이디
		HttpSession session = request.getSession();
		String storeId = (String)session.getAttribute("storeId");
		String phone = (String)session.getAttribute("phone");
		String requestURI = request.getRequestURI(); //페이지의 uri를 가져옴
		
		if(	requestURI.contains("store") || 
			requestURI.contains("emp") ||
			requestURI.contains("seatInsertForm") ||
			requestURI.contains("mailList")
			) { //해당 페이지에서
			if(storeId == null) {	//session에 storeId가 없을 경우
				 ModelAndView mav = new ModelAndView("redirect:/memberLoginForm"); //로그인페이지로 이동한다.
                 mav.addObject("msgCode", "관리자 로그인이 필요한 서비스입니다.");
                 mav.addObject("msgCheck", "true");
                 throw new ModelAndViewDefiningException(mav);
			}
		}else if(requestURI.contains("myPointsList") || 
			  	 requestURI.contains("myCouponList") ||
				 requestURI.contains("myOrderList")
				) {
			if(phone == null) {	//session에 storeId가 없을 경우
				ModelAndView mav = new ModelAndView("redirect:/memberLoginForm"); //로그인페이지로 이동한다.
				mav.addObject("msgCode", "회원 로그인이 필요한 서비스입니다.");
				mav.addObject("msgCheck", "true");
                throw new ModelAndViewDefiningException(mav);
			}
		}
		
	}
	
}