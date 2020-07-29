<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<script>
 function checkClass(checkValue){
	  var c1 = document.forms[0];
	  if(checkValue == 1){//정직원
		  $("#checkClassRst").css("color","black");
		  $("#checkClassRst").html("만원");
		  $("#salary").attr("value",null);
		
	  }else if(checkValue == 2){//아르바이트
		  $("#checkClassRst").css("color","black");
		  $("#salary").attr("value",8590); //최저 시급 금액관리는 Super유저가 업데이트한다
		  $("#checkClassRst").html("원");
	   
	  }else{
		  alert("직급을 선택해주세요.")
	  }
	  
	 }	
</script>
<form action="empInsert" method="post" name="frm" id="frm">
	<table id="empView" class="table table-dark">
		<thead>
			<tr>
				<th>직원번호</th>
				<th>직원이름</th>
				<th>업무파트</th>
				<th>입사일</th>
				<th>직원생일</th>
				<th>직급</th>
				<th>급여</th>
				<th>급여일</th>
				<th>전화번호</th>
			</tr>
		</thead>
		<tbody>
				<tr>
					<td><input type="text" name=empNum id="empNum" 
						value="${one.empNum}" readonly="readonly" /></td>
					<td><input type="text" name="empName" id="empName"
						value="${one.empName}"  /></td>
					<td><input type="text" name="workPart" id="workPart"
						value="${one.workPart}" /></td>
					<td><input type="text" name="hireDate" id="hireDate"
						value="${one.hireDate}" /></td>
					<td><input type="text" name="empBirth" id="empBirth"
						value="${one.empBirth}" /></td>
						<td><c:choose>
						    <c:when test="${one.empClass eq '1'}">
							   	  <select name='empClass' id="empClass" onchange="checkClass(this.options[this.selectedIndex].value)">
								  <option value='1' selected>정직원</option>
								  <option value='2'>아르바이트</option>
								  </select>
						    </c:when>
						    <c:when test="${one.empClass eq '2'}">
							   	  <select name='empClass' id="empClass" onchange="checkClass(this.options[this.selectedIndex].value)">
								    <option value='1'>정직원</option>
								   <option value='2' selected>아르바이트</option>
								  </select>
						    </c:when>
						        <c:otherwise>
						         <select name='empClass' id="empClass"  onchange="checkClass(this.options[this.selectedIndex].value)">
								     <option value='0' selected>선택</option>
								     <option value='1' >정직원</option>
								     <option value='2'>아르바이트</option>
								   </select>
							    </c:otherwise>
					 	</c:choose></td>
					<td><input type="text" name="salary" id="salary"
						value="${one.salary}" placeholder="직급을 먼저 선택해주세요"/><span id="checkClassRst"></span></td>
					<td><input type="text" name="salaryDay" id="salaryDay"
						value="${one.salaryDay}" /></td>
					<td><input type="text" name="empPhone" id="empPhone"
						value="${one.empPhone}" /></td>

				</tr>
		</tbody>
	</table>
	<c:if test="${one.empNum ne null}">
	<input type="button" class="btn btn-primary" onclick="location.href='getEmpDelete?empNum=${one.empNum}'" value="메뉴삭제" />	
	</c:if>
<!-- 수정(등록) 기능 -->
	<input type="submit" class="btn btn-warning" value="수정" >
</form>


