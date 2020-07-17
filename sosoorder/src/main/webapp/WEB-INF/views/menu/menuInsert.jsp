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
text-decoration:underline;
}


</style>
<div>
<h3 id="un">메뉴관리</h3>

</div><br><br><br>
<div class="row">
   <div class="col">
      <div class="input-group mb-3" id="menuName">
         <div class="input-group-prepend">
            <span class="input-group-text" id="basic-addon1">메뉴이름</span>
         </div>
         <input type="text" class="form-control" placeholder="메뉴명을 입력바래요"
            aria-label="Username" aria-describedby="basic-addon1">
      </div>
   </div>
   <div class="col">
      <div class="input-group">
         <div class="input-group-prepend">
            <span class="input-group-text">메뉴 카테고리</span>
         </div>
         <button class="btn btn-outline-secondary dropdown-toggle"
            type="button" data-toggle="dropdown" aria-haspopup="true"
            aria-expanded="false">필히 선택해주세요</button>
         <div class="dropdown-menu">
            <a class="dropdown-item" href="#">1번 메뉴 종류</a> <a
               class="dropdown-item" href="#">2번 메뉴 종류</a> <a
               class="dropdown-item" href="#">3번 메뉴 종류</a> <a
               class="dropdown-item" href="#">4번 메뉴 종류</a>
         </div>
         <input type="text" class="form-control"
            placeholder="추가하실 새로운 카테고리명을 적어주세요">
         <button>Enroll</button>
      </div>
   </div>
</div><br><br>
<div class="input-group mb-3" id="menuPrice">
   <div class="input-group-prepend">
      <span class="input-group-text" id="basic-addon2">가격</span>
   </div>
   <input type="text" class="form-control" placeholder="가격을 입력바래요"
      aria-label="Username" aria-describedby="basic-addon2">
</div><br><br>
<div class="input-group" id="uploadFile">
   <div class="custom-file">
      <input type="file" class="custom-file-input" id="inputGroupFile04"
         aria-describedby="inputGroupFileAddon04"> <label
         class="custom-file-label" for="inputGroupFile04">이미지 선택</label>
   </div>
</div><br><br>
<div class="col" id="btn">
   <button type="button" class="btn btn-primary">메뉴 등록</button>
   <button type="button" class="btn btn-primary">메뉴 삭제</button>
</div>