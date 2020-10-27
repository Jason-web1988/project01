<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서추가</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#add').on('click', function(){
		var newDept={
				deptNo : $('#deptNo').val(),
				deptName : $('#deptName').val(),
				floor : $('#floor').val()
		};
		$.ajax({
			type : "post",
			url : "DeptAddHandler",
			cache:false,
			data:JSON.stringify(newDept),
			complete:function(data){
				alert("추가되었습니다." + data)
				window.location.href="DeptListHandler";
			}
		});
	});
});
</script>
</head>
<body>
	<fieldset>
		<legend>부서추가</legend>
		<ul>
			<li>
				<label for="deptNo">부서번호</label>
				<input id="deptNo" type="number" value="${param.nextNo }" readonly="readonly">
			</li>
			<li>
				<label for="deptName">부서명</label>
				<input id="deptName" type="text" name="deptName">
			</li>
			<li>
				<label for="floor">위치</label>
				<input id="floor" type="text" name="floor">
			</li>
		</ul>
		<button id="add">추가</button>
		<button id="cancel">취소</button>
	</fieldset>
</body>
</html>