package com.soso.app.member.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soso.app.member.service.MemberService;
import com.soso.app.member.service.MemberVO;


@Controller // Bean �벑濡�, DispacherServlet�씠 �씤�떇�븷 �닔 �엳�뒗 Controller濡� 蹂��솚 => @Compnent
public class MemberController {

	@Autowired
	MemberService memberService;
    
	
	//member로그인 페이지 이동
	@RequestMapping("memberLoginForm")
	public String memberLoginForm(MemberVO vo, Model model,HttpSession session,HttpServletRequest request, HttpServletResponse response) {
		return "member/memberLoginForm";
	}
	
	//member로그인DB처리
	@RequestMapping("memberLogin")
	public String memberLogin(MemberVO vo, Model model,HttpSession session,HttpServletRequest request, HttpServletResponse response) {
		String path = null;
		MemberVO dbVO = memberService.getMember(vo);
		
		//&& !vo.getPhone().equals(dbVO.getPhone())
		
		if (dbVO == null ) {
	         model.addAttribute("errorMsg", "id오류");
	          path = "member/memberLoginForm";
	         
	      } else if (!vo.getPwd().equals(dbVO.getPwd())) {
	    	  model.addAttribute("errorMsg", "pwd오류");
	    	  path = "member/memberLoginForm";

	      } else {
	         session.setAttribute("phone", vo.getPhone());
	         session.setAttribute("pwd", vo.getPwd());
	         path = "redirect:/";
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

	
	  //아이디 중복처리
	@RequestMapping("IdDupCheck")
	public void idDupCheck(MemberVO vo, Model model) {
		
		
	}
	
	
	 
	
	
	
	
	
	
	/*
	 * // 목록조회
	 * 
	 * @RequestMapping("memberList") public String memberList(Model model) {
	 * model.addAttribute("memberList", memberService.getMemberList(null)); return
	 * "loginSignUp/member/memberInsert"; }
	 */
	 /* 
	 * // emp관리
	 * 
	 * @RequestMapping("empClient") public String empClient() { return
	 * "admin/emp/empClient"; }
	 * 
	 * // ajax목록
	 * 
	 * @RequestMapping("ajaxEmpList") public @ResponseBody List<EmpVO> ajaxEmpList()
	 * { return empMapper.empList(null); }
	 */

	// 수정폼

	// 수정처리

	// 삭제처리

}
