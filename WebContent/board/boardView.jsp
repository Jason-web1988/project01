<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
<link rel="stylesheet" type="text/css" href="css/company.css">

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#list').on('click', function(){
		location.href="boardList.do";
	});
	
	$('#reg').on('click', function(){
		location.href="boardWrite.do"
	});
	
	$('#update').on('click', function(){
		open_win("boardCheckPassForm.do?num=${board.num}",'update')
	});
	
	$('#delete').on('click',function(){
		open_win("boardCheckPassForm.do?num=${board.num}",'delete')
	});
});

function open_win(url, name){
	window.open(url, name, "width=500, height=230");
}
</script>
</head>
<body>
<div id ="wrap" align="center">
	<h1>게시글 상세보기</h1>
	<table>
		<tr>
			<th>작성자</th>
			<td>${board.name }</td>
			<th>이메일</th>
			<td>${board.email }</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td><fmt:formatDate value="${board.writeDate }"/></td>
			<th>조회수</th>
			<td>${board.readCount }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="3">${board.title}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="3"><pre>${board.content }</pre></td>
		</tr>
	</table>
	<br><br>
	<input type="button" value="게시글 수정" id="update">
	<input type="button" value="게시글 삭제" id="delete">
	<input type="button" value="게시글 리스트" id="list">
	<input type="button" value="게시글 등록" id="reg">
</div>
</body>
</html>