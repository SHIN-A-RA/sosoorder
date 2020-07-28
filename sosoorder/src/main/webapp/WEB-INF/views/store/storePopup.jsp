<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div style="position:relative">	
	<div id="popup1" class="pop_box" style="position:absolute; left:10px; top:10px; z-index:8;">
		<img src="/images/popup/popup_04.png" />
		<div style="width:100%; height:45px; line-height:45px; background:#333;">
			<div style="float:left; color:#FFF; padding:0px 20px; background:#1d1d1d; cursor:pointer;" onclick="todaycloseWin1();">하루동안 열지않기</div>
			<div style="float:right; color:#FFF; padding:0px 20px; background:#1d1d1d; cursor:pointer;" onclick="closeWin1();">닫기</div>
		</div>
	</div>
</div>


<!-- 레이어팝업시작 -->
<script language="Javascript">

function setCookie( name, value, expirehours ) { 
var todayDate = new Date(); 
todayDate.setHours( todayDate.getHours() + expirehours ); 
document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";" 
} 
function closeWin() { 
document.getElementById('popup0').style.display = "none";
}
function closeWin1() { 
document.getElementById('popup1').style.display = "none";
}
function closeWin2() { 
document.getElementById('popup2').style.display = "none";
}
function todaycloseWin() { 
setCookie( "ncookie", "done" , 24 ); 
document.getElementById('popup0').style.display = "none";
}
function todaycloseWin1() { 
setCookie( "ncookie", "done" , 24 ); 
document.getElementById('popup1').style.display = "none";
}
function todaycloseWin2() { 
setCookie( "ncookie", "done" , 24 ); 
document.getElementById('popup2').style.display = "none";
}
</script>

<style>
	@media all and (max-width:600px) {
		.pop_box{width:90%; margin:0 auto; left:5% !important; top: 50px !important}
		.pop_box img{width:100% !important}

	}
</style>
