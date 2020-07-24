<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- <script>
var idPass;
var idRegex = /^[a-zA-Z0-9]{4,12}$/;
$(document).ready(function(){
	//아이디 중복체크
	$('input[name=storeId]').blur(function(){
		var idCheck=$('input[name=storeId]').val();
		if(idRegex.test(idCheck)){
			$.ajax({
				url:'idCheck?storeId='+idCheck,
				type:'get',
				success:function(data){
					var color;
					var ans;
					if(data>0){
						ans='이미있는 아이디입니다.';
						color='red';
                        idPass=false;
					}else{
						ans='회원가입 가능한 아이디입니다.';
						color='green';
						idPass=true;
					}
					$('#temp').text(ans);
					$('#temp').css('color',color);
				}
			})	
		}
	});
});
 </script> -->




			<form action="employeesInsert" method="post" name="frm" id="frm">
				<div class="form-item">
				<!-- 가입시 영문 숫자(4,12)까지 허용 -->
					<p class="formLabel">직원이름</p> 
					<input type="text" name="empName" id="empName" class="form-style"
						autocomplete="off" />
						<!-- <span id = "temp"></span> -->
				</div>
				
				<div class="form-item">
					<p class="formLabel">업무파트</p>
					<input type="text" name="workPart" id="workPart" class="form-style"
						autocomplete="off" />
				</div>
				<div class="form-item">
					<p class="formLabel">직원생일</p>
					<input type="text" name="empBirth" id="empBirth"
						class="form-style" autocomplete="off" />
				</div>
				<div class="form-item">
					<p class="formLabel">입사일</p>
					<input type="text" name="hireDate" id="hireDate" class="form-style"
						autocomplete="off" />
				</div>
				<div class="form-item">
					<p class="formLabel">급여</p>
					<input type="text" name="salary" id="salary"
						class="form-style" autocomplete="off" />
				</div>
				<div class="form-item">
					<p class="formLabel">급여일</p>
					<input type="text" name="salaryDay" id="salaryDay"
						class="form-style" autocomplete="off" />
				</div>
				<div class="form-item">
					<p class="formLabel">전화번호</p>
					<input type="text" name="empPhone" id="empPhone"
						class="form-style" autocomplete="off" />
				</div>
				<div class="form-item">
					<p class="formLabel">직급</p>
					<input type="text" name="empClass" id="empClass"
						class="form-style" autocomplete="off" />
				</div>
				<div class="form-item">
					<p class="formLabel">StoreId</p>
					<input type="text" name="storeId" id="storeId"
						class="form-style" autocomplete="off" />
				</div>
				<p></p>
				<input type="submit" class="login pull-right" value="직원등록">
				</form>
			

