<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="resources/admin/scss/addcss/login-signUp.js"></script>
<script src="resources/admin/scss/addcss/adminInsertValued.js"></script>
<link rel="stylesheet" type="text/css"
	href="resources/admin/scss/addcss/login-signUp.css" />

<link rel="stylesheet"
	href="//cdn.jsdelivr.net/gh/stove99/jquery-modal-sample@v1.4/css/animate.min.css" />
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/gh/stove99/jquery-modal-sample@v1.4/css/jquery.modal.css" />

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">

<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>

<script
	src="//cdn.jsdelivr.net/gh/stove99/jquery-modal-sample@v1.4/js/jquery.modal.js"></script>

<script
	src="//cdn.jsdelivr.net/gh/stove99/jquery-modal-sample@v1.4/js/modal.js"></script>

<!-- <script>
	//필수 입력 체크, 정규식
	function validCheck() {

		//StoreId
		var userIdCheck = RegExp(/^[A-Za-z0-9_\-]{5,20}$/);
		var storeId = userIdCheck.test(window.document.frm.storeId.value);
		if (window.document.frm.storeId.value == "" || storeId == false) {
			alert("아이디는 영어만 입력해주세요.(5~20자)");
			frm.storeId.focus();
			return;
		}

		//비밀번호
		var passwdCheck = RegExp(/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,16}$/);
		var storePwd = userIdCheck.test(window.document.frm.storePwd.value);
		if (window.document.frm.storePwd.value == "" || storePwd == false) {
			alert("비밀번호는 영문 대문자와 소문자, 숫자, 특수문자를 하나 이상 포함하여야 생성가능합니다.(8~16자)");
			frm.storeId.focus();
			return;
		}

		//계좌번호(숫자) + replace로 - 제거 해줘야함
		var regexp = /^[0-9]*$/;
		var accountNum = regexp.test(window.document.frm.accountNum.value);
		if (window.document.frm.accountNum.value == "" || accountNum == false) {
			alert("계좌번호는 숫자만 가능합니다");
			frm.accountNum.focus();
			return;
		}
		;

		//상호명(null체크만)
		if (window.document.frm.storeName.value == "") {
			alert("상호명을 입력해주세요");
			frm.storeName.focus();
			return;
		}

		//사업자번호(숫자) -> 소상공인 api 사용시 변경가능성 있음
		var regexp = /^[0-9]*$/;
		var storeNum = regexp.test(window.document.frm.storeNum.value);
		if (window.document.frm.storeNum.value == "" || storeNum == false) {
			alert("사업자번호는 숫자만 가능합니다");
			frm.storeNum.focus();
			return;
		}
		;

		if (window.document.frm.storeAddr.value == "") {
			alert("주소를 입력해주세요");
			frm.storeAddr.focus();
			return;
		}

		frm.submit();

	}

	function checkPwd() {
		var f1 = document.forms[0];
		var pw1 = f1.storePwd.value;
		var pw2 = f1.storePwd2.value;
		if (pw1 != pw2) {
			document.getElementById('checkPwd').style.color = "red";
			document.getElementById('checkPwd').innerHTML = "비밀번호 불일치";
		} else {
			document.getElementById('checkPwd').style.color = "green";
			document.getElementById('checkPwd').innerHTML = "비밀번호 일치";

		}
	}
</script>
<script>
	var idPass;
	var idRegex = /^[a-zA-Z0-9]{4,12}$/;
	$(document).ready(function() {
		//아이디 중복체크
		$('input[name=storeId]').blur(function() {
			var idCheck = $('input[name=storeId]').val();
			if (idRegex.test(idCheck)) {
				$.ajax({
					url : 'idCheck?storeId=' + idCheck,
					type : 'get',
					success : function(data) {
						var color;
						var ans;
						if (data > 0) {
							ans = '이미있는 아이디입니다.';
							color = 'red';
							idPass = false;
						} else {
							ans = '회원가입 가능한 아이디입니다.';
							color = 'green';
							idPass = true;
						}
						$('#temp').text(ans);
						$('#temp').css('color', color);
					}
				})
			}
		});
	});
</script>
 -->

<script>
	/* 
	 시군구 가져오는.
	 */
	function viewSigoongoo() {
		var sido = $('#rdnmcity1').val();
		$.ajax({
			url : 'getSiGoongooApi',
			type : 'GET',
			data : {
				name : sido
			},
			dataType : 'xml',
			/* 			    contentType: 'application/json; charset=utf8',
			 crossDomain:true,
			 */success : function(result) {
				
				$("#rdnmcounty1").empty();
				var sis = $(result).find('item');
				
				$.each(sis, function(idx, item) {
					//console.log($(item).children().eq(2).text());
					$("#rdnmcounty1").append(
							$("<option>").val($(item).children().eq(2).text())
									.text($(item).children().eq(3).text()))

				})
			},
			error : function(xhr, status, message) {
				alert(" status: " + status + " er:" + message);
			}
		});
	}
	/* function jsonCallback(e) {
	 alert(e)
	 //function(result) {
	 //console.log(result);
	 //$('#rdnmcity1').val(result);
	 //}
	 } */
</script>
	<script>
		/* 상호명, 업종,주소가져오는. */
		function viewData() {
			var data = $('#rdnmcounty1').val();
			var sido = $('#rdnmcity1').val();
			$.ajax({
				url : 'getDataApi',
				type : 'GET',
				data : {
					name : data
				},
				dataType : 'xml',
				success : function(result) {
					console.log(result);
					$("#tbody").empty();
					var sis = $(result).find('item');
					console.log(sis);
					$.each(sis, function(idx, item) {
						if( data==$(item).children().eq(13).text()){
							/* console.log($(item).children().eq(6).text())
							console.log($(item).children().eq(1).text())
							console.log($(item).children().eq(31).text()) */
						
						 $("<tr>").append($("<td>").text($(item).children().eq(6).text()))
						.append($("<td>").text($(item).children().eq(1).text()))
						.append($("<td>").text($(item).children().eq(31).text()))
						.appendTo('#tbody')
						} 
					})
					addrAdd();
				},
				error : function(xhr, status, message) {
					alert(" status: " + status + " er:" + message);
				}
			});
		}
	</script>
 

<meta charset="UTF-8">
<div id="formWrapper">
	<div id="form">
		<div class="logo">
			<svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg"
				xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
				viewBox="0 0 458.8 167.5" xml:space="preserve">
<g>
	<path
					d="M71.9,53.3c0,4,5.4,7.3,12,7.3c6.6,0,12-3.3,12-7.3c0-4.1-5.4-7.3-12-7.3C77.2,46,71.9,49.2,71.9,53.3z"></path>
	<path
					d="M429.8,113.5c13.2-2.7,25.7-18.7,25.7-32.8c0-4.2-1.3-7.9-3.8-10.9c-0.5-0.6-0.7-0.8-0.7-0.8v0
		c-0.6-0.7-1.3-1.1-2.1-1.1c-2.1,0-3.7,2.9-3.7,6.5c0,0.3,0,0.7,0.1,1c0,0,0,0,0,0c0,7-5,15.2-14.7,24.5c-5,4.9-9.9,8.9-12.9,11
		l0.8-4.2c1.7-8.1,3.4-16.4,5-24.8c1.7-8.4,3.3-16.3,4.7-23.7c1.5-7.4,2.9-14.2,4.2-20.2c1.2-6,2.2-10.8,2.8-14.1
		c0.3-1.9-0.3-3.1-1.8-3.6c-1.5-0.5-3.4-0.6-5.5-0.2c-2.2,0.4-4.2,1.3-6.1,2.7c-1.9,1.5-3,3.2-3.3,5.3c-0.3,1.7-1.1,5.9-2.4,12.6
		c-1.2,6.7-2.8,14.7-4.7,24c-1.9,9.3-4,19.2-6.1,29.7c-2.1,10.5-4.2,20.3-6.1,29.6c-0.5,2.4-1,4.8-1.5,7.1c0,0-0.1-0.1-0.1-0.1
		c-6.9,7.4-18.1,19.1-29.9,19.1c-6.2,0-7.5-7.5-7.5-13.1c0-1.5,0.2-2.9,0.2-4.3c27.8-11.1,42-21.8,43.7-48.6
		c-4.4-5.6-9.2-8.7-14.1-9.3c-20,0-42.5,27.1-45.7,52.4c-0.7,0.4-1.5,1.3-2.4,2.8c-2.9,5-6.1,9.2-9.6,12.6c-3.6,3.4-6.7,5.1-9.4,5.1
		c-1.3,0-2.1-0.4-2.6-1.1c-0.4-0.7-0.6-1.6-0.5-2.8c0.1-1.1,0.3-2.5,0.9-4.2c0.5-1.6,1-3.4,1.6-5.2c0.4-1.4,1.2-4,2.5-7.7
		c1.2-3.7,2.6-8,4.1-12.7c1.5-4.8,3.1-9.7,4.8-14.9c1.7-5.1,2.4-7.6,3.8-11.7h21.3c0.7,0,1.4-0.3,1.9-0.9c0.6-0.6,1.9-3.4,2.2-4.1
		c0.3-0.7,0.4-1.3,0.2-1.9c-0.1-0.6-0.6-0.9-1.3-0.9H340l5.6-14.4c0.6-1.4,0.3-2.3-0.9-2.7c-1.1-0.3-2.6-0.2-4.4,0.3
		c-1.8,0.6-3.6,1.5-5.3,2.8c-1.8,1.3-3,2.7-3.5,4.3l-3.9,9.7H319c-0.7,0-1.4,0.3-1.9,0.9c-0.6,0.6-1,1.2-1.3,1.9
		c-0.3,0.7-1.3,3.6-1.1,4.1c0.1,0.6,0.6,0.9,1.3,0.9h8.8c-1.2,3.3-1.5,4.9-2.9,9.2c-1.4,4.4-2.9,8.8-4.4,13.5
		c-1.5,4.6-3,9.2-4.5,13.7c-1.5,4.5-2.9,8.5-4.2,11.9c-0.9,2.4-1.7,5-2.5,7.7c-0.3,1-0.5,2-0.7,3c-2.2,1.6-4.2,2.4-6,2.4
		c-3,0-4.5-2-4.5-5.9c0-3.9,0.8-8.5,2.4-13.7c1.6-5.2,3.6-10.4,6.1-15.5c2.5-5.1,4.8-9,7-11.6c1.7-2,2.1-3.3,1.3-4.1
		c-0.9-0.7-2.2-1.3-4.1-1.7c-1.8-0.4-3.8-0.9-6-1.3c-2.1-0.4-3.7-1.4-4.7-3c2.3-2.6,4.1-5.1,5.6-7.5c1.1-2,1.8-4,2-6
		c0.2-2-0.7-3.6-2.7-4.7c-2.1-1.1-4.4-1-6.7,0.3c-2.4,1.4-4.4,3.3-6.1,5.8c-1.7,2.5-2.8,5.2-3.3,8.2c-0.5,3,0,5.6,1.6,7.7
		c-1.1,2.3-2.5,5.2-4.2,8.7c-1.6,3.5-3.3,7-5,10.5c-1.7,3.5-3.3,6.7-4.8,9.6c-1.5,2.9-11.7,22.4-12.4,23.7c-0.4,0.7-0.8,1.4-1,2
		c-1.4-2.2-3.2-5.6-3.2-11.2c0-17.2,13.9-36,21.9-55.1c-2-2.5-9.8-5.2-15.5-5.2c-7.4,7-10.8,16.5-12.8,21.9
		c-3.6,9.6-11.6,19.6-16,25.7c-9,12.3-13.4,17.7-16.7,19c-0.3-0.3-1.1-1.3-1.1-2.9c0-5.7,4.7-20.6,6.9-25.5
		c9.8-23.2,18.8-35.7,20.8-37.8c-3.3-3.8-10.8-5.1-14.6-5.1c-13.7,10-25.3,37.6-29.3,54.1c-1,4.6-1.3,7.9-1.3,13.9c0,0,0,0,0,0
		c-1.3,0.4-3,1.1-4.8,1.1c-2.4,0-3.8-1-3.8-5.6c0.2-15.5,16.5-41.5,20.4-54.5c-1.5-4.4-5.7-6.7-10.1-6.7
		c-12.4,0-28.6,19.3-49.9,48.4c1.5-9.2,18-33.4,20.1-42c-0.5-1.3-7.9-5.6-13.3-5.6c-14.1,0-36.3,31.6-48.7,49.1
		c2.5-18,17.2-31.4,21.4-44.8c-5.4-5.4-10-8-16-9.3c0,0,0,0,0,0c-0.8-0.1-1.6-0.2-2.3-0.2c-14.1,0-39.2,37.4-51.6,54.9
		c2.5-18,21.8-41,26.1-54.4c-5.4-5.4-10-8-16-9.3c-7.4,12.9-19.2,35.3-24.1,51.1c-2.6,8.3-4.1,16.7-4.3,21.9
		c1.1,5.9,2.6,10.6,8.3,14.7c2.3-1.5,7.9-11.1,15.9-22.4c12.3-17.2,34.2-41.3,39.6-43.9c0,0,0.9-0.9,2.5-2.1
		c-5.2,9.6-10,19.5-13.6,31.1c-2.6,8.3-4.1,16.7-4.3,21.9c1.1,5.9,2.6,10.6,8.3,14.7c2.3-1.5,7.8-11.1,15.9-22.4
		c12.3-17.2,29.1-36.8,35.8-37.1c-13.4,19.1-18.3,34.3-20.6,47.9c1.5,5.6,5.2,9.5,10,11.4c10.5-12.8,36.5-53.3,46.9-54.1
		c-4.3,9-13.2,23.7-13.2,38.6c0,9,3.3,16.5,13.6,16.5c5.1,0,9.3-2.2,13.4-5.3c3.4,5.4,10.5,8.6,16.1,8.8c1.5-0.2,4.3-2.1,7-5.1
		c3.6-4.3,15.4-21.1,17.2-20.9c-0.5,1.5-0.8,3.4-0.8,5.9c0,3.8,1.1,9.8,5.2,13.3c5.1,3.4,12.6,6.4,15.5,6.4c0,0,0,0,0.1,0
		c0.3,0,0.6-0.1,1-0.4c0.9-0.6,1.9-2.3,2.8-3.8c0.7-1.3,10.8-20.7,12.3-23.6c1.4-2.8,3-6,4.7-9.4c1.7-3.4,3.4-6.8,5-10.1
		c1.6-3.3,3-6,4-8.1c1.1,0.7,2.2,1.4,3.2,1.9c1,0.6,1.9,1,2.8,1.3c-1,1.3-2.4,3.6-4.3,7c-1.9,3.3-3.7,7.2-5.6,11.4s-3.5,8.7-5,13.4
		c-1.5,4.6-2.4,8.9-2.6,12.7c-0.2,3.9,0.4,7,1.8,9.5c1.4,2.5,4.1,3.7,8.2,3.7c2.7,0,5.7-0.9,9.1-2.6c2.4-1.2,4.7-2.7,6.9-4.4
		c0.2,1.4,0.7,2.6,1.4,3.7c1.1,1.5,3,2.2,5.9,2.2c2.7,0,5.7-0.9,9-2.6c3.3-1.7,6.5-3.9,9.6-6.6c3.1-2.7,6-5.7,8.4-8.9
		c1.6-2.1,3-4.1,4.1-6.1c0.7,12.3,9.4,21.9,23.8,23.5c8.8-2,19.4-9.1,28.4-19.3c-0.7,3.1-1.3,6-1.8,8.7c-1.4,6.5-2.2,10.4-2.6,11.8
		c-0.6,2.1-0.3,3.5,1.1,4.3c1.4,0.7,3.1,1,5,0.7c2-0.3,4-1,6.1-2.2c2-1.2,3.4-2.8,4.1-4.9c0.4-1.3,1.1-4.6,2.3-9.9
		c1.1-5.3,2.5-11.8,4-19.5l3.2-15.9c2.3,13.5,5.6,26.7,8.9,35.6c4.2,11.2,9.5,17.5,15.5,17.5c7.3,0,15-4.5,17-9
		C443.3,146.8,434.3,128.8,429.8,113.5z M392.6,89.2c-0.8,14.9-13.7,28.3-31.1,37C366.8,105.9,380.7,90.9,392.6,89.2z"></path>
	<path
					d="M70.9,26.4c8.6-1,104.7-7.5,113-7.5c4.7,0,13-18.9,3.3-18.9C184.8,0,90,6.7,80.4,7.6
		C63.1,9.2,38.3,11.5,21,11.5c-8.8,0-15.9-0.6-19.3-2.2c-1,2-1.8,5.5-1.8,7.5c0,8.4,5.9,15.1,16.3,15.1c7.7,0,17.7-1,28.7-2.4
		c-3.1,12.2-9.4,29.9-14.9,44.8C15.7,113.9,8.6,134.7,4.3,151c5.9,9.6,13,15.1,22,16.5c3.5-22.2,9.2-44.8,20.6-79.6
		C52.9,70,63.5,41.3,70.9,26.4z"></path>
</g>
</svg>
		</div>
		<form action="adminInsert" method="post" name="frm" id="frm">
			<div class="form-item">
				<!-- 가입시 영문 숫자(4,12)까지 허용 -->
				<p class="formLabel">사업자 아아디</p>
				<input type="text" name="storeId" id="storeId" class="form-style"
					autocomplete="off" /> <span id="temp"></span>
			</div>

			<div class="form-item">
				<p class="formLabel">비밀번호</p>
				<input type="password" name="storePwd" id="storePwd"
					class="form-style" autocomplete="off" onkeyup="checkPwd()" />
			</div>
			<div class="form-item">
				<p class="formLabel">비밀번호 확인</p>
				<input type="password" name="storePwd2" id="storePwd2"
					class="form-style" autocomplete="off" onkeyup="checkPwd()" />
				<p>
					<span id="checkPwd"></span>
				</p>
			</div>
			<div class="form-item row">
				<div class="col">
					<p class="formLabel">상호명</p>
					<input type="text" name="storeName" id="storeName"
						value="" class="form-style" autocomplete="off" />
				</div>

				<div class="col">
					<button type="button" name="storeNameSerch" id="myBtn"
						class="btn btn-secondary" data-toggle="modal"
						data-target="#myModal">찾기</button>
				</div>
				<script>
					// Get the modal
					//var modal = document.getElementById("myModal");

					// Get the button that opens the modal
					//var btn = document.getElementById("myBtn");
				</script>
				<!-- The Modal -->
				<div class="modal" id="myModal">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<!--여기에 adminNameSch.java 들어옴-->
						</div>
					</div>
				</div>
			</div>
			<script>
				//content사이에 adminnamesch 너어주는 쇼이벤트
				$('#myModal').on('shown.bs.modal', function() {
					$('.modal-content').load('adminNameSch')
				})
			

			</script>


			<!-- <script>
				//버튼 클릭 팝업
				$('#btn').click(function(event) {
					event.preventDefault();
					this.blur();

					$.popup({
						url : './adminNameSch.jsp',
						close : function(result) {
							console.log(result);
						}
					});
				});
			</script> -->
			<div class="form-item">
				<p class="formLabel">사업자번호</p>
				<input type="text" name="storeNum" id="storeNum" class="form-style"
					autocomplete="off" />
			</div>
			<div class="form-item">
				<p class="formLabel">사업장 주소</p>
				<input type="text" name="storeAddr" id="storeAddr"
					class="form-style" autocomplete="off" />
			</div>
			<div class="form-item">
				<p class="formLabel">계좌번호</p>
				<input type="text" name="accountNum" id="accountNum"
					class="form-style" autocomplete="off" />
			</div>
			<p></p>
			<button type="button" class="btn btn-success" onclick="validCheck()">가입완료</button>
		</form>
	</div>
</div>



