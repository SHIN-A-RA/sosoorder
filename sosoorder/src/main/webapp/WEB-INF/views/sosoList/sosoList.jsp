<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>우리나라 대기정보</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-compat/3.0.0-alpha1/jquery.min.js"></script>
<script src="table.js"></script>
<link rel="stylesheet" href="table.css">
</head>
<body>
<h1></h1>

<div>
	<button onclick="updateTable();">대기정보 갱신</button>
</div>

<div class="error">
</div>

<table class="table">
	<thead>
	</thead>
	<tbody>
	</tbody>
</table>
</body>

<script>

$(function() {
	setInterval(updateTable, 10000);
});

function updateTable() {
	$.get('.apitest', {}, function(data) {
		drawTable(data);
	}, 'xmp');
}
function drawTable(data) {
	$('div.error').empty();
	var $xmp = $(data);
	var $table = $('.table');
	var $theadTr = "";
	$theadTr += "<tr>";
	$xmp.find('items > item:first-child ').children().each(function(index,node) {

		var colTitle = "";
		
		switch(node.tagName) {
		case "bizesNm" :
			colTitle = " "; break;
		case "signguNm":
			colTitle = " "; break;
		case "lnoAdr":
			colTitle = " "; break;
		default:
			colTitle = ""; break;
		}
		
		if (colTitle != "") {
			$theadTr += "<th>" + colTitle + "</th>";
		}
		
	});
	
	$theadTr += "</tr>";
	
	$table.find('thead').empty().append($theadTr);
	
	var $tbodyTr = "";
	
	$xml.find('items').children().each(function(index,node) {
	
		$tbodyTr += "<tr>";
	
		$item = $(node);
		
		$item.children().each(function(index,node) {
			
			if (node.tagName != "itemCode" && node.tagName != "dataGubun") {

				$tbodyTr += "<td>" + $(node).text().trim();
					
					$tbodyTr += "<br>" + state;
				}
				
				$tbodyTr += "</td>";
			
		$tbodyTr += "</tr>";
		
	});
	
	$table.find('tbody').empty().append($tbodyTr);
	
}
</script>
</html>