<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
#un {
	text-decoration: underline;
	}
  body {
    /* margin: 40px 10px; */
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    /* max-width: 1100px; */
    margin: 0 auto;
    margin-bottom: 30px;
  }
  
 
/*  스크롤 */ 
/* width */
::-webkit-scrollbar {
  width: 10px;
}  
/* Track */
::-webkit-scrollbar-track {
  background: #f1f1f1; 
}
 
/* Handle */
::-webkit-scrollbar-thumb {
  background: #888; 
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
  background: #555; 
}

</style>

<!--========================
fullCalendar 
========================-->

<link href='resources/admin/scss/fullCalendar/main.css' rel='stylesheet' />
<script src='resources/admin/scss/fullCalendar/main.js'></script>
<script src='resources/admin/scss/fullCalendar/locales/ko.js'></script>
<!--========================
		직원bar 
========================-->
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">

<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>

<!--========================
  직원bar에서 직원 클릭시 이벤트
========================-->
<div class="slick_box menu_category">
	<div class="menu_bar">
		<c:forEach var="vo" items="${empSalaryList}">
		<div><a href='#' onclick="javascript:empSel('${vo.empNum}')">${vo.empName}</a></div>
		</c:forEach>
	</div>
	
	<span class="prev" id="aro_prev1"><i class="fas fa-caret-left" aria-hidden="true"></i>
	</span> <span class="next" id="aro_next1"><i class="fa fa-caret-right" aria-hidden="true"></i></span>
</div>


<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-between mb-4 pd15" style="border-bottom:1px solid #d2d2d2; margin-top: 85px;">
  <h1 class="h3 mb-0 text-gray-800">급여관리</h1>
</div>	



<script>
/*===============================================
	Slick 클릭 Action 
===============================================*/	
	$('.menu_bar').slick({
		autoplay : false,
		dots : false,
		speed : 300 ,
		infinite : false,
		autoplaySpeed : 3000 /* 이미지가 다른 이미지로 넘어 갈때의 텀 */,
		prevArrow : $('#aro_prev1'),
		nextArrow : $('#aro_next1'),
		arrows : true,
		slidesToShow : 3,
		slidesToScroll : 3,
		fade : false
	});
</script>



<script>
/*===============================================
달 데이터 출력하기
===============================================*/
 	function autoList(){
		var empNumMonthDate = $("#frmEmp").serialize() ;
 		$.ajax({
			url:"getEmpSalAjax",
			method: 'post',
			data :empNumMonthDate,
			dataType:'json' 
			}).done(function(result){
				  var table = document.getElementById("empSETable");
				  table.innerHTML = "";
				for(i=0; i<result.length; i++){
					  var row = table.insertRow(0);
					  var cell1 = row.insertCell(0);
					  var cell2 = row.insertCell(1);
					  var cell3 = row.insertCell(2);
					  var cell4 = row.insertCell(3);
					  var cell5 = row.insertCell(4);
					  cell1.innerHTML = result[i].WEEK;
					  cell2.innerHTML = result[i].MONTH;
					  cell3.innerHTML = result[i].WORKSTART;
					  cell4.innerHTML = result[i].WORKEND;
					  cell5.innerHTML = result[i].SUMTIME+"시간";
				}
		})
 		.fail(function(result){}) //서버 에러 발생시
		.always(function(result){}); //정상이든 에러든 무조건 실행
}; 

	function autoSalry(){
		var empNumMonthDate = $("#frmEmp").serialize() ;
			$.ajax({
			url:"totalSalAjax",
			method: 'post',
			data :empNumMonthDate,
			dataType:'json' 
			}).done(function(result){
				  var table = document.getElementById("totalSalary");
				  table.innerHTML = "";
				for(i=0; i<result.length; i++){
					
						  var row = table.insertRow(0);
						  var cell1 = row.insertCell(0);
						  var cell2 = row.insertCell(1);
						  cell1.innerHTML = result[i].TOTALTIME+"시간";
				  if(result[i].EMPCLASS == 2 ){//아르바이트:2번 정직원 :1번 
						  cell2.innerHTML = result[i].TOTALSAL.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원";
					}else{
						  cell2.innerHTML = "월급:"+result[i].SALARY.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"만원";
					}
			}//end of for
		})//end of done
			.fail(function(result){}) //서버 에러 발생시
		.always(function(result){}); //정상이든 에러든 무조건 실행
	}; 

	
 	function allEmpSal(){
		var empNumMonthDate = $("#frmEmp").serialize() ;
 		$.ajax({
			url:"allEmpSal",
			method: 'post',
			data :empNumMonthDate,
			dataType:'json' 
			}).done(function(result){
				  var table = document.getElementById("allEmpSal");
				  table.innerHTML = "";
				for(i=0; i<result.length; i++){
					  var row = table.insertRow(0);
					  var cell1 = row.insertCell(0);
					  var cell2 = row.insertCell(1);
					  
					  cell1.innerHTML = result[i].EMPNAME;
					  if(result[i].EMPCLASS ==2){
						  cell2.innerHTML = result[i].TOTALSAL.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원";
					  }else{
						  cell2.innerHTML = result[i].SALARY.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"만원";
					  }
				 }
			})
 		.fail(function(result){}) //서버 에러 발생시
		.always(function(result){}); //정상이든 에러든 무조건 실행
}; 
	
	
	
</script>



<!-- ==================================
Full Calender 출력
====================================== -->
<script>
/* 자바스크립트 현재 날짜 */
var Now = new Date();
var NowTime = Now.getFullYear();
NowTime += '-' + (Now.getMonth() + 1) ;
NowTime += '-' + Now.getDate();


/*=====================================
달력 출력에 출근한 날 표시 
=======================================*/
$(function(){
    var calendarEl = document.getElementById('calendar');
    var workTimeData = [];
    $.ajax({
    	url:"workTimeData",
    	async : false,	 //동기식
    	success:function(dataResult){
			    	for(i=0; i<dataResult.length; i++){
			    		workTimeData.push({
			    	          title: dataResult[i].EMPNAME,
			    	          start: dataResult[i].WORKSTART
			    		});	
			    	}

    	}
    });

    
/*=====================================
			캘린더 출력
=======================================*/
    var calendar = new FullCalendar.Calendar(calendarEl, {
		      editable: true,
		      locale: 'ko',
		      selectable: true,
		      businessHours: true,
		      dayMaxEvents: true, // allow "more" link when too many events
      		  events: workTimeData

    });//end of calendar = new FullCalendar
 
    calendar.render(); //캘런더 그리는 함수

    //초기에 현재날짜를 가져옴(캘린더를 그림과 동시에 날짜 데이터를 저장)***
    var month = calendar.getDate().getMonth()+1;
	var year = calendar.getDate().getFullYear();
	frmEmp.selectMonth.value=year+"-"+(month<10? '0'+month:month);
    
/*===============================================================================================
**********************************이전,다음달로 이동 이벤트 제이쿼리***********************************
=================================================================================================*/

	$('.fc-prev-button,.fc-next-button').on(
				'click',
				function() {
					var month = calendar.getDate().getMonth() + 1;
					var year = calendar.getDate().getFullYear();
					frmEmp.selectMonth.value = year + "-"
							+ (month < 10 ? '0' + month : month);

					autoList();
					autoSalry();
					allEmpSal();
				});

		empSel('${empSalaryList[0].empNum}');
	});

	/*==================================
	 사원 선택시 급여데이터load(empSel())
	 =======================================*/
	function empSel(empNum) {
		frmEmp.empNum.value = empNum;
		autoList();
		autoSalry();
		allEmpSal();
		
	}
</script>



<!--====================================
 HTML 캘린더 출력 div 
 =====================================-->
<div id='calendar' class="col-xl-8 fl mb-4" style="height: 700px;"></div>


<form id="frmEmp" name="frmEmp">
	<input type="hidden" name="empNum"> <input type="hidden" name="selectMonth">
</form>

<!--====================================
 받아온 데이터 출력 출근기록 및 근무시간
=====================================-->
<div class="col-xl-4 fl mb-4" style="">
	<h3 class="basic_tb_th_up">
		직원출근현황<span id="today"></span>
	</h3>
	<div style="height: 300px; overflow-y: auto; overflow-x: hidden;">
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th>근무요일</th>
					<th>근무날짜</th>
					<th>출근시간</th>
					<th>퇴근시간</th>
					<th>합계</th>
				</tr>
			</thead>
			<tbody id="empSETable">
			</tbody>
		</table>
	</div>
</div>
<!--====================================
 전직원 월급
=====================================-->
<div class="col-xl-4 fl mb-4">
	<h3 class="basic_tb_th_up">
		전 달 월급<span id="today"></span>
	</h3>
	<div style="height: 230px; overflow-y: auto; overflow-x: hidden;">
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th>직원 이름</th>
					<th>급여</th>
				</tr>
			</thead>
			<tbody id="allEmpSal">
			</tbody>
		</table>
	</div>
</div>

<!--====================================
시급 계산
=====================================-->
<div class="col-xl-4 fl mb-4">
	<table class="table">
		<thead class="thead-dark">
			<tr>
				<th>근무 총시간</th>
				<th>총 급여</th>
			</tr>
		</thead>
		<tbody id="totalSalary">
		</tbody>
	</table>
</div>


