<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
<link rel="stylesheet" type="text/css" href="css/company.css">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#check').on('click', function(){
		if($('#pass').val().length == 0){
			alert("비밀번호를 입력하세요.");
			return;
		}
		$('#frm').submit();
	});
});
</script>
</head>
<body>
<div align="center">
	<h1>비밀번호 확인</h1>
	<form action="boardCheckPass.do" id="frm" method="get">
		<input type="hidden" name="num" value="${param.num }">
		<table style="width:80%">
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pass" size="20" id="pass"></td>
			</tr>
		</table>
		<br>
		<input type="button" value=" 확 인" id="check">
		<br>
		<br>${message}
	</form>
	
</div>
</body>
</html>