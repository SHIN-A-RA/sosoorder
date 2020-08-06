<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  
<table  class="basic_tb" border=1>		
	<c:forEach items="${getEmpListTime}" var="emp">		
	<tr>
	  <td class="basic_tb_tdd">${emp.empName}</td>
	 <td class="basic_tb_tdd"> 
	 	<jsp:useBean id="now" class="java.util.Date" />
	 	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="nowDate" />   
	  	<c:if test="${emp.workStart < nowDate || emp.workStart == null}">
		  	<button type="button" class="btn btn-primary workStart" data-empNum="${emp.empNum}" id="start">출근</button>
	  	</c:if>
	  	<c:if test="${emp.workEnd != emp.workStart}">
		 	<button type="button" class="btn btn-danger workEnd" data-empNum="${emp.empNum}" id="end">퇴근</button>
	  	</c:if>
	  	
	  	<c:if test="${emp.workStart == nowDate && emp.workEnd == emp.workStart}">
		  	<button type="button" class="btn btn-primary workStart" data-empNum="${emp.empNum}" id="start">재출근</button>
		  	</c:if>
		 </td> 			      
		</tr>
	</c:forEach>	
</table>