<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
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
/*  $(document).on("keyup", ".empPhone", function() { $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") ); }); */

</script>
<form action="empInsert" method="post" name="frm" id="frm">
   <div class="div-tt">
      <h2>직원 상세정보</h2>
   </div>
<div class="div_f"  style="float:center; position: relative;
        left: 250px;
        top: 50px;">

		<div class="col" >
			<div class="input-group" style="width: 600px; padding: 5px 1px 5px 1px; display:none;">
				<div class="input-group-prepend">
					<span class="input-group-text">직원번호</span>
				</div>
				<input type="text" class="form-control" name="empNum"
					id="empNum" style="text-align: center;"
					 value="${one.empNum}"/>
			</div>
			
			<div class="input-group" style="width: 600px; padding: 5px 1px 5px 1px;">	 
				<div class="input-group-prepend">
					<span class="input-group-text">직원이름</span>
				</div>
				<input type="text" class="form-control" name="empName"
					id="empName" style="text-align: center;"
					 value="${one.empName}"/>
			</div>
			
			<div class="input-group" style="width: 600px; padding: 5px 1px 5px 1px;">	 
				<div class="input-group-prepend">
					<span class="input-group-text">업무파트</span>
				</div>
					<c:choose>
						    <c:when test="${one.workPart eq '1'}">
							   	  <select name='workPart' id="workPart" >
								  <option value='1' selected>오전</option>
								  <option value='2'>오후</option>
								  <option value='3'>풀타임</option>
								  </select>
						    </c:when>
						    <c:when test="${one.workPart eq '2'}">
							   	  <select name='workPart' id="workPart" >
								    <option value='1'>오전</option>
								   <option value='2' selected>오후</option>
								   <option value='3'>풀타임</option>
								  </select>
						    </c:when>
						    <c:when test="${one.workPart eq '3'}">
							   	  <select name='workPart' id="workPart">
								    <option value='1'>오전</option>
								   <option value='2' >오후</option>
								   <option value='3'selected>풀타임</option>
								  </select>
						    </c:when>
						    <c:otherwise>
						    							   	  <select name='workPart' id="workPart" >
								  <option value='1' selected>오전</option>
								  <option value='2'>오후</option>
								  <option value='3'>풀타임</option>
								  </select>
						    </c:otherwise>
						    </c:choose>
			</div>
				 
			<div class="input-group" style="width: 600px; padding: 5px 1px 5px 1px;">	 
				<div class="input-group-prepend">
					<span class="input-group-text">생년월일</span>
				</div>
				<input type="date" class="form-control" name="empBirth"
					id="empBirth" style="text-align: center;"
					 value="${one.empBirth}"/>
			</div>
			
			<div class="input-group" style="width: 600px; padding: 5px 1px 5px 1px;">			 
				<div class="input-group-prepend">
					<span class="input-group-text">입사일&nbsp</span>
				</div>
				<input type="date" class="form-control" name="hireDate"
					id="hireDate" style="text-align: center;"
					  value="${one.hireDate}"/>
			</div>
						<div class="input-group" style="width: 600px; padding: 5px 1px 5px 1px;">		 	 
					<div class="input-group-prepend">
					<span class="input-group-text">&nbsp직급&nbsp</span>
				</div>
				<c:choose>
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
						     <option value='1' >정직원</option>
						     <option value='2'>아르바이트</option>
						   </select>
					    </c:otherwise>
			 	</c:choose>
			</div>
			<div class="input-group" style="width: 600px; padding: 5px 1px 5px 1px;">		 
				<div class="input-group-prepend">
					<span class="input-group-text">&nbsp급여&nbsp</span>
				</div>
				<input type="text" class="form-control" name="salary"
					id="salary" style="text-align: center;"
					 value="${one.salary}" placeholder="직급을 먼저 선택해주세요"/><span id="checkClassRst"></span>
			</div>
			
			<div class="input-group" style="width: 600px; padding: 5px 1px 5px 1px;">				 		 
					<div class="input-group-prepend">
					<span class="input-group-text">퇴사일&nbsp</span>
				</div>
				<input type="date" class="form-control" name="endDate"
					id="endDate" style="text-align: center;"
					 value="${one.endDate}"/>	
			</div>
			
			<div class="input-group" style="width: 600px; padding: 5px 1px 5px 1px;">				 	 
					<div class="input-group-prepend">
					<span class="input-group-text">휴대전화</span>
				</div>
				<input type="text" class="form-control empPhone" name="empPhone"
					id="empPhone" style="text-align: center;"
					 value="${one.empPhone}"/>	
			</div>
			

		</div>
			<div style="float:center; position: relative;
										        left: 270px;
										        top: 20px;">
			<c:if test="${one.empNum ne null}">
				<input type="button" class="btn btn-danger" onclick="location.href='getEmpDelete?empNum=${one.empNum}'" value="메뉴삭제" />	
			</c:if>
			<!-- 수정(등록) 기능 -->
			<input type="submit" class="btn btn-warning" value="완료" >
			</div>
	</div>
</form>

