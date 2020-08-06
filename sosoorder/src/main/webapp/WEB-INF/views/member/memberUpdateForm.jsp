<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<style>
#btn.dress {
	float: right;
}
</style>
<div>
	<h3 id="un">회원정보 수정</h3>
</div>
<br>
<br>
<br>
<form action="MemberUpdate" method="post"
	enctype="multipart/form-data" name="MemberUpdate"
	id="MemberUpdate">
	<input type="hidden" name="memberNum" value="${oneSm.memberNum}" />
	<div class="row">
		<div class="col">
			<div class="input-group mb-3" id="phone">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1">전화번호</span>
				</div>
				<input type="text" name="phone" class="form-control"
					style="text-align: center;" aria-label="phone"
					aria-describedby="basic-addon1" value="${oneSm.phone}">
			</div>
		</div>
		<div class="col">
			<div class="input-group" style="width: 600px;" id="delAddr">
				<div class="input-group-prepend">
					<span class="input-group-text">주소</span>
				</div>
				<input class="form-control selectmenu" name="delAddr" id="delAddr"
					style="text-align: center;" value="${oneSm.delAddr}">

			</div>
		</div>
	</div>
	
</form>