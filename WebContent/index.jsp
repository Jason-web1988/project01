<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="project01.ds.JndiDS" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터베이스 연동테스트</title>
</head>
<body>
 	<c:set var="con" value="${JndiDS.getConnection()}"></c:set>
	<c:out value="${con}"></c:out>
	<br><hr><br>
	
 	<a href="TitleListHandler"><b>직책 목록</b></a>
	
	<br><hr><br>
	
	<a href="DeptListHandler"><b>부서 목록</b></a>
	
	<br><hr><br>
	
	<a href="EmpListHandler"><b>직원 목록</b></a>
	
	<br><hr><br>
	
	<a href="boardList.do"><b>게시판</b></a>
</body>
</html>