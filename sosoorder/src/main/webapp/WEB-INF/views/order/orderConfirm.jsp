<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="resources/admin/scss/addcss/hw.css" rel="stylesheet" type="text/css">

<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script language="javascript">


function goPointInsert() { 
	  var screenW = screen.availWidth;  // 스크린 가로사이즈
	  var screenH = screen.availHeight; // 스크린 세로사이즈
	  var popW = 600; // 띄울창의 가로사이즈
	  var popH = 600; // 띄울창의 세로사이즈
	  var posL=( screenW-popW ) / 2;   // 띄울창의 가로 포지션 
	  var posT=( screenH-popH ) / 2;   // 띄울창의 세로 포지션 

    window.open("./insertPoint?payNum=${payNum}" , "_blank", 'width='+ popW +',height='+ popH +',top='+ posT +',left='+ posL +',resizable=no,scrollbars=no');
}

</script>
<%-- <input type="hidden" class="orderNum" value="${orderNum}"> --%>
<div class="div_c">
	<div class="div_text">
		<h3 style="padding: 50px;">주문이 완료되었습니다.</h3>
		<div style="padding:10px; color:red;">
			<p>※현금결제시 데스크에서 결제를 완료해주세요</p>
			<p>※이메일 등록시 다양한 할인정보를 확인할 수 있습니다</p>	
		</div>
	</div>	
	<div class="div_text2">
		<div style="padding: 0px 0px 80px 0px;">
			<a href="receipt?OrderNum=${param.orderNum}" class="btn_point" style="color:#fff">영수증</a>
			<a onclick="goPointInsert()" class="btn_point" style="color:#fff">적 립</a>
		</div>
		<p><a class="btn_home" href="/sosoroder/homeSample">홈으로</a></p>
	</div>
</div>
${storeInfo } ${payNum }
