<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>
	
	<script>
	/* $(function(){
				
		$.ajax({
			url:"ajaxEmpList",
			dataType:"json",
			success:function(objs){
				for(i=0; i<objs.length; i++){
					$("#empList").append($("<div>").html(objs[i].employeeId + " : " + objs[i].firstName + " : " + objs[i].lastName));
				}
			}
		})	
	})
		 */
		 
		 $(function(){
				$('#table_id').DataTable(
					{ajax: {url:'ajaxEmpList', dataSrc:''},
						columns:[
							{data:"employeeId"},
							{data:"firstName"},
							{data:"lastName"}
					]});
			});
	</script>
	
	
	<div class="row">
		<div class="col">
			<div>목록</div>
			<div id="empList"></div>
			
			<table id="table_id" class="display">
			    <thead>
			        <tr>
			            <th>Column 1</th>
			            <th>Column 2</th>
			            <th>Column 3</th>
			        </tr>
			    </thead>
			</table>
		</div>
		<div class="col">
			<form>
				<div class="">
					<button class="btn btn-success fl">등록</button>
					<button class="btn btn-success">수정</button>
				</div>	
				<input type="text" name="firstName"><br>
				<input type="text" name="lastName">
			</form>
		</div>
	</div>
