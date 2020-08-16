<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
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
<script src='resources/admin/scss/fullCalendar/main.js'></script>
<script src='resources/admin/scss/fullCalendar/locales/ko.js'></script>


<div class="div-tt">
   <h2>마감</h2>
</div><br>

 <div id='calendar'></div>
<form action="closeInfoUpdate">     
		 <div class="col">
	        <div class="div_f"  style="float:center; position: relative; left: 30px; top: 50px;">
	      			<div class="input-group" style="width: 200px; padding: 5px 1px 5px 1px;">
						<div class="input-group-prepend">
							<span class="input-group-text">총 판매액</span>
						</div>
							<input type="text" class="form-control" name="closeTotalSales" readonly="readonly"
							id="closeTotalSales" style="text-align: center;"/>
					</div>
			
			
				    <div class="input-group" style="width: 200px; padding: 5px 1px 5px 1px;">
						<div class="input-group-prepend">
							<span class="input-group-text">현금</span>
						</div>
							<input type="text" class="form-control" name="closeCash" readonly="readonly"
							id="closeCash" style="text-align: center;" />
					</div>
			
			
				    <div class="input-group" style="width: 200px; padding: 5px 1px 5px 1px;">
						<div class="input-group-prepend">
							<span class="input-group-text">카드</span>
						</div>
							<input type="text" class="form-control" name="closeCard" readonly="readonly"
							id="closeCard" style="text-align: center;" />
					</div>
			
			
				     <div class="input-group" style="width: 200px; padding: 5px 1px 5px 1px;">
						<div class="input-group-prepend">
							<span class="input-group-text">계좌이체</span>
						</div>
							<input type="text" class="form-control" name="closeAccount" readonly="readonly"
							id="closeAccount" style="text-align: center;" />
					</div>
			
			
				    <div class="input-group" style="width: 200px; padding: 5px 1px 5px 1px;">
						<div class="input-group-prepend">
							<span class="input-group-text">부가세액</span>
						</div>
							<input type="text" class="form-control" name="vat" readonly="readonly"
							id="vat" style="text-align: center;" />
					</div>
			
			
				     <div class="input-group" style="width: 200px; padding: 5px 1px 5px 1px;">
						<div class="input-group-prepend">
							<span class="input-group-text">순 매출액</span>
						</div>
							<input type="text" class="form-control" name="netSales" readonly="readonly"
							id="netSales" style="text-align: center;" />
					</div>
					
 				    <!-- <div class="input-group" style="width: 300px; padding: 5px 1px 5px 1px;">
						<div class="input-group-prepend">
							<span class="input-group-text">정산 후 준비금</span>
						</div>
							<input type="text" class="form-control" name="afterCash" readonly="readonly"
							id="afterCash" style="text-align: center;" />
					</div>  -->
					
				</div><!-- End of class="div_f " -->
			</div><!-- End of class="col" -->		
   	   </div><!-- End of class="modal-body" -->
      <div class="modal-footer">
        <button type="submit" class="btn btn-danger" >마감</button>
      </div>
   	   </form>
   	   
   	   
   	   
   	   
 <div class="col-xl-4 col-lg-7  fl">
   <div class="card shadow mb-4">
     <!-- Card Header - Dropdown -->
     <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
       <h6 class="m-0 font-weight-bold text-primary">판매된 메뉴</h6>
     </div>
     <!-- Card Body -->
     <div class="card-body">
       <div class="chart-area2">
		<div class="table-responsive">
  <!--Table-->
  <table class="table">

    <!--Table head-->
    <thead>
    </thead>
    <!--Table head-->

    <!--Table body-->
    <tbody id="closeMenu">
    </tbody>
    <!--Table body-->

  </table>
  <!--Table-->

</div>  
       </div>
     </div>
   </div>
 </div>   	   
 <script>
var Now = new Date();
var NowTime = Now.getFullYear();
NowTime += '-' + (Now.getMonth() + 1) ;
NowTime += '-' + Now.getDate();
/* ================================================
전역변수 사용
================================================ */
var storeDayData ='';
/* ================================================
캘린더 헤드 생성
================================================ */	
document.addEventListener('DOMContentLoaded', function() {
var calendarEl = document.getElementById('calendar');

var calendar = new FullCalendar.Calendar(calendarEl, {
  height: 'auto', // enough to active sticky headers
  locale: 'ko',
  initialView: 'timeGridDay',
  nowIndicator: true,
  headerToolbar: {
    left: 'prev,next today',
    center: 'title',
    right: 'timeGridDay'
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
storeDayData = calendar.getDate().getFullYear()+"/"+(calendar.getDate().getMonth()+1)+"/"+(calendar.getDate().getDate());
storeDay(storeDayData);


$('.fc-prev-button, .fc-next-button, .fc-dayGridMonth-button, .fc-timeGridMonth-button').on('click', function() {
	if($('.fc-button-active').text() == '월'){}
	else{
	storeDayData = calendar.getDate().getFullYear()+"/"+(calendar.getDate().getMonth()+1)+"/"+(calendar.getDate().getDate());
			storeDay(storeDayData);
			 closeMenu(storeDayData);
			/*  afterCash(closeCash) */
			
	}
});//end of 전달로 이동 Btn 	
function closeMenu(storeDayData){
	$.ajax({
		url: "closeMenu",
		dataType: 'json',
		async : false,
		data : {'storeDayData':storeDayData},
		success : function(result) {
		  var table = document.getElementById("closeMenu");
		  table.innerHTML = "";
			for(i=0; i<result.length; i++){
				  var row = table.insertRow(0);
				  var cell1 = row.insertCell(0);
				  var cell2 = row.insertCell(1);
				  cell1.innerHTML = result[i].MENUNAME;
				  cell2.innerHTML = result[i].ALLACOUNT;
				  
			}
		}
		}); //정상실행		
};



});
</script>  	   
<script>
function storeDay(storeDayData){
	$.ajax({
		url : "storeDay",
		async : false,
		data : {'storeDayData':storeDayData},
		success : function(result) {
			$('#closeTotalSales').val(result.closeTotalSales.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
			$('#closeAccount').val(result.closeAccount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
			$('#closeCash').val(result.closeCash.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
			$('#closeCard').val(result.closeCard.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
			$('#vat').val(result.vat.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
			$('#netSales').val(result.netSales.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
			
		}
	});
	storeDayData ='';
	};
	
	/*  function afterCash(closeCash){
		$.ajax({
			url : "afterCash",
			async : false,
			data : {'closeCash':closeCash},
			success : function(result){
				$('#afterCash').val(result.afterCash.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
			}
		});
	};  */
</script> 	   
   	   
   	   