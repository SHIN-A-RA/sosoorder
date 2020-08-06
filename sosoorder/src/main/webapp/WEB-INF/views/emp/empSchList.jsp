<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href='resources/admin/scss/fullCalendar/main.css' rel='stylesheet' />
<script src='resources/admin/scss/fullCalendar/main.js'></script>
<script src='resources/admin/scss/fullCalendar/locales/ko.js'></script>
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


<script>
var Now = new Date();
var NowTime = Now.getFullYear();
NowTime += '-' + (Now.getMonth() + 1) ;
NowTime += '-' + Now.getDate();


$(function workTimeData(){
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
//오늘 날짜 출력

//출근 버튼  
	$('#reloadTalbe').on("click",".workStart",function(){
		$(this).css("display","none");   
		$(this).next().css("display","block");
		var workStart = $(this).attr('data-empNum');
		$.ajax({
		url:"workStart",
		data : {'empNum':workStart},
		method: 'post'
		}).done(function(){
			autoList(NowTime);
			
			
			$('#today').html(NowTime);
			reloadTable();
		})
	});
    
//퇴근 버튼
	$('#reloadTalbe').on("click",".workEnd",function(){
		$(this).css("display","none");   
		$(this).prev().css("display","block");
		var workEnd = $(this).attr('data-empNum');
		$.ajax({
		url:"workEnd",
		data : {'empNum':workEnd},
		method: 'post'
		}).done(function(){
			autoList(NowTime);
			$('#today').html(NowTime);
			reloadTable();
			
		})
	});
	
	
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
	
	function reloadTable(){
		$('#reloadTalbe').load('reloadTable');
	};

	reloadTable();
	autoList(NowTime);//첫 실행시 오늘 날짜로 조회
	
	
});



</script>

<!-- 캘린더 출력 div -->
  <div id='calendar' style="float:left; height: 700px; width: 900px;"></div>

<!-- 출퇴근 버튼 table -->	
<div class="div_f">
	<h3 class="basic_tb_th_up">직원목록<span id="workingDate"></span></h3>
		<div id="reloadTalbe">
			<!-- 버튼이벤트에 따라 ajax로 가져옴 -->
		</div> 
</div>


<!-- 출퇴근 시간확인용 테이블 생성 -->
<div style="height: 400px; width: 450px; overflow-y:auto;overflow-x:hidden;">
<h3 class="basic_tb_th_up">직원출근현황<span id="today"></span></h3>
<table  class="table" >
	 <thead class="thead-dark">
      <tr>
        <th>직원이름</th>
        <th>출근시간</th>
        <th>퇴근시간</th>
      </tr>
    </thead>
    <tbody id="empSETable">
    </tbody>
</table>	
</div>
