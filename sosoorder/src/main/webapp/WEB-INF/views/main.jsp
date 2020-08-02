<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="main_storeList">
	<h1>SOSORDER STORE</h1>
	<ul class="store_ul">
	<c:forEach items="${storeIdList}" var="store">
	<%-- <form action="homeSample" method="post" >
		<input type="hidden" name="storeId" value="${store.storeId}">
		<button>${store.storeId}</button>	
	</form> --%>
	
		<li>
			<a href="homeSample/${store.storeId}">${store.storeId}</a>
		</li>
	</c:forEach>
	</ul>
</div>