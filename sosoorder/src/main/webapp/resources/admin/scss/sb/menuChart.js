	$(function(){
		var container = document.getElementById('menuChart');
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
		        width: 600,
		        height: 600,
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