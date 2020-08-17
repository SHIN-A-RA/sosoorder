<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.modal-dialog2 {
  top: -10px;
  right: -10px;
  width: 700px;
  height: 1200px;
  color: #fff;
  line-height: 1.25;
  text-align: center;
  text-decoration: none;
  text-indent: 0;
  background: ;
  border: 2px solid #fff;
  -webkit-border-radius:  26px;
  -moz-border-radius:     26px;
  -o-border-radius:       26px;
  -ms-border-radius:      26px;
  -moz-box-shadow:    1px 1px 5px rgba(0,0,0,0.5);
  -webkit-box-shadow: 1px 1px 5px rgba(0,0,0,0.5);
  box-shadow:         1px 1px 5px rgba(0,0,0,0.5);
}
</style>
<script>
function sumCash(){
	var f1 = document.forms[0];
	var EtcCash=f1.EtcCash.value.replace("","0");
	var thousandWon= f1.thousandWon.value.replace("","0");
	var fiveThousandWon=f1.fiveThousandWon.value.replace("","0");
	var tenThousandWon=f1.tenThousandWon.value.replace("","0");
	var fiftyThousandWon=f1.fiftyThousandWon.value.replace("","0");
	var OneHundredThousandWon=f1.OneHundredThousandWon.value.replace("","0");
	

	EtcCash=parseInt(EtcCash);
	thousandWon= parseInt(thousandWon)*1000;
	fiveThousandWon=parseInt(fiveThousandWon)*5000;
	tenThousandWon=parseInt(tenThousandWon)*10000;
	fiftyThousandWon=parseInt(fiftyThousandWon)*50000;
	OneHundredThousandWon=parseInt(OneHundredThousandWon)*100000;
	
	var storeStartCash=(EtcCash+thousandWon+fiveThousandWon+tenThousandWon+fiftyThousandWon+OneHundredThousandWon).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	$('#storeStartCash').val(storeStartCash);
	 }
</script>
    <!-- 모달을 열기 위한 버튼 -->
<button type="button" class="btn btn-primary btn-lg" id="openModalBtn">
	개점 버튼(자동실행)
</button>

<!-- 모달 영역 -->
<div id="modalBox" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog2" role="document">
    <div class="modal-content2">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
        <h4 class="modal-title" id="myModalLabel">개점</h4>
      </div>
 <!-- ========================================================
 			    모달 내용 시작 "modal-body" 
========================================================== -->      
<form action="openInfoInsert">     
      <div class="modal-body">
		 <div class="col">
	        <div class="div_f"  style="float:center; position: relative; left: 30px; top: 50px;">
<!-- ==================================================================================================
 자바스크립트로 현재 날짜 시간 초 데이터를 가지고 삽입해야함 onclik 이벤트로 어떠한 시점에서 자동으로 시간이 입력되도록 설정
==================================================================================================== -->
					<div class="input-group" style="width: 400px; padding: 5px 1px 5px 1px;">
						<div class="input-group-prepend">
							<span class="input-group-text">개점 영업 일자</span> 
						</div>
						<input type="date" class="form-control" name="storeOpen" 
							id="storeOpen" style="text-align: center;" onkeyup="sumCash()"/>
							</div>
<!-- ==========================================================================================
 개점 시 시작하는 현금 받는 "text" value가 null일 경우 0값을 넣도록 짠다. 계산시 로직 단순화
============================================================================================== -->
					<div class="input-group" style="width: 200px; padding: 5px 1px 5px 1px;">
						<div class="input-group-prepend">
							<span class="input-group-text">십만원권</span>
						</div>
						<input type="text" class="form-control" name="OneHundredThousandWon"
							id="OneHundredThousandWon" style="text-align: center;" onkeyup="sumCash()"/>
					</div>
					
					<div class="input-group" style="width: 200px; padding: 5px 1px 5px 1px;">
						<div class="input-group-prepend">
							<span class="input-group-text">오만원권</span>
						</div>
						<input type="text" class="form-control" name="fiftyThousandWon"
							id="fiftyThousandWon" style="text-align: center;" onkeyup="sumCash()"/>
					</div>
					
					<div class="input-group" style="width: 200px; padding: 5px 1px 5px 1px;">
						<div class="input-group-prepend">
							<span class="input-group-text">만원권 </span>
						</div>
						<input type="text" class="form-control" name="tenThousandWon"
							id="tenThousandWon" style="text-align: center;" onkeyup="sumCash()"/>
					</div>
					
					<div class="input-group" style="width: 200px; padding: 5px 1px 5px 1px;">
						<div class="input-group-prepend">
							<span class="input-group-text">오천원권</span>
						</div>
						<input type="text" class="form-control" name="fiveThousandWon"
							id="fiveThousandWon" style="text-align: center;" onkeyup="sumCash()"/>
					</div>
					
					<div class="input-group" style="width: 200px; padding: 5px 1px 5px 1px;">
						<div class="input-group-prepend">
							<span class="input-group-text">천원권 </span>
						</div>
						<input type="text" class="form-control" name="thousandWon"
							id="thousandWon" style="text-align: center;" onkeyup="sumCash()"/>
					</div>
					
					<div class="input-group" style="width: 200px; padding: 5px 1px 5px 1px;">
						<div class="input-group-prepend">
							<span class="input-group-text">기타금액</span>
						</div>
						<input type="text" class="form-control" name="EtcCash"
							id="EtcCash" style="text-align: center;" onkeyup="sumCash()"/>
					</div>
		
					
					<div class="input-group" style="width: 300px; padding: 5px 1px 5px 1px;">
						<div class="input-group-prepend">
							<span class="input-group-text">개점 준비금</span>
						</div>
						<input type="text" class="form-control" name="storeStartCash"
							id="storeStartCash" style="text-align: center;" />
					</div>
			
					<div class="input-group" style="width: 200px; padding: 5px 1px 5px 1px;" >
						<div class="input-group-prepend">
							<span class="input-group-text">사업자 ID</span>
						</div>
						<input type="text" class="form-control" name="사업자 ID" readonly="readonly"
							id="사업자 ID" style="text-align: center;" value="${sessionScope.storeId}"/>
					</div>
				</div><!-- End of class="div_f " -->
			</div><!-- End of class="col" -->		
   	   </div><!-- End of class="modal-body" -->
      <div class="modal-footer">
		<button type="submit" class="btn btn-primary">확인</button>
        <button type="button" class="btn btn-default" id="closeModalBtn">취소</button>
      </div>
   	   </form>
    </div>
  </div>
</div>
<script>
  // 모달 안의 취소 버튼에 이벤트를 건다.
/* ==================================================================================================
페이지 메인으로 로그인 후 if문으로 storeID를 걸고 자동으로 모달이 실행 될 수 있도록 로직을 짠다.
====================================================================================================*/ 


$('#closeModalBtn').on('click', function(){
    $('#modalBox').modal('hide');
 });

$('#openModalBtn').on('click', function(){
	$('#modalBox').modal('show');
});

</script>


<script>
/* 시작시 바로  날짜 입력 */
var testDate = new Date();
$(function(){
	$('#storeOpen').val(testDate.toISOString().substring(0, 10));
});
</script>