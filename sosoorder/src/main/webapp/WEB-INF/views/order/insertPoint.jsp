<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<script>
	   
function goPointList() { 
	  var screenW = screen.availWidth;  // ��ũ�� ���λ�����
	  var screenH = screen.availHeight; // ��ũ�� ���λ�����
	  var popW = 600; // ���â�� ���λ�����
	  var popH = 600; // ���â�� ���λ�����
	  var posL=( screenW-popW ) / 2;   // ���â�� ���� 
	  var posT=( screenH-popH ) / 2;   // ���â�� ���� ������ 	  
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
	<button class="btn_a btn_b"  id="btn1">ȸ��</button><button class="btn_a" id="btn2">��ȸ��</button>
</div>

<div class="show1">
	<form action="insertPo" class="frm_point" method="post">
	<table style="width: 100%; text-align: center;" >
		<tr>
			<th class="tbp_th">Phone</th>
			<td><input name="phone" id="phone" class="point_input" size="30" >
			<input type="hidden" name="orderNum" value="${param.orderNum}">
			</td>
		</tr>
		<tr>
			<th class="tbp_th">pwd</th>
			<td><input name="pwd" class="point_input" size="30" ></td>
		</tr>
		<tr>
			<td colspan="2" class="pointd_td"><button class="btn_point2" type="submit">����</button></td>
		</tr>
	</table>
	</form>
</div>
	
<div class="show2" style="display:none">
	<form action="insertMem" class="frm_point" method="post" >
	<input type="hidden" name="orderNum" value="${param.orderNum}">
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
			<td colspan="2" class="pointd_td"><button onclick="goPointList()" class="btn_point2" type="submit">����</button></td>
		</tr>
	</table>
	</form>
</div>