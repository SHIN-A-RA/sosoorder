	function validCheck(){
	
		//필수 입력 체크
		if(window.document.frm.storeId.value == ""){ //trim함수
			alert("아이디를 입력해주세요");		 //window.document. 생략가능 window.document.frm.id.value-> null
			frm.storeId.focus();
			return;
		}
	
		if(window.document.frm.storePwd.value == ""){  
			alert("비밀번호를 입력해주세요");
			frm.storePwd.focus();
			return;
		}
		if(window.document.frm.storeName.value == ""){  
			alert("상호명을 입력해주세요");
			frm.storeName.focus();
			return;
		}
				if(window.document.frm.storeNum.value == ""){  
			alert("사업자번호를 입력해주세요");
			frm.storeNum.focus();
			return;
		}
				if(window.document.frm.storeAddr.value == ""){  
			alert("주소를 입력해주세요");
			frm.storeAddr.focus();
			return;
		}
				if(window.document.frm.accountNum.value == ""){  
			alert("계좌번호를 입력해주세요");
			frm.accountNum.focus();
			return;
		}


		
	frm.submit();

	
	} 
