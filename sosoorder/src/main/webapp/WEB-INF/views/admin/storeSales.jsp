<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!--========================
		스크롤Style
========================-->
<style>
  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }
  #calendar {
    max-width: 1100px;
    margin: 0 auto;
  }
.fc-view-harness{
display:none;
}
</style>

<!--========================
		링크,js
========================-->
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
<link href='resources/admin/scss/fullCalendar/main.css' rel='stylesheet' />

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script> <!-- 구글차트 -->
<script src='resources/admin/scss/fullCalendar/main.js'></script>
<script src='resources/admin/scss/fullCalendar/locales/ko.js'></script>
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>

 
  <!-- 차트 관련 -->
	<link rel="stylesheet" href="https://uicdn.toast.com/tui.chart/latest/tui-chart.min.css">
	<script src="resources/admin/scss/sb/vendor/jquery/jquery.min.js"></script>
	<script src="resources/admin/scss/sb/vendor/chart.js/Chart.min.js"></script>
	<script src="resources/admin/scss/sb/vendor/jquery-easing/jquery.easing.min.js"></script>
	<script src="resources/admin/scss/sb/vendor/jquery/jquery.min.js"></script>
	<script src="resources/admin/scss/sb/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="resources/admin/scss/sb/js/sb-admin-2.min.js"></script>
  
 <!-- Toast 차트 -->
	<link rel="stylesheet" href="https://uicdn.toast.com/tui.chart/latest/tui-chart.min.css">
	<script src="https://uicdn.toast.com/tui.chart/latest/tui-chart.min.js"></script>
	<script src="resources/admin/scss/toastChart/tui-chart-all.min.js"></script>
<script>
/* ================================================
	전역변수 사용
================================================ */
var yearSales ='';
var monthSales ='';
var daySales ='';


/* ================================================
	캘린더 생성
================================================ */	
  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      height: 'auto', // enough to active sticky headers
      locale: 'ko',
      initialView: 'dayGridMonth',
      nowIndicator: true,
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridDay'
      },
      
      navLinks: true, // can click day/week names to navigate views
      editable: true,
      selectable: true,
      selectMirror: true,
      dayMaxEvents: true, // allow "more" link when too many events
      events: []
    }); //end of calendar

    calendar.render();
   
	//전 달로 이동 버튼
    $('.fc-prev-button, .fc-next-button, .fc-dayGridMonth-button, .fc-timeGridMonth-button').on('click', function() {
    	if($('.fc-button-active').text() == '월'){	//월이면 년,월 데이터를 ajax로 보냄
    		yearSales=calendar.getDate().getFullYear();
    		monthSales=calendar.getDate().getFullYear()+"/"+(calendar.getDate().getMonth()+1);

    	}else{ 	//일이명 년, 월, 일 데이터를 ajax로 보냄
    		yearSales=calendar.getDate().getFullYear();
  			monthSales=calendar.getDate().getFullYear()+"/"+(calendar.getDate().getMonth()+1); 
  			daySales = calendar.getDate().getFullYear()+"/"+(calendar.getDate().getMonth()+1)+"/"+(calendar.getDate().getDay()+1);
    		}//일
    			ymdChart();
    });//end of 전달로 이동 Btn 	

     $(function(){
    	yearSales=calendar.getDate().getFullYear();
    	monthSales=calendar.getDate().getFullYear()+"/"+(calendar.getDate().getMonth()+1);
    	ymdChart(); 
    	});  
    
}); //end of addEventListener
</script>
<!-- ==================================
			Full Calender 출력 태그
====================================== -->
 <div id='calendar'></div>
 
 <!--===========================================
 				년월일 판매량 차트
 ============================================-->
            <div class="col-xl-4 col-lg-5">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">년/월/일 매출금</h6>
                  <div class="dropdown no-arrow">
                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                    </a>
                  </div>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                  <div class="chart-pie pt-4 pb-2">
                    <canvas id="ymdChart"></canvas>
                  </div>
                </div>
              </div>
            </div>
            
<!--===========================================
 				달 차트 출력
 ============================================-->
 <div class="col-xl-8 col-lg-7">
   <div class="card shadow mb-4">
     <!-- Card Header - Dropdown -->
     <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
       <h6 class="m-0 font-weight-bold text-primary">달 별 매출</h6>
       <div class="dropdown no-arrow">
         <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
           <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
         </a>
         <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
           <div class="dropdown-header">Dropdown Header:</div>
           <a class="dropdown-item" href="#">Action</a>
           <a class="dropdown-item" href="#">Another action</a>
           <div class="dropdown-divider"></div>
           <a class="dropdown-item" href="#">Something else here</a>
         </div>
       </div>
     </div>
     <!-- Card Body -->
     <div class="card-body">
       <div class="chart-area">
         <canvas id="monthLine"></canvas>
       </div>
     </div>
   </div>
 </div>
 
<!--===========================================
 				메뉴 분석 차트
 ============================================-->
 <div class="col-xl-8 col-lg-7">
   <div class="card shadow mb-4">
     <!-- Card Header - Dropdown -->
     <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
       <h6 class="m-0 font-weight-bold text-primary">메뉴 분석</h6>
       <div class="dropdown no-arrow">
         <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
           <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-800"></i>
         </a>
       </div>
     </div>
     <!-- Card Body -->
     <div class="card-body">
       <div class="chart-area2">
		<div id="menuChart"></div>
       </div>
     </div>
   </div>
 </div>
   
 <script>   
    
 /*===============================================
				메뉴 분석top3
 ===============================================*/
  	$(function menuSales(){
  		$.ajax({
 			url:"menuSales",
 			method: 'post'
 			}).done(function(topResult){
 				 var table = document.getElementById("menuSalesTalbe");
 				  table.innerHTML = "";
 				for(i=0; i<topResult.length; i++){
 					  var row = table.insertRow(0);
 					  var cell1 = row.insertCell(0);
 					  var cell2 = row.insertCell(1);
 					  var cell3 = row.insertCell(2);
 					  var cell4 = row.insertCell(3);
 					  var cell5 = row.insertCell(4);
 					  cell1.innerHTML = topResult[i].MENUNAME;
 					  cell2.innerHTML = topResult[i].MENUPRICE.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원";
 					  cell3.innerHTML = topResult[i].ALLACOUNT.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"개";
 					  cell4.innerHTML = topResult[i].SALESVALUES.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원";
 					  cell5.innerHTML = topResult[i].SALESRANK+"위";
 					  
 				}
 		})
  		.fail(function(topResult){}) //서버 에러 발생시
 		.always(function(topResult){}); //정상이든 에러든 무조건 실행
 }); 
</script>  
   
<!--===========================================
 메뉴 순위 테이블
 ============================================-->
 <div class="col-xl-8 col-lg-7">
   <div class="card shadow mb-4">
     <!-- Card Header - Dropdown -->
     <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
       <h6 class="m-0 font-weight-bold text-primary">메뉴별 판매 순위</h6>
       <div class="dropdown no-arrow">
         <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
           <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-800"></i>
         </a>
       </div>
     </div>
     <!-- Card Body -->
     <div class="card-body">
       <div class="chart-area2">
		<div class="table-responsive">
  <!--Table-->
  <table class="table">

    <!--Table head-->
    <thead>
      <tr>
        <th class="th-lg">메뉴이름</th>
        <th class="th-lg">가격</th>
        <th class="th-lg">총 판매량</th>
        <th class="th-lg">총 판매금액</th>
        <th class="th-lg">순위</th>
      </tr>
    </thead>
    <!--Table head-->

    <!--Table body-->
    <tbody id="menuSalesTalbe">
    </tbody>
    <!--Table body-->

  </table>
  <!--Table-->

</div>  
       </div>
     </div>
   </div>
 </div>
   
   
<!--=======================================================
 					년 월 일 차트 
 ========================================================-->
<script src="resources/admin/scss/sb/ymdChart.js"></script>

<!--=======================================================
 					메뉴분석 차트
 ========================================================-->
<script src="resources/admin/scss/sb/menuChart.js"></script>
<!--=======================================================
 					월(Line) 차트 
 ========================================================-->
<script src="resources/admin/scss/sb/areaChart.js"></script>


