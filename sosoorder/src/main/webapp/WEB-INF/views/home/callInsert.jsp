<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
.callInsert_wrap{padding:30px}
.callInsert_wrap #seat{width:25%; height:45px;}
.callInsert_wrap #message{width:58%; height:45px;}
.callInsert_wrap #sendBtn{width:15%; height:45px;}
</style>
	 <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4 pd15" style="border-bottom:1px solid #d2d2d2">
      <h1 class="h3 mb-0 text-gray-800">호출</h1>
    </div>
 <div class="callInsert_wrap">   
	<select name="seat" id="seat">
    	<option value="">테이블 선택</option>
    	<c:forEach items="${seatListCall}" var="seat">
    			<option value="${seat.seat}"
    			<c:if test="${seat.seat == seatCheck.seat}">selected="selected"</c:if>
    			>테이블번호 : ${seat.seat}</option>
    		
    	</c:forEach>
	</select>
	<input type="text" id="message" placeholder="요청사항을 입력하세요"/>
	<input type="button" id="sendBtn" value="요청하기"/>
	<div id="messageArea"></div>
</div>