//package com.soso.app.common;
//
//import java.util.HashMap;
//import java.util.StringTokenizer;
//
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import org.springframework.web.servlet.ModelAndView;
//import org.springframework.web.servlet.ModelAndViewDefiningException;
//import org.springframework.web.servlet.mvc.WebContentInterceptor;
//
//public class AuthInterceptor extends WebContentInterceptor{
//
//	 /**
//     * 세션에 계정정보가 있는지 여부로 인증 여부를 체크한다. 계정정보가 없다면, 로그인 페이지로 이동한다.
//     */
//    @Override
//    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws ServletException {
//        
//    	//세션 가져오기
//    	HttpSession session = request.getSession();
//    	String storeId = (String)session.getAttribute("storeId");
//    	
//    	if(storeId != null) {
//    		return true;
//    	}else {
//    		ModelAndView mav = new ModelAndView("redirect:/forward.do");
//            mav.addObject("msgCode", "세션값만료.");
//            mav.addObject("returnUrl", "/index.do");
//            throw new ModelAndViewDefiningException(mav);
//    	}
//    	
//    }
//
//    /**
//     * 세션에 메뉴권한이 있는지 여부로 메뉴권한 여부를 체크한다. 계정정보가 없다면, 로그인 페이지로 이동한다.
//     */
//    @Override
//    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
//        String requestURI = request.getRequestURI();
//        
//        //세션 가져오기
//    	HttpSession session = request.getSession();
//    	String storeId = (String)session.getAttribute("storeId");
//        
//    	try {
//            if (requestURI.equals("스토어 아이디가 가야되는 페이지")) {
//
//                if (storeId == null) { // 세션이 있을 경우만 체크
//                        ModelAndView mav = new ModelAndView("redirect:/forward.do");
//                        mav.addObject("msgCode", "권한이 없습니다.");
//                        mav.addObject("returnUrl", "/index.do");
//                        throw new ModelAndViewDefiningException(mav);
//                    }
//            }
//}