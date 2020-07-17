<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="resources/admin/scss/hw.css" rel="stylesheet" type="text/css">

   <!-- 컨텐츠영역 -->

   <div class="div-tt">
       <h2>주문/결제</h2>
   </div>
    
  <div class="basic">  
		<table  class="basic_tb">		
			<tr>
			     <th class="basic_tb_th_up">주문메뉴</th>
			     <th class="basic_tb_th_up">수량</th>
			     <th class="basic_tb_th_up">가격</th>
			</tr>			
			<tr>
			      <td class="basic_tb_td_up">떡볶이</td>
			      <td class="basic_tb_td_up">1개</td>
			      <td class="basic_tb_td_up">10,000</td>
			      
			</tr>			
				<tr>
					<td class="basic_tb_td_down" colspan="3">총 추문금액: "#총주문값"</td>
				</tr>						
		</table>
</div>


<!-- 배달 체크시 펼치기-->
<div class="basic">
	<h5  style="margin-bottom:20px";>배달할거에요? <input type="checkbox"> 배달 주문시, 자동 회원가입 됩니다. </h5>
	<h3 class="basic_h3">배달정보</h3>
 <table class="basic_tb">
 <tr>
	<th class="basic_tb_th">주소
    </th>
         <td class="basic_tb_td">
             <input class="basic_input" id="" name="" fw-filter="isFill" fw-label="주문자 우편번호1"  placeholder="" size="6" maxlength="6" readonly="1" value="" type="text">  
             <a class="btn_post">우편번호</a><br>
             <input class="basic_input" id="" name="" fw-filter="isFill" fw-label="주문자 주소1"  placeholder="" size="60" readonly="1" value="" type="text"> <span class="txtInfo">기본주소</span><br>
             <input class="basic_input" id="" name="" fw-label="주문자 주소2"  size="60" value="" type="text"> <span class="txtInfo">나머지주소</span><span class="grid displaynone">(선택입력가능)</span>
         </td>
</tr>                         
<tr >
	<th class="basic_tb_th">휴대전화 <span class=""><img src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt="필수"></span>
	</th>
    <td class="basic_tb_td">
     <select class="basic_input" fw-label="주문자 핸드폰번호" > 
		<option value="010">010</option>
		<option value="011">011</option>
		<option value="016">016</option>
		<option value="017">017</option>
		<option value="018">018</option>
		<option value="019">019</option>
	</select>-<input class="basic_input"  maxlength="4" fw-label="주문자 핸드폰번호" size="4" value="" type="text">-<input class="basic_input" maxlength="4" fw-label="주문자 핸드폰번호"  size="4" value="" type="text"></td>
 </tr>
</table>
</div>

<!-- 할인 및 포인트 -->
<div class="basic">
	<h3 class="basic_h3">할인 및 포인트</h3>
 <table class="basic_tb">

	 <tr>
		<th class="basic_tb_th" >쿠폰할인</th>
	         <td class="basic_tb_td">
	             <div class="input_empty"><span>"$할인금액"</span></div><span>원</span><button class="btn_post">쿠폰사용</button>
	         </td>
	</tr>                         
	<tr>
		<th class="basic_tb_th">적립금 </th>
		    <td class="basic_tb_td" >
		    	<p><input class="basic_input">원<button class="btn_post">전액사용</button>
		    	(총 적립금:<strong>0</strong>원)</p>
		    	<ul class="ul_info">
					<li>- 적립금은 사용제한 없이 언제든 결제가 가능합니다.</li>                     
                </ul>
			</td>	    	

	</tr>
 </table>
</div>
<!-- 결제정보-->
<div class="basic">
	<h3 class="basic_h3">결제정보</h3>
	<table class="basic_tb">
		<tr>
			<th class="basic_tb_th2" >총 주문금액</th>
			<td class="basic_tb_td" ></td>
		<tr>
		<tr>
			<th class="basic_tb_th2" >쿠폰 할인금액</th>
			<td class="basic_tb_td" ></td>
		<tr>
		<tr>
			<th class="basic_tb_th2" >적립금 사용금액</th>
			<td class="basic_tb_td" ></td>
		<tr>
		<tr>
			<th class="basic_tb_th2" >총 결제금액</th>
			<td class="basic_tb_td" ></td>
		<tr>
		<tr>
			<th class="basic_tb_th2" >결제방법</th>
			<td class="basic_tb_td" >	
				<div class="type-selector-list-wrapper">
					<ul id="payTypeList" class="type-selector-list">

						<li id="rocketPayBox" class="type-selector-li">
							<input class="type-selector-radio" type="radio" name="payType" id="payType8" value="ROCKET_BANK">
							<label class="type-selector-label type-selector-label--bank" for="payType8" style="font-weight: normal;">
								<span class="type-selector-label__text">계좌이체</span>
							</label>
						</li>
							
						<li id="rocketPayCardBox" class="type-selector-li selected-pay-type">
							<input class="type-selector-radio" type="radio" name="payType" id="payType10" value="ROCKET_CARD">
							<label class="type-selector-label type-selector-label--card" for="payType10" style="font-weight: bold;">
								<span class="type-selector-label__text">신용/체크카드</span>
								<img class="rpay-badge rpay-icon-instant-discount" src="https://image7.coupangcdn.com/image/rocketpay/order/icon_ccid_v2.png" width="66" height="14" alt="즉시 할인혜택">
							</label>
						</li>
			
						<li id="virtualAccountPayBox" class="type-selector-li">
									<input class="type-selector-radio" type="radio" name="payType" id="payType7" value="VIRTUALACCOUNT">
									<label class="type-selector-label" for="payType7" style="font-weight: normal;">
										<span class="type-selector-label__text">현금</span>
									</label>
						</li>
					</ul>
					<p class="validate-message" style="display: none;"></p>
				</div>		
			</td>
		<tr>
	</table>
</div>

<!-- 결제하기 -->

<div class="div_pay">
<button class="btn_pay"><span class="txt_payment">결제하기</span></button>
</div>


            
   
    
    