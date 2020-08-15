<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">

<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>

<script>
	// 모달을 닫는 <span> 요소를 가져옵니다.
	//var span = document.getElementsByClassName("close")[0];

	// 사용자가 버튼을 클릭하면 모달을 엽니다.
	//btn.onclick = function() {
		//modal.style.display = "block";
	//}

	// 사용자가 <span> (x)를 클릭하면 모달을 닫습니다.
	//span.onclick = function() {
	//	modal.style.display = "none";
	//}
	
	// 모달창 밖을 누르면 모달닫기
	//window.onclick = function(event) {
	//	if (event.target == modal) {
	//		modal.style.display = "none";
	// }
	//}
</script>


<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

/* Modal Content */
.modal-content {
	position: relative;
	background-color: #fefefe;
	margin: auto;
	padding: 0;
	border: 1px solid #888;
	width: 80%;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	-webkit-animation-name: animatetop;
	-webkit-animation-duration: 0.4s;
	animation-name: animatetop;
	animation-duration: 0.4s
}

/* Add Animation */
@
-webkit-keyframes animatetop {
	from {top: -300px;
	opacity: 0
}

to {
	top: 0;
	opacity: 1
}

}
@
keyframes animatetop {
	from {top: -300px;
	opacity: 0
}

to {
	top: 0;
	opacity: 1
}

}

/* The Close Button */
.close {
	color: white;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

.modal-header {
	background-color: #2A0A0A;
	color: white;
}

.modal-body {
	background-color:;
}

.modal-footer {
	background-color:;
	color: white;
}
</style>

<div class="modal-header">
	<header class="row">
		<h2 id="title_search_country"> 전국 소상공 업체 조회</h2>
		<button type="button" class="close" data-dismiss="modal"
			aria-label="Close">
			<span aria-hidden="true">&times;</span><!-- &times <--엑스모양 -->
		</button>

	</header>
</div>

<div class="modal-body" align="center">
	<h3 class="blind">주소검색</h3>
	<div class="address_area">
		<div class="sort_box row">
			<div class="col" align="center">
				<span class="label_set"> <label for="rdnmcity1"
					class="sr_only">시도</label> <select name="rdnmcity1" id="rdnmcity1"
					class="select" onchange="viewSigoongoo();" title="시도선택">
						<option value="" style="text-align: center;">::선택::</option>
						<option value="11" title="서울특별시">서울특별시</option>
						<option value="26" title="부산광역시">부산광역시</option>
						<option value="27" title="대구광역시">대구광역시</option>
						<option value="28" title="인천광역시">인천광역시</option>
						<option value="29" title="광주광역시">광주광역시</option>
						<option value="30" title="대전광역시">대전광역시</option>
						<option value="31" title="울산광역시">울산광역시</option>
						<option value="36" title="세종특별자치시">세종특별자치시</option>
						<option value="41" title="경기도">경기도</option>
						<option value="42" title="강원도">강원도</option>
						<option value="43" title="충청북도">충청북도</option>
						<option value="44" title="충청남도">충청남도</option>
						<option value="45" title="전라북도">전라북도</option>
						<option value="46" title="전라남도">전라남도</option>
						<option value="47" title="경상북도">경상북도</option>
						<option value="48" title="경상남도">경상남도</option>
						<option value="50" title="제주특별자치도">제주특별자치도</option>
				</select>
				</span>
			</div>
			<div class="col" align="center">
				<span class="label_set"> <label for="rdnmcounty1"
					class="sr_only">시군구</label>
					<select name="rdnmcounty1"
					id="rdnmcounty1" class="select" onchange="viewData();"
					title="시군구 선택">
						<option value="">::선택::</option>
				</select>
				</span>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<div id="apiList">
					<table id="table_id" class="display tb_style">
						<thead>
							<tr>
								<th>업종</th>
								<th>상호명</th>
								<th>주소</th>
							</tr>
						</thead>
						<tbody id="tbody">

						</tbody>
					</table>
				</div>
			</div>
		</div>
		
		<script>
		var col1 = '';
		var col2 = '';
		//console.log(col2);  
			function addrAdd() {
				//데이터테이블
				var otable = $('#table_id').DataTable({
					 searching: false,
		             paging: false,
		             info: false,
					 ordering:  false,
					 responsive: true
				});
				$('#table_id tbody').on('click', 'tr', function() {
					$().val($(this).find('td').eq(1).text());
					var col1 = $(this).find('td').eq(1).text();
					
					$('#table_id tbody tr').css("background", "none");
					$(this).css("background", "#f0f2fb");
					
					var data = otable.row(this).data();
					
					var col1 = data[1];
					var col2 = data[2];
					
					
					$('#SA').val(col1);
					$('#SS').val(col2);
					
					//col2 = col1;
				});
			};
			
		</script>
		
	

		<div class="complete_zone">
			<!-- <h4>- 선택 된 상호 명 -</h4> -->
			<input type="hidden" value="" name="SA" id="SA" readonly="readonly"
				title="상호명">
				<input type="hidden" value="" name="SS" id="SS" readonly="readonly" title="주소">
			<!-- <div id="menuExplain">※ 목록에서 상호명 클릭 후 선택버튼을 누르시면 회원가입 페이지(상호명)에
				입력됩니다.</div> -->
		</div>
	</div>
</div>
<script>
 $('#sbn').on('click', function() {
	 var col1 = $('#SA').val();
	 var col2 = $('#SS').val();
	$('#storeName').val(col1);
	$('#storeAddr').val(col2);
	
	//modal.Close;
	$('.close');
}) 


</script>

<div class="modal-footer">
	
		<button type="button" class="btn btn-primary btn-block" id="sbn" data-dismiss="modal">선택</button>
	
</div>

