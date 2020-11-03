<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<link rel="stylesheet" type="text/css" href="css/company.css">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#list').on('click',function(){
		location.href = "boardList.do";
	});
	
	$('#reg').on("click", function(){
		var res = boardCheck();
		if(res){
			$('#frm').submit();
		}
	});
});

function boardCheck(){
	if(document.frm.name.value.length == 0){
		alert("작성자를 입력하세요.");
		return false;
	}
	if(document.frm.name.pass.value.length == 0){
		alert("비밀번호를 입력하세요.");
		return false;
	}
	if(document.frm.name.title.value.length ==0){
		alert("제목을 입력하세요.");
		return false;
	}
	return true;
}
</script>
</head>
<body>
<div id="wrap" align="center">
	<h1>게시글 수정</h1>
	<form name="frm" method="post" action="boardUpdate.do">
		<input type="hidden" name="num" value="${board.num }">
		<table>
			<tr>
				<th>작성자</th>
				<td><input type="text" size="12" name="name" value="${board.name }"> * 필수</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" size="12" name="pass">* 필수(게시물 수정 및 삭제 시 필수)</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="email" name="email" size="40" maxlength="50" value="${board.email }"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" size="70" name="title" value="${board.title }"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea cols="70" rows="15" name="content">${board.content }</textarea></td>
			</tr>
		</table>
		<br><br>
		<input type="submit" value="등록" id="reg">
		<input type="reset" value="다시 작성">
		<input type="button" value="목록" id="list">
	</form>
</div>
</body>
</html>