<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<script>
	   
function goPointList() { 
	  var screenW = screen.availWidth;  // 스크린 가로사이즈
	  var screenH = screen.availHeight; // 스크린 세로사이즈
	  var popW = 600; // 띄울창의 가로사이즈
	  var popH = 600; // 띄울창의 세로사이즈
	  var posL=( screenW-popW ) / 2;   // 띄울창의 가로 
	  var posT=( screenH-popH ) / 2;   // 띄울창의 세로 포지션 	  
  window.open("./insertPo?phone=${phone}" , "_self", 'width='+ popW +',height='+ popH +',top='+ posT +',left='+ posL +',resizable=no,scrollbars=no');

	}	
	


$(function() {
	$("#btn2").click(function() {

        $('.show2').show();
        $('.show1').hide();
  		$('#btn2').addClass('btn_b');
  		$('#btn1').removeClass('btn_b');
	});
	
	$("#btn1").click(function() {

        $('.show1').show();
        $('.show2').hide();
    	$('#btn1').addClass('btn_b');
  		$('#btn2').removeClass('btn_b');

	});	
});
	
</script>

<div class="div_a">
	<button class="btn_a btn_b"  id="btn1">회원</button><button class="btn_a" id="btn2">비회원</button>
</div>

<div class="show1 row">
	<div class="div_error">
		${errorMsg}
	</div>
	<form action="insertPo"  method="post" class="frm_point">
	<table style="width: 100%; text-align: center;">
		<tr> 
			<th class="tbp_th">Phone</th>
			<td><input name="phone" class="point_input" size="30" ></td>
		</tr>
		<tr>
			<th class="tbp_th">pwd</th>
			<td><input name="pwd" class="point_input" size="30"></td>
		</tr>
		<tr>
			<td colspan="2" style="padding-top: 20px;"><button onclick="goPointList()" class="btn_point2" type="submit">적립</button></td>
		</tr>
	</table>		
		</form>
</div>
	
<div class="show2" style="display:none">
	<form action="insertMem" style="padding: 100px 100px 0px 100px; margin: auto;" method="post" >
	<input type="hidden" name="payNum" value="${payNum}">
	<table style="width: 100%; text-align: center;">
		<tr> 
			<th class="tbp_th">Phone</th>
			<td><input name="phone" class="point_input" size="30" ></td>
		</tr>
		<tr>
			<th class="tbp_th">pwd</th>
			<td><input name="pwd" class="point_input" size="30"></td>
		</tr>
		<tr>
			<th class="tbp_th">email</th>
			<td><input name="email" class="point_input" size="30"></td>
		</tr>
		<tr>
			<td colspan="2" style="padding-top: 20px;"><button onclick="goPointList()" class="btn_point2" type="submit">적립</button></td>
		</tr>
	</table>
	</form>
</div>


