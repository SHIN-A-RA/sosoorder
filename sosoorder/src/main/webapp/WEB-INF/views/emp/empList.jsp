<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<h3>사원목록</h3>
	<c:forEach items="${empList}" var="emp">
		${emp.firstName} ${emp.lastName} - ${emp.employeeId} <br>
	</c:forEach>
</body>
</html>