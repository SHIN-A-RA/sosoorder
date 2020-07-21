<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script type="text/javascript">
    
      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', '매출일짜');
        data.addColumn('number', '매출량');
        var chartdata = [];
        $.ajax({
        	url:"getChartData",
        	async : false,	 //동기식
        	success:function(result){
        	for(i=0; i<result.length; i++){
        		chartdata.push( [result[i].name, parseInt(result[i].cnt) ] );
        		}	
        	}
        });
        data.addRows(chartdata);

        // Set chart options
        var options = {'title':'날짜별 매출량',
                       'width':800,
                       'height':600,
                       colors: ['#9966CC', '#66CCFF', '#ec8f6e', '#f3b49f', '#f6c7b6']
                     /*   is3D: true,
                        vAxis: { format:'#,000%'}*/
                       };

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
        chart.draw(data, options);

//클릭 이벤트
        google.visualization.events.addListener(chart, 'select', selectHandler);
        function selectHandler(e) {
        	var row =chart.getSelection()[0].row
        	var row =chart.getSelection()[0].column
          alert(chart.getSelection());
        }
      }
    </script>