<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script>


	   
function goPointList() { 
	  var screenW = screen.availWidth;  // ��ũ�� ���λ�����
	  var screenH = screen.availHeight; // ��ũ�� ���λ�����
	  var popW = 600; // ���â�� ���λ�����
	  var popH = 600; // ���â�� ���λ�����
	  var posL=( screenW-popW ) / 2;   // ���â�� ���� ������ 
	  var posT=( screenH-popH ) / 2;   // ���â�� ���� ������ 
	  
  window.open("./insertPo?phone=${phone}" , "_self", 'width='+ popW +',height='+ popH +',top='+ posT +',left='+ posL +',resizable=no,scrollbars=no');

	}	



</script>

<div class="div_a">
	<button class="btn_a">ȸ��</button><button class="btn_a">��ȸ��</button>
</div>

<div>
	<form action="insertPo" class="frm_point" method="post">
	<table style="width: 100%; text-align: center;">
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
	

	<form action="insertMem" class="frm_point" style="display:none" method="post">
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