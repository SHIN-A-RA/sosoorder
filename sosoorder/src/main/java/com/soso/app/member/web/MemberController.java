package com.soso.app.member.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;
import com.soso.app.admin.service.AdminVO;
import com.soso.app.member.service.MemberService;
import com.soso.app.member.service.MemberVO;

/**
 * 이대연
 *
 * */

@Controller // Bean �벑濡�, DispacherServlet�씠 �씤�떇�븷 �닔 �엳�뒗 Controller濡� 蹂��솚 => @Compnent
public class MemberController {

	@Autowired
	MemberService memberService;
    
	@Autowired
	KakaoController kakaoController;
	
	//member로그인 페이지 이동
	@RequestMapping("memberLoginForm")
	public String memberLoginForm(MemberVO vo, Model model,HttpSession session,HttpServletRequest request, HttpServletResponse response) {
		String kakaoUrl = kakaoController.getAuthorizationUrl(session);
		  model.addAttribute("kakao_url", kakaoUrl);
		  
		return "member/memberLoginForm";
	}
	
	
	//member로그인DB처리
	@RequestMapping("memberLogin")
	public String memberLogin(MemberVO vo, Model model,HttpSession session,HttpServletRequest request, HttpServletResponse response) {
		String path = null;
		MemberVO dbVO = memberService.getMember(vo);
		if (dbVO == null ) {
	         model.addAttribute("errorMsg", "아아디가 잘못되었습니다.");
	          path = "member/memberLoginForm";
	         
	      } else if (!vo.getPwd().equals(dbVO.getPwd())) {
	    	  model.addAttribute("errorMsg", "패스워드가 잘못되었습니다.");
	    	  path = "member/memberLoginForm";

	      } else {
	         session.setAttribute("phone", vo.getPhone());
				 model.addAttribute("loginMsg", "로그인 되었습니다."); 
	         path = "redirect:/homeSample";
	      }
		return path;
	}
	
	
	//member가입 페이지 이동
	@RequestMapping("memberInsertForm")
	public String memberInsertForm(MemberVO vo) {
		return "member/memberInsertForm";
	}
	
	//member가입 DB처리
	@RequestMapping("memberInsert")
	public String memberInsert(MemberVO vo, Model model) {
		memberService.memberInsert(vo);
		//서비스 호출
		
		return "member/memberLoginForm";
		
	}

	
	 	
	//가입시 휴대폰번호 중복 체크 
	@GetMapping("phoneCheck")
	public @ResponseBody int phoneCheck(@RequestParam("phone")String phone) {
		int cnt=memberService.phoneCheck(phone);
		return cnt;
	}
	
	
	
	//세션 초기화
	@RequestMapping("removeSession")
	public String removeSession(HttpSession session) {
		if(session.getAttribute("storeId") != null) {
			session.removeAttribute("storeId");
		}else if(session.getAttribute("phone") != null) {
			session.removeAttribute("phone");
		}
		return "redirect:/homeSample";
	};

	
	
	
	@RequestMapping(value = "/memberloginform.do", method = RequestMethod.GET) 
	public ModelAndView memberLoginForm(HttpSession session) { 
		ModelAndView mav = new ModelAndView(); 
		/*인증 URL을 생성하기 위하여 getAuthorizationUrl을 호출 */ 
		String kakaoUrl = kakaoController.getAuthorizationUrl(session); /* 생성한 인증 URL을 View로 전달 */ 
		mav.setViewName("memberloginform"); // mav.addObject("naver_url", naverAuthUrl); 
		// 카카오 로그인
		mav.addObject("kakao_url", kakaoUrl); 

		
		return mav; 
		}// end memberLoginForm()
	
	
	@RequestMapping(value = "/kakaologin.do")
	public String getKakaoSignIn(Model model,@RequestParam("code") String code, HttpSession session,MemberVO vo) throws Exception {

	  JsonNode userInfo = kakaoController.getKakaoUserInfo(code);
     
		 String kakaoId = userInfo.get("id").toString();
		 JsonNode properties = userInfo.get("properties");
		 String nickname =properties.get("nickname").toString();
	  System.out.println("=================="+kakaoId+"====================");
	  	  session.setAttribute("phone",nickname); //나중에 따로 바꾸기
		  session.setAttribute("kakaoId", kakaoId);
		  
	 
	  
	  return "redirect:/homeSample";
	}
	
	
}
	


