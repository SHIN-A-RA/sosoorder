<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<script src="resources/admin/scss/addcss/login-signUp.js"></script>
<script src="resources/admin/scss/addcss/memberInsertValued.js"></script> 
<link rel="stylesheet" type="text/css" href="resources/admin/scss/addcss/login-signUp.css"/>
<script>
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
/*  $(document).on("keyup", ".phone", function() { $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") ); }); */
</script>	 
<script>
/* 휴대폰 번호 중복체크 */
var phonePass;
var idRegex = /^[a-zA-Z0-9]{4,11}$/;
$(document).ready(function(){
	//아이디 중복체크
	$('input[name=phone]').blur(function(){
		var phoneCheck=$('input[name=phone]').val();
		if(idRegex.test(phoneCheck)){
			$.ajax({
				url:'phoneCheck?phone='+phoneCheck,
				type:'get',
				success:function(data){
					var color;
					var ans;
					if(data>0){
						ans='이미 가입된 번호입니다.';
						color='red';
                        phonePass=false;
					}else{
						ans='사용가능한 번호입니다.';
						color='green';
						phonePass=true;
					}
					$('#temp').text(ans);
					$('#temp').css('color',color);
				}
			})	
		}
	});
});
 </script>





<div id="formWrapper">
	<div id="form">
		<div class="logo">

		</div>
		<form action="memberInsert" method="post" name="frm">
			<div class="form-item">
				<p class="formLabel">Phone</p>
				<input type="text" name="phone" id="phone" class="form-style phone"
					autocomplete="off" />
			</div>
			<p><span id = "temp"></span></p>
			
			<div class="form-item">
				<p class="formLabel">비밀번호</p>
				<input type="password" name="pwd" id="pwd" class="form-style"
					autocomplete="off" onchange="passwordChack()" onkeyup="checkPwd()" />
			</div>
			<div class="form-item">
				<p class="formLabel">비밀번호 확인</p>
				<input type="password" name="pwd2" id="pwd2" class="form-style"
					autocomplete="off" onchange="passwordChack()" onkeyup="checkPwd()" />
			</div>
			
			<p><span id="checkPwd"></span></p>
			
			<div class="form-item">
				<p class="formLabel">이메일</p>
				<input type="email" name="email" id="email" class="form-style"
					autocomplete="off" />
				<p>
					<span id="same"></span>
				</p>
			</div>
			<div class="form-item">
				<p class="formLabel">주소</p>
				<input type="text" name="delAddr" id="delAddr" class="form-style"
					autocomplete="off" />
			</div>

			<p></p>
			<input type="button" onclick="validCheck()" class="login pull-right" value="가입완료">
		</form>
	</div>
</div>
