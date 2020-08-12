<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
　.solid {border:2px solid #F0F;}
</style>
<style> .centered {display: table;
    top: 50%;
    position: absolute;
    left: 50%;
    transform: translate(-50%, -50%);
    padding: 30px;
    background: #fff;
    box-sizing: border-box;
    border-radius: 11px;
    border: 1px solid #959595;
    overflow:hidden;'
} 
.top_bar{background:#ddd;
position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    margin: 0;
    height: 18px;
}
 </style>
<head><title></title>
<script src="https://cdn.ckeditor.com/ckeditor5/11.0.1/classic/ckeditor.js"></script>
</head>
<body>
<div class="centered">
<div class="top_bar"></div>
<div class="item">
  <h4>리-오더 보내기</h4>
    <form action="sendMailAttach.do" method="post"  enctype = "multipart/form-data" >
       <div align="center">
        <input type="text" name="frommail" size="100"  style="width: 100%" placeholder="보내는 사람 메일">
      </div>
      <div align="center">
        <!-- 제목 -->
        <input type="text" name="title" size="100" rows="30"
        style="width: 100%" placeholder="제목을 입력해주세요"
        class="form-control">
      </div>
        <!-- <p>
          <div align="center">
          내용
            <textarea name="contents" cols="120" rows="12"
            style="width: 100%; resize: none" placeholder="내용"
            class="form-control"></textarea>
          </div>
        <p> -->
     <textarea name="contents" id="editor" cols="120" rows="30"
            style="width: 100%; resize: none;" placeholder="내용" class="form-control"></textarea>
      <div align="center">
        <input type="submit" value="메일 보내기" class="btn btn-warning">
      </div>
         <div class="clear"></div>
            <div class="wr_box_wrap">
               <span class="wr_t">파일첨부</span>
               <div class="wr_c">
                    <div class="bo_w_flie write_div">
                       <div class="file_wr write_div">
                     <%--  // <img src="${pageContext.request.contextPath }${url }" style="width:150px"> --%>
                        <label for="file" class="lb_icon"><i class="fa fa-download" aria-hidden="true"></i></label>
                        <input type="file" name="UploadFile" id="filename" class="frm_file ">
                      
                       </div>
                  </div>
                  </div>
            </div>
    </form>
    </div> </div>
</body>
    <script>
    // 3. CKEditor5를 생성할 textarea 지정
    ClassicEditor
        .create( document.querySelector( '#editor' ),{
        	 removePlugins: [ 'ImageUpload' ]
        } )
        .catch( error => {
            console.error( error );
        } );
    </script> 
</html>
<!-- by 아라 -->