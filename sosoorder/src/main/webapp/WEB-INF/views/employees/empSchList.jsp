<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="div_f"> 

	 <h3 class="basic_tb_th_up">직원목록</h3>
		<table  class="basic_tb" border=1>		
		 <c:forEach items="${empList}" var="emp">		
			<tr>
			  <td class="basic_tb_tdd">${emp.empName}</td>
			  <td class="basic_tb_tdd"><button type="button" class="btn btn-primary" onclick="출근">출근</button></td> 
			  <td class="basic_tb_tdd"><button type="button" class="btn btn-danger"onclick="퇴근">퇴근</button></td> 			      
			</tr>
		</c:forEach>	
		</table>
</div>