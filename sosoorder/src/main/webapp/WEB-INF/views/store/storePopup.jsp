<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
	#popupWrap{}
	.pop_box{position: absolute; left: 50%; top: 50%; z-index: 8; background: #fff;
    border: 1px solid #c5c5c5; border-radius: 9px; transform:translate(-50%, -50%); z-index: 9;}
	@media all and (max-width:600px) {
		.pop_box{width:90%; margin:0 auto; left:5% !important; top: 50px !important}
		.pop_box img{width:100% !important}
	}
	.btnPopup{width:100%; height:45px; line-height:45px; background:#333;}
	.btnPopup div{color:#FFF; padding:0px 20px; background:#1d1d1d; cursor:pointer;}
	.poptit{padding: 9px; border-bottom: 1px solid #eee; font-size: 18px;}
</style>

<div id="popupWrap">	

	<%-- <div class="pop_box">
	<div class="poptit">dd</div>
	<img src="${pageContext.request.contextPath}/resources/download/bob.jpeg" />
	<div class="popcontents">dd</div>
	<div class="btnPopup">
	<div class="fl" onclick="todaycloseWin1();">하루동안 열지않기</div>
	<div class="fr" onclick="closeWin1();">닫기</div> --%>
</div>



<!-- 레이어팝업시작 -->
<!-- <script>

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
</script> -->
<script>

 $(function(){
	    getPopup();
	});
	 
//사용자 목록 조회 요청
	function getPopup() {
		$.ajax({
			url:'/sosoroder/storePopupListPro',
			type:'GET',
			dataType:'json',
			success:userListResult,
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			}
	})//userList
	}
	//사용자 목록 조회 응답
	function userListResult(data) {
		$("#popupWrap").empty();
		$.each(data,function(idx,item){
			$('<div>').addClass('pop_box').html(
				"<div class='poptit'>" +item.popTitle + "</div>" +
    			"<img src='${pageContext.request.contextPath}/resources/download/"+ item.popImage+"' />"+
    			"<div class='popcontents'>"+ item.popContents+"</div>"+
    			"<div class='btnPopup'>"+
    			"<div class='fl' onClick='javascript:setCookie(" + item.popNum + ")'>하루동안 열지않기</div>"+
    			"<div class='fr' onclick='closeWin1();''>닫기</div> ").appendTo('#popupWrap');

		});//each
	}//userListResult
	




</script>


