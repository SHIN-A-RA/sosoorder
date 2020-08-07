<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">

<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>

<script>
	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];

	// When the user clicks the button, open the modal 
	btn.onclick = function() {
		modal.style.display = "block";
	}

	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {
		modal.style.display = "none";
	}

	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
		}
	}
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
		<h2 id="title_search_country">전국 소상공 업체 조회</h2>
		<h2 class="close">&times;</h2>
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
					class="sr_only">시군구</label> <select name="rdnmcounty1"
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
	function() {
		
	function addrAdd() {
		//데이터테이블
		var otable = $('#table_id').DataTable({});
		$('#table_id tbody').on('click', 'tr', function() {
			$(.SA).val($(this).find('td').eq(1).text());
			var col1 = $(this).find('td').eq(1).text();
			//console.log(col1);
			//var data = otable.row(this).data();
			//var col1 = data[1];
			
			 //"adminNameSch?SA=" + col1
		}
		});
		});
	
</script> 


		<div class="complete_zone">
			<h4>- 선택 된 상호 명 -</h4>
			<input type="text" value="" name="SA" id="SA"
				readonly="readonly" title="도로명 조회 결과">
			<div id="menuExplain">※ 목록에서 상호명 클릭 후 선택버튼을 누르시면 회원가입 페이지(상호명)에
				입력됩니다.</div>
		</div>
	</div>
</div>
<div class="modal-footer row">
	<div class="col">
		<button id="search_country_Button" type="button"
			onclick="javascript:inputTxt();">선택</button>
	</div>
	<div class="col">
		<button type="button" class="js_dialog_close" onclick="">
			<span class="ir_wa">팝업닫기</span>
		</button>
	</div>
</div>

