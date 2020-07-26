<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div>
<c:forEach items="${storeIdList}" var="store">
<%-- <form action="homeSample" method="post" >
	<input type="hidden" name="storeId" value="${store.storeId}">
	<button>${store.storeId}</button>	
</form> --%>
	<div>
		<a href="homeSample/${store.storeId}">${store.storeId}</a>
	</div>
</c:forEach>
</div>