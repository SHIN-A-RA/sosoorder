<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="https:////cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
<!-- 추가사항
아이디 (DB)중복체크
정규식
사업자 번호 데이터 장규식  -->

<!-- <script type="text/javascript">
$(document).ready(function(){
	var formInputs = $('input[type="text"],input[type="password"]');
	formInputs.focus(function() {
       $(this).parent().children('p.formLabel').addClass('formTop');
       $('div#formWrapper').addClass('darken-bg');
       $('div.logo').addClass('logo-active');
	});
	formInputs.focusout(function() {
		if ($.trim($(this).val()).length == 0){
		$(this).parent().children('p.formLabel').removeClass('formTop');
		}
		$('div#formWrapper').removeClass('darken-bg');
		$('div.logo').removeClass('logo-active');
	});
	$('p.formLabel').click(function(){
		 $(this).parent().children('.form-style').focus();
	});
});
</script>
<script type="text/javascript">
function passwordChack() {
    var pwd = document.twin.storePwd.value;
    var confirmPW = document.twin.storePwd2.value;
    if (pwd.length < 8 || pwd.length > 16) {
        window.alert('비밀번호는 8글자 이상, 16글자 이하만 이용 가능합니다.');
        document.getElementById('pwd').value=document.getElementById('pwdCheck').value='';
        document.getElementById('same').innerHTML='';
    }
    if(document.getElementById('pwd').value!='' && document.getElementById('pwdCheck').value!='') {
        if(document.getElementById('pwd').value==document.getElementById('pwdCheck').value) {
            document.getElementById('same').innerHTML='비밀번호가 일치합니다.';
            document.getElementById('same').style.color='green';
        }
        else {
            document.getElementById('same').innerHTML='비밀번호가 일치하지 않습니다.';
            document.getElementById('same').style.color='red';
        }
    }
}
</script> -->
<head>

<style>
body{
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
  font-family:'HelveticaNeue','Arial', sans-serif;

}
a{color:#58bff6;text-decoration: none;}
a:hover{color:#aaa; }
.pull-right{float: right;}
.pull-left{float: left;}
.clear-fix{clear:both;}
div.logo{text-align: center; margin: 20px 20px 30px 20px; fill: #566375;}
div.logo svg{
	width:180px;
	height:100px;
}
.logo-active{fill: #44aacc !important;}
#formWrapper{
	background: rgba(0,0,0,.2); 
	width:100%; 
	height:100%; 
	position: absolute; 
	top:0; 
	left:0;
	transition:all .3s ease;}
.darken-bg{background: rgba(0,0,0,.5) !important; transition:all .3s ease;}

div#form{
	position: absolute;
	width:360px;
	height:320px;
	height:auto;
	background-color: #fff;
	margin:auto;
	border-radius: 5px;
	padding:20px;
	left:50%;
	top:50%;
	margin-left:-180px;
	margin-top:-200px;
}
div.form-item{position: relative; display: block; margin-bottom: 20px;}
 input{transition: all .2s ease;}
 input.form-style{
	color:#8a8a8a;
	display: block;
	width: 90%;
	height: 44px;
	padding: 5px 5%;
	border:1px solid #ccc;
	-moz-border-radius: 27px;
	-webkit-border-radius: 27px;
	border-radius: 27px;
	-moz-background-clip: padding;
	-webkit-background-clip: padding-box;
	background-clip: padding-box;
	background-color: #fff;
	font-family:'HelveticaNeue','Arial', sans-serif;
	font-size: 105%;
	letter-spacing: .8px;
}
div.form-item .form-style:focus{outline: none; border:1px solid #58bff6; color:#58bff6; }
div.form-item p.formLabel {
	position: absolute;
	left:26px;
	top:2px;
	transition:all .4s ease;
	color:#bbb;}
.formTop{top:-22px !important; left:26px; background-color: #fff; padding:0 5px; font-size: 14px; color:#58bff6 !important;}
.formStatus{color:#8a8a8a !important;}
input[type="submit"].login{
	float:right;
	width: 112px;
	height: 37px;
	-moz-border-radius: 19px;
	-webkit-border-radius: 19px;
	border-radius: 19px;
	-moz-background-clip: padding;
	-webkit-background-clip: padding-box;
	background-clip: padding-box;
	background-color: #55b1df;
	border:1px solid #55b1df;
	border:none;
	color: #fff;
	font-weight: bold;
}
input[type="submit"].login:hover{background-color: #fff; border:1px solid #55b1df; color:#55b1df; cursor:pointer;}
input[type="submit"].login:focus{outline: none;}

</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script src="https://code.jquery.com/jquery-2.1.0.min.js"></script>


<body>
	<div id="formWrapper">
<div id="form">
<div class="logo">


</div>
<form action="adminInsert" method="post" name="frm" >
		<div class="form-item">
			<p class="formLabel">사업자 아아디</p>
			<input type="text" name="storeId" id="storeId" class="form-style" autocomplete="off" />
		</div>
		<div class="form-item">
			<p class="formLabel">비밀번호</p>
			<input type="text" name="storePwd" id="storePwd" class="form-style" autocomplete="off" onchange="passwordChack()" id ="pwd"/>
		</div>
		<div class="form-item">
			<p class="formLabel">비밀번호 확인</p>
			<input type="text" name="storePwd2" id="storePwd2" class="form-style" autocomplete="off"onchange="passwordChack()" id="pwdCheck"/>
			<p><span id="same"></span></p>
		</div>	
		<div class="form-item">
			<p class="formLabel">상호명</p>
			<input type="text" name="storeName" id="storeName" class="form-style" autocomplete="off" />
		</div>	
		<div class="form-item">
			<p class="formLabel">사업자번호</p>
			<input type="text" name="storeNum" id="storeNum" class="form-style" autocomplete="off" />
		</div>	
		<div class="form-item">
			<p class="formLabel">사업장 주소</p>
			<input type="text" name="storeAddr" id="storeAddr" class="form-style" autocomplete="off" />
		</div>	
		<div class="form-item">
			<p class="formLabel">계좌번호</p>
			<input type="text" name="accountNum" id="accountNum" class="form-style" autocomplete="off" />
		</div>	
												
		<p></p>	
		<input type="submit" class="login pull-right" value="가입완료">
</form>
</body>
</html>