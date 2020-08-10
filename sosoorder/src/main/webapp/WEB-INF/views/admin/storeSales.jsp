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

<link rel="stylesheet" href="https://uicdn.toast.com/tui.chart/latest/tui-chart.min.css">
<!-- <script src="https://uicdn.toast.com/tui.chart/latest/tui-chart.min.js"></script>
<script src="resources/admin/scss/toastChart/tui-chart-all.min.js"></script> -->
 
  <!-- Page level plugins -->
   <script src="resources/admin/scss/sb/vendor/jquery/jquery.min.js"></script>
  <script src="resources/admin/scss/sb/vendor/chart.js/Chart.min.js"></script>
  

  <!-- Core plugin JavaScript-->
  
  <script src="resources/admin/scss/sb/vendor/jquery-easing/jquery.easing.min.js"></script>
   <script src="resources/admin/scss/sb/vendor/jquery/jquery.min.js"></script>
  <script src="resources/admin/scss/sb/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Custom scripts for all pages-->
  <script src="resources/admin/scss/sb/js/sb-admin-2.min.js"></script>
  
  
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
/* google.charts.load('current', {'packages':['line']});
google.charts.setOnLoadCallback(drawChart2);// chart 시작하자마자 그리기 */
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

    
/*     $(document).ready(function(){
    	yearSales=calendar.getDate().getFullYear();
    	monthSales=calendar.getDate().getFullYear()+"/"+(calendar.getDate().getMonth()+1);
    	drawChart(); 
    	}); */
    
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

</div>      
 <!-- ==================================
				New차트(달별)
====================================== -->
<!-- Pie Chart -->
            <div class="col-xl-4 col-lg-5">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">Revenue Sources</h6>
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
                  <div class="chart-pie pt-4 pb-2">
                    <canvas id="myPieChart"></canvas>
                  </div>
                </div>
              </div>
            </div>
<!-- Area Chart -->
            <div class="col-xl-8 col-lg-7">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">Earnings Overview</h6>
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
                    <canvas id="-----------------------------------------------------------------------------------------"></canvas>
                  </div>
                </div>
              </div>
            </div>

<script>
//Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

function number_format(number, decimals, dec_point, thousands_sep) {
  // *     example: number_format(1234.56, 2, ',', ' ');
  // *     return: '1 234,56'
  number = (number + '').replace(',', '').replace(' ', '');
  var n = !isFinite(+number) ? 0 : +number,
    prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
    sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
    dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
    s = '',
    toFixedFix = function(n, prec) {
      var k = Math.pow(10, prec);
      return '' + Math.round(n * k) / k;
    };
  // Fix for IE parseFloat(0.55).toFixed(0) = 0;
  s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
  if (s[0].length > 3) {
    s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
  }
  if ((s[1] || '').length < prec) {
    s[1] = s[1] || '';
    s[1] += new Array(prec - s[1].length + 1).join('0');
  }
  return s.join(dec);
}

// Area Chart Example
var categoriesData=[];
var seriesData=[];
	$.ajax({
		url : "getMonthTotal",
		async : false,
		success : function(result) {
			for(i=0; i<result.length; i++) {
				categoriesData.push(result[i].MONTH);
				seriesData.push(parseInt(result[i].MONTHTOTAL));
			}
		}
	});
var ctx = document.getElementById("myAreaChart");
var myLineChart = new Chart(ctx, {
  type: 'line',
  data: {
    labels: categoriesData,
    datasets: [{
      label: "Earnings",
      lineTension: 0.3,
      backgroundColor: "rgba(78, 115, 223, 0.05)",
      borderColor: "rgba(78, 115, 223, 1)",
      pointRadius: 3,
      pointBackgroundColor: "rgba(78, 115, 223, 1)",
      pointBorderColor: "rgba(78, 115, 223, 1)",
      pointHoverRadius: 3,
      pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
      pointHoverBorderColor: "rgba(78, 115, 223, 1)",
      pointHitRadius: 10,
      pointBorderWidth: 2,
      data: seriesData,
    }],
  },
  options: {
    maintainAspectRatio: false,
    layout: {
      padding: {
        left: 10,
        right: 25,
        top: 25,
        bottom: 0
      }
    },
    scales: {
      xAxes: [{
        time: {
          unit: 'date'
        },
        gridLines: {
          display: false,
          drawBorder: false
        },
        ticks: {
          maxTicksLimit: 7
        }
      }],
      yAxes: [{
        ticks: {
          maxTicksLimit: 5,
          padding: 10,
          // Include a dollar sign in the ticks
          callback: function(value, index, values) {
            return number_format(value) + '원' ;
          }
        },
        gridLines: {
          color: "rgb(234, 236, 244)",
          zeroLineColor: "rgb(234, 236, 244)",
          drawBorder: false,
          borderDash: [2],
          zeroLineBorderDash: [2]
        }
      }],
    },
    legend: {
      display: false
    },
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      titleMarginBottom: 10,
      titleFontColor: '#6e707e',
      titleFontSize: 14,
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      intersect: false,
      mode: 'index',
      caretPadding: 10,
      callbacks: {
        label: function(tooltipItem, chart) {
          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
          return datasetLabel + ': ' + number_format(tooltipItem.yLabel)+'원';
        }
      }
    }
  }
});
</script>