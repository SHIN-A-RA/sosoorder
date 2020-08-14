<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="resources/admin/scss/addcss/hw.css" rel="stylesheet" type="text/css">

<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script language="javascript">

/* 적립하기 팝업 띄우기 */
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
<!-- 컨텐츠부분 -->
<!-- 타이틀 -->
<div class="row">
	<div class="col-xl-12 div-tt">
		<h2>주문완료</h2>
	</div>
</div>

<div class="row">
	<div class="col-xl-12 div-tt">
		<h2 style="text-align:center">주문이 완료되었습니다. 감사합니다!</h2>
	</div>
</div>


<div class="row" style="padding-top: 100px; padding-left: 25%; padding-right: 25%;">
	<div class="col-xl-12" style="background: white; border-bottom: 1px solid #e0e0e0;">
		<h2 style="text-align: center; padding: 15px;">주문정보</h2>
	</div>
	<div class="col-xl-8" style="padding: 15px; background: white;">주문메뉴</div>
	<div class="col-xl-4" style="padding: 15px; background: white;">수량</div>
	 <c:forEach items="${oderList}" var="order">
		<div class="scroll1 col-xl-8 div_menu1">${order.menuName}</div>
		<div class="scroll1 col-xl-4 div_menu1">${order.orderCount}</div>		
	 </c:forEach>
</div> 




<div class="row">
		<div style="padding: 0px 0px 80px 0px;">
			<a href="receipt?payNum=${payNum}" class="btn_point" style="color:#fff">영수증</a>
			<a onclick="goPointInsert()" class="btn_point" style="color:#fff">적 립</a>
		</div>
		<p><a class="btn_home" href="/sosoroder/homeSample">홈으로</a></p>
</div>
