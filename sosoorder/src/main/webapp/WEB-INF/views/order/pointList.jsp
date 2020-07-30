<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="resources/admin/scss/addcss/hw.css" rel="stylesheet" type="text/css">

<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script language="javascript">

function doRedirectOpener(){
	var parentWindow = window.opener;
	parentWindow.location.href = "/sosoroder/homeSample"
	self.close();
};

</script>

<div class="div_f">
	<div class="div_list">
		<h3 class="list_h3">적립이 완료되었습니다!</h3>
	</div>
	
	<div>
		<table class="basic_tb">		
			<tr>
			     <th class="basic_tb_th_up">가게명</th>
			     <th class="basic_tb_th_up">적립금액</th>
			</tr>	
 		<c:forEach items="${pList}" var="list">	
			<tr>
			  <td class="basic_tb_tdd">${list.storeName}</td>
			  <td class="basic_tb_tdd"> ${list.point}</td>   
			</tr>

	 	 </c:forEach>
		</table>
	</div>
	<div style="text-align: center; padding: 50px;">
		<button onclick="doRedirectOpener()"> 확인완료 </button>
	</div>
</div>