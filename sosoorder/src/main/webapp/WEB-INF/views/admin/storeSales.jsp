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





<script>
/* ================================================
	전역변수 사용
================================================ */
var yearSales ='';
var monthSales ='';
var daySales ='';
/* ================================================
		api 한번만 실행
================================================ */
google.charts.load('current', {'packages':['bar']}); //chart 한번 load
google.charts.setOnLoadCallback(drawChart);// chart 시작하자마자 그리기
google.charts.load('current', {'packages':['line']});
google.charts.setOnLoadCallback(drawChart2);// chart 시작하자마자 그리기
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
    	drawChart();
    });//end of 전달로 이동 Btn 	

    
    $(document).ready(function(){
    	yearSales=calendar.getDate().getFullYear();
    	monthSales=calendar.getDate().getFullYear()+"/"+(calendar.getDate().getMonth()+1);
    	drawChart(); 
    	});
    
}); //end of addEventListener

 /*============================================================================
   	년/월/일CHART
 ============================================================================*/ 

      function drawChart() {
	      var chartdata =[];
	      chartdata.push( ['총 매출량', '년 매출', '월 매출', '일 매출' ]);
			        $.ajax({
		        	url : "salesData",
		        	async : false,
					data : {'yearSales':yearSales,'monthSales':monthSales,'daySales':daySales},
		        	success : function(result) {
		        		for(i=0; i<result.length; i++) {
		        			chartdata.push([' ',result[i].yearSales, result[i].monthSales,result[i].daySales =="undefined"? 0 : result[i].daySales]);
		        		}
		        	}
		        })
		var data = google.visualization.arrayToDataTable( chartdata );
			/*예제 데이터[' ', 1000, 400, 200]*/

       var options = {
          chart: {
            title: '년/월/일',
            subtitle: '',
          }
        };

        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
     
  	      yearSales ='';
   	      monthSales ='';
   	      daySales ='';
      }
/*============================================================================
    	END OF 년/월/일CHART
============================================================================*/


function drawChart2() {

    var data = new google.visualization.DataTable();
    data.addColumn('number', '달');
    data.addColumn('number', '달별 매출');
    var chartdata = [];
    $.ajax({
    	url : "getMonthTotal",
    	async : false,
    	success : function(result) {
    		for(i=0; i<result.length; i++) {
    			chartdata.push([parseInt(result[i].MONTH),parseInt(result[i].MONTHTOTAL)]);
    		}
    	}
    })
    data.addRows(chartdata);
    var options = {
      chart: {
        title: '달별 수익',
        subtitle: ''
      },
      width: 500,
      height: 350,
      axes: {
        x: {
          0: {side: 'top'}
        }
      }
    };

    var chart = new google.charts.Line(document.getElementById('line_top_x'));
    chart.draw(data, google.charts.Line.convertOptions(options));
  }
</script>

<!-- ==================================
			Full Calender
====================================== -->
 <div id='calendar'></div>
<div class="cal_wrap" style="overflow:hidden; width:100%">
<!-- ==================================
				차트1(년월일)
====================================== -->
<div id="columnchart_material" style="width: 49%; float:left; height: 300px;"></div>
 <!-- ==================================
				차트2(달별)
====================================== -->
<div id="line_top_x" style="width:49%; float:right;"></div>
</div>
