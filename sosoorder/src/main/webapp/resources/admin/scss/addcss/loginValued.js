	function validCheck(){
	
		//필수 입력 체크
		if(window.document.frm.phone.value == ""){  
			alert("휴대폰번호를 입력해주세요");
			frm.phone.focus();
			return;
		}
		if(window.document.frm.pwd.value == ""){  
			alert("비밀번호를 입력해주세요");
			frm.pwd.focus();
			return;
		}
	
	frm.submit();
	
	} 