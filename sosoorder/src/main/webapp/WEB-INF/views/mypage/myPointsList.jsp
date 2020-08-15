<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<style>
.btn-group .button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  cursor: pointer;
  float: left;
}

.btn-group .button:hover {
  background-color: #3e8e41;
}

</style>


<div class="mypagelist">
	<ul class="mypagebtn_ul">
		<li class="active"><a href="myPointsList">나의 적립금</a> 
		<li><a href="myCouponList">나의 쿠폰함</a>
		<li><a href="myOrderList">나의 주문내역</a>
	
	</ul>
</div>
<script>
	$(function(){
		$( '.menu4' ).addClass( 'active' );
	});
	
</script>

	<ul class="nav nav-tabs nav-justified">
	    <li class="nav-item">
	      <a class="nav-link active" href="myPointsList">전체</a>
	    </li>
	    <c:forEach items="${MyStoreList}" var="point">
		    <li class="nav-item">
		      <a class="nav-link" href="myPointsList?storeId=${point.storeId}">${point.storeName}</a>
		    </li>
		</c:forEach>
  	</ul>

<table class="table table-white">
	<thead>
		<tr>
			<th scope="col">상호명</th>
			<th scope="col">적립일</th>
			<th scope="col">결제금액</th>
			<th scope="col">사용금액</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${myPointsList}" var="point">
			<tr>
				<td>${point.storeName}</td>
				<td>${point.pointDate}</td>
				<td>
				<c:if test="${point.pointCheck == 1}">
					${point.point*point.pointCheck}
				</c:if>
				</td>
				<td>
				<c:if test="${point.pointCheck == -1}">
					${point.point*point.pointCheck}
				</c:if>
				</td>
			</tr>
			<c:set var="total" value="${total + point.point*point.pointCheck}"/>
		</c:forEach>
	</tbody>
</table>

   <div  style="width:340px; height:40px; text-align:center; padding-top:7px; 
		font-size:16px; border:1px solid; margin:auto;">총적립금: ${total}원</div>

