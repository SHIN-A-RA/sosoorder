<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<style>
#menuName {
	width: 500px;
}

#menuPrice {
	width: 500px;
}

#uploadFile {
	width: 500px;
}

#btn {
	display: inline-block;
	list-style: none;
	text-align: right;
	height: 100px;
	vertical-align: bottom;
	margin-top: 50px;
	border-bottom: 1px solid;
}

#un {
	text-decoration: underline;
}

#gear {
	position: relative;
	left: -15px;
}
</style>
<div>
	<h3 id="un">메뉴등록</h3>

</div>
<br>
<br>
<br>
<form action="menuInsert" method="post" name="menuInsert"
	id="menuInsert">
	<div class="row">
		<div class="col">
			<div class="input-group mb-3" id="menuName">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1">메뉴이름</span>
				</div>
				<input type="text" name="menuName1" id="menuName1"
					class="form-control" style="text-align: center;"
					placeholder="메뉴명을 입력바래요" aria-label="Username"
					aria-describedby="basic-addon1">
			</div>
		</div>
		<div class="col">
			<div class="input-group" style="width: 600px;">
				<div class="input-group-prepend">
					<span class="input-group-text">메뉴 카테고리</span>
				</div>
				<input type="text" class="form-control" name="menuCate"
					id="menuCate" style="text-align: center;"
					placeholder="추가하실 새로운 카테고리명을 적어주세요">
				<button>Enroll</button>
			</div>
		</div>
	</div>
	<br> <br>
	<div class="row">
		<div class="col">
			
				<div class="input-group-prepend">
					<span class="input-group-text">가격</span>
				</div>
				<input type="text" class="form-control"
					style="text-align: center;" placeholder="가격을 입력바래요"
					aria-label="Username" name="menuPrice" id="menuPrice"
					aria-describedby="basic-addon2">
		</div>
		<div class="col">
			<div class="input-group" style="width: 600px;">
				<div class="input-group-prepend">
					<span class="input-group-text">어드민 카테고리</span>
				</div>
				<input type="text" class="form-control" name="menuAdminCate"
					id="menuAdminCate" style="text-align: center;"
					placeholder="추가하실 새로운 카테고리명을 적어주세요">
				<button>Enroll</button>
			</div>
		</div>
	</div>
	<br> <br>
	<div class="row">
		<div class="col">
			<div class="input-group" id="uploadFile">
				<div class="custom-file">
					<input type="file" class="custom-file-input" id="inputGroupFile04"
						aria-describedby="inputGroupFileAddon04"> <label
						class="custom-file-label" style="text-align: left;"
						for="inputGroupFile04">이미지 선택</label>
				</div>
			</div>
		</div>
		<div class="col">
			<div class="input-group mb-3" id="menuContents">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon2">메뉴소개</span>
				</div>
				<textarea style="width: 600px; text-align: center;" class="DOC_TEXT"
					name="DOC_TEXT" placeholder="200자 이내로 적어주세요."></textarea>
			</div>
			<span style="color: #aaa;" id="counter">(0 / 최대 200자)</span>
		</div>
	</div>
	<script>
		//서류사항 textarea 체크
		$('.DOC_TEXT').keyup(function(e) {
			var content = $(this).val();
			$('#counter').html("(" + content.length + " / 최대 200자)"); //글자수 실시간 카운팅

			if (content.length > 200) {
				alert("최대 200자까지 입력 가능합니다.");
				$(this).val(content.substring(0, 200));
				$('#counter').html("(200 / 최대 200자)");
			}
		});
	</script>
	<br>
	<div class="col">
		<div class="input-group" id="gear">

			<span class="input-group-text">주/부 메뉴 코드</span> <select
				class="form-control" id="exampleFormControlSelect1">
				<option>0</option>
				<option>1</option>
			</select>

		</div>
	</div>
	</div>
</form>
<div class="col" id="btn">
	<button type="button" class="btn btn-primary">메뉴 등록</button>
	<button type="button" class="btn btn-primary">메뉴 삭제</button>
</div>