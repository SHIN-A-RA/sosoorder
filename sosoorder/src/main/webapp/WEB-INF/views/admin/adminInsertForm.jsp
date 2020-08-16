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
			}/* ,
			error : function(xhr, status, message) {
				alert(" status: " + status + " er:" + message);
			} */
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
				}/* ,
				error : function(xhr, status, message) {
					alert(" status: " + status + " er:" + message);
				} */
			});
		}
	</script>
 

<meta charset="UTF-8">
<div id="formWrapper">
	<div id="form">
		<div class="logo">
			<img src="${pageContext.request.contextPath}/resources/images/soso_icon.png" width="77%">
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



