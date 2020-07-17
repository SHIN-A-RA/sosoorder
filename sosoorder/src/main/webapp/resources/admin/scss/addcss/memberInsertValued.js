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
	
 function checkPwd(){
	  var f1 = document.forms[0];
	  var pw1 = f1.pwd.value;
	  var pw2 = f1.pwd2.value;
	  if(pw1!=pw2){
	   document.getElementById('checkPwd').style.color = "red";
	   document.getElementById('checkPwd').innerHTML = "비밀번호 불일치";
	  }else{
	   document.getElementById('checkPwd').style.color = "green";
	   document.getElementById('checkPwd').innerHTML = "비밀번호 일치";
	   
	  }
	  
	 }	