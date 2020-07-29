<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#un {
	text-decoration: underline;
}

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

<!-- 달력 -->
<link href='resources/admin/scss/fullCalendar/main.css' rel='stylesheet' />
<script src='resources/admin/scss/fullCalendar/main.js'></script>
<script src='resources/admin/scss/fullCalendar/locales/ko.js'></script>

<!-- 직원bar -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">

<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>


<!-- 직원 구분 Bar-->
<div class="slick_box menu_category">
	<div class="menu_bar">
		<c:forEach var="vo" items="${empSalaryList}">
		<div><a>${vo.empName}</a></div>
		</c:forEach>
	</div>
	
	<span class="prev" id="aro_prev1"><i class="fas fa-caret-left" aria-hidden="true"></i>
	</span> <span class="next" id="aro_next1"><i class="fa fa-caret-right" aria-hidden="true"></i></span>
</div>
<script>
$(function(){
	$('.menu_bar').on('click', function(){
		category = $(this).html();
		location.href = "storeMenuList?menuCategory=" + category;
	});
})
</script>
<script>
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
<!-- END OF 직원 Bar-->


<!-- 달력 출력 -->
<script>
var Now = new Date();
var NowTime = Now.getFullYear();
NowTime += '-' + (Now.getMonth() + 1) ;
NowTime += '-' + Now.getDate();

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
/* 		 	    	for(j=1; j<13; j++){
			   [{title: '월급날',start: '2020-'+j+'-10'}]
			    	}  */
    	}
    });
    
    var calendar = new FullCalendar.Calendar(calendarEl, {
      editable: true,
      locale: 'ko',
      selectable: true,
      businessHours: true,
      dayMaxEvents: true, // allow "more" link when too many events
      events: workTimeData,
      
      dateClick: function(info) {
    	  autoList(info.dateStr);
    	 $('#today').html(info.dateStr);
    	 
    			
    	  }//end of dateClick
    });//end of calendar = new FullCalendar
 
    calendar.render(); //캘런더 그리는 함수
    
	//직원 출퇴근 시간 List
	function autoList(selectDate){
		$.ajax({
			url: "getEmpAjax",
			method : 'post',
			data : {selectDate:selectDate},
			dataType: 'json'
			}).done(function(result){
			  var table = document.getElementById("empSETable");
			  table.innerHTML = "";
				for(i=0; i<result.length; i++){
					  var row = table.insertRow(0);
					  var cell1 = row.insertCell(0);
					  var cell2 = row.insertCell(1);
					  var cell3 = row.insertCell(2);
					  cell1.innerHTML = result[i].EMPNAME;
					  cell2.innerHTML = result[i].WORKSTART;
					  cell3.innerHTML = result[i].WORKEND;
					  
				}
			}) //정상실행		
			.fail(function(result){}) //서버 에러 발생시
			.always(function(result){}); //정상이든 에러든 무조건 실행
	}
}); 
</script>

<!-- 캘린더 출력 div -->
  <div id='calendar' style="float:left; height: 700px; width: 900px;"></div>


<!-- 출퇴근 시간확인용 테이블 생성 -->
<div style="height: 400px; width: 450px; overflow-y:auto;overflow-x:hidden;">
<h3 class="basic_tb_th_up">직원출근현황<span id="today"></span></h3>
<table  class="table" >
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



