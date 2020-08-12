package com.soso.app.storeorder.web;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.soso.app.admin.service.AdminVO;
import com.soso.app.member.mapper.MemberMapper;
import com.soso.app.member.service.MemberVO;
import com.soso.app.storeorder.service.ReorderService;
import com.soso.app.storeorder.service.ReorderVO;


@Controller
public class ReorderController {
	@Autowired
	private MemberMapper memberMapper;
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private ReorderService reorderService;
	
	@RequestMapping("mailwrite")
	public String mailwrite() {
		return "reorder/mail";
	}
  
	// mailSending 코드
	@RequestMapping("mailSending")
	public String mailSending(HttpServletRequest request) {

		String setfrom = "";
		String tomail = request.getParameter("tomail"); // 받는 사람 이메일
		String title = request.getParameter("title"); // 제목
		String contents = request.getParameter("contents"); // 내용
		String frommail = request.getParameter("frommail"); 
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom("zszs6363@gmail.com"); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(contents); // 메일 내용
			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}
    
		return "emp/empList";
	}
	
	@RequestMapping("sendMailAttach")
	public String sendMailAttach(final ReorderVO vo, MemberVO memberVO, HttpServletRequest request,Model model, 
			ReorderVO reorderVO, HttpSession session,AdminVO adminVO
			) throws IllegalStateException, IOException {

		//업로드 처리
		MultipartFile file = vo.getUploadFile();
		String path = request.getSession().getServletContext().getRealPath("resources/download");
		String filename = "";
		if(file != null && file.getSize() > 0) {
			filename = file.getOriginalFilename();
		    File upFile = FileRenamePolicy.rename(new File(path, filename));
			filename = upFile.getName();
			file.transferTo(upFile);	
			vo.setProfile(filename);
		}
		
		String storeId = (String)session.getAttribute("storeId");
		String phone = (String)session.getAttribute("phone");
		memberVO.setPhone(phone);
		vo.setStoreId(storeId);
		vo.setPhone(phone);
		adminVO.setStoreId(storeId);
		//발송이력저장
		vo.setStoreId(storeId);
		reorderService.mailInsert(vo);
		
		// 회원목록조회
		//MemberVO memberVO = new MemberVO();
		List<Map> list = reorderService.getEmail(adminVO);
		// 회원목록for문
		MimeMessagePreparator[] preparators = new MimeMessagePreparator[list.size()];
		int i = 0;
		for (Map map : list) {
			String email = (String)map.get("EMAIL");
			preparators[i++] = new MimeMessagePreparator() {
				@Override
				public void prepare(MimeMessage mimeMessage) throws Exception {
					final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
					helper.setFrom(vo.getFrommail());//어드민 메일 
					helper.setTo(email);
					helper.setSubject(vo.getTitle());
					helper.setText(vo.getContents(), true);
					if(vo.getProfile()  != null )
					{
						helper.addAttachment(vo.getProfile(), new File(path, vo.getProfile()));
						
					}
				}
			};
		}
		
		mailSender.send(preparators);
		
		model.addAttribute("mailList",reorderService.getmailList(reorderVO));
		return "reorder/mailList";
	}
	//목록조회
	@RequestMapping("mailList")
	public String mailList(Model model, ReorderVO reorderVO,HttpSession session) {
		String storeId = (String)session.getAttribute("storeId");
		reorderVO.setStoreId(storeId);
		model.addAttribute("mailList",reorderService.getmailList(reorderVO));
		return "reorder/mailList";
		//일반 방식
	}
}
