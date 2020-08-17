<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="resources/admin/scss/addcss/login-signUp.js"></script>
<script src="resources/admin/scss/addcss/loginToggle.js"></script>
<link rel="stylesheet" type="text/css" href="resources/admin/scss/addcss/login-signUp.css"/>
<style>
.toggleBG{background: #CCCCCC; width: 70px; height: 30px; border: 1px solid #CCCCCC; border-radius: 15px;}
.toggleFG{background: #FFFFFF; width: 30px; height: 30px; border: none; border-radius: 15px; position: relative; left: 0px;}	
</style>


<c:if test="${not empty errorMsg}">
	<script>
	alert('${errorMsg}');
	</script>
</c:if>
<script>

$(function(){
	
	if( '${param.msgCheck}' ){
		alert('${param.msgCode}');
	}
});
function memberValidCheck() {

	//필수 입력 체크
	if (window.document.frm.phone.value == "") {
		alert("휴대폰번호를 입력해주세요");
		frm.phone.focus();
		return;
	}
	if (window.document.frm.pwd.value == "") {
		alert("비밀번호를 입력해주세요");
		frm.pwd.focus();
		return;
	}

	
	frm.submit();
}

function adminValidCheck() {

	//필수 입력 체크
	if (window.document.frm2.storeId.value == "") {
		alert("사업자 아이디를 입력해주세요");
		frm2.storeId.focus();
		return;
	}
	if (window.document.frm2.storePwd.value == "") {
		alert("비밀번호를 입력해주세요");
		frm2.storePwd.focus();
		return;
	}

	frm2.submit();

}
</script>
<div id="formWrapper">
	<div id="form">
		<div class="logo">
			<img src="${pageContext.request.contextPath}/resources/images/soso_icon.png" width="77%">
		</div>

<div class='toggleBG' onclick="getToggleBtnState('buttonID');">
    <button id='buttonID' class='toggleFG' ></button>
</div>

<p></p>
		<form action="adminLogin" method="post" name="frm2" class="basic" id="adminLogin2">
			<div class="form-item">
				<p class="formLabel">id</p>
				<input type="text" name="storeId" id="storeId" class="form-style"
					autocomplete="off" />
			</div><p></p>
			<div class="form-item">
				<p class="formLabel">Password</p>
				<input type="password" name="storePwd" id="storePwd" class="form-style" />
				<!-- <div class="pw-view"><i class="fa fa-eye"></i></div> -->
			</div>
			<button type="button" class="btn btn-warning btn-block" onclick="adminValidCheck()">사업자 로그인</button>
</form>

<p></p>
<form action="memberLogin" method="post" name="frm" class="basic" id="memberLogin2">
			<div class="form-item">
				<p class="formLabel">Phone</p>
				<input type="text" name="phone" id="phone" class="form-style"
					autocomplete="off" />
			</div><br>
			<div class="form-item">
				<p class="formLabel">Password</p>
				<input type="password" name="pwd" id="pwd" class="form-style" />
				<p></p>
			</div>
			<button type="button" class="btn btn-success btn-block" onclick="memberValidCheck()">일반로그인</button>
			
</form>
			<button type="button" class="btn btn-primary btn-block" onclick="location.href='memberInsertForm'">일반가입</button>
			<button type="button" class="btn btn-primary btn-block" onclick="location.href='adminInsertForm'">사업자가입</button>
</div>
</div>
