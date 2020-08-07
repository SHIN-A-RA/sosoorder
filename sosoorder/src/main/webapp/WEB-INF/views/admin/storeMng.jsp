<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
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
<link rel="stylesheet" href="https://uicdn.toast.com/tui.chart/latest/tui-chart.min.css">
<script src="https://uicdn.toast.com/tui.chart/latest/tui-chart.min.js"></script>
<script src="resources/admin/scss/toastChart/tui-chart-all.min.js"></script>
<script>
	$(function(){
		var container = document.getElementById('chart-area');
		var series =[];		
		 $.ajax({
		          	url : "menuSalesChart",
		          	async : false, //동기식
		          	dataType: "json",
		          	success : function(result) {
		          		for(i=0; i<result.length; i++) {
		          			series.push( {name:result[i].MENUNAME,data: parseInt(result[i].ALLACOUNT)} );
		          		}
		          	}
		          });
		 console.log(series);
		var data = {
		    categories: ['Browser'],
		    series:series
		};
		var options = {
		    chart: {
		        width: 700,
		        height: 700,
		        title: '총 판매량',
		        format: function(value, chartType, areaType, valuetype, legendName) {
		            if (areaType === 'makingSeriesLabel') { // formatting at series area
		                value = value + '%';
		            }
		
		            return value;
		        }
		    },
		    series: {
		        radiusRange: ['40%', '100%'],
		        showLabel: true
		    },
		    tooltip: {
		        suffix: '%'
		    },
		    legend: {
		        align: 'bottom'
		    }
		};
		var theme = {
		    series: {
		        series: {
		            colors: [
		                '#83b14e', '#458a3f', '#295ba0', '#2a4175', '#289399',
		                '#289399', '#617178', '#8a9a9a', '#516f7d', '#dddddd'
		            ]
		        },
		        label: {
		            color: '#fff',
		            fontFamily: 'sans-serif'
		        }
		    }
		};
		
		// For apply theme
		
		tui.chart.registerTheme('myTheme', theme);
		options.theme = 'myTheme';
		
		tui.chart.pieChart(container, data, options);
		
	});
</script>
 
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

<!--====================================
		 차트 그리기
=====================================-->

    <div id="chart-area"></div>
    
<!--====================================
	top3메뉴 받아와서 출력(보내는 데이터x)
=====================================-->
<div style="height: 400px; width: 450px; overflow-y:auto;overflow-x:hidden;">
<h3 class="basic_tb_th_up">메뉴top3</span></h3>
<table class="table" >
	 <thead class="thead-dark">
      <tr>
        <th>메뉴이름</th>
        <th>가격</th>
        <th>총 판매량</th>
        <th>총 판매금액</th>
        <th>순위</th>
      </tr>
    </thead>
    <tbody id="menuSalesTalbe">
    </tbody>
</table>	
</div>
    
    