	function validCheck(){
	
		//필수 입력 체크
		if(window.document.frm.phone.value == ""){ //trim함수
			alert("휴대폰번호를 입력해주세요");		 //window.document. 생략가능 window.document.frm.id.value-> null
			frm.phone.focus();
			return;
		}
	
		if(window.document.frm.pwd.value == ""){  
			alert("비밀번호를 입력해주세요");
			frm.pwd.focus();
			return;
		}
		if(window.document.frm.email.value == ""){  
			alert("이메일을 입력해주세요");
			frm.email.focus();
			return;
		}
				if(window.document.frm.delAddr.value == ""){  
			alert("배달 받을 주소를 입력해주세요");
			frm.delAddr.focus();
			return;
		}
		
		

		
	frm.submit();

	
	} 
	
