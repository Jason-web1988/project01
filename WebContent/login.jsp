<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script type="text/javascript" 
src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#join').on("click",function(){
		self.location ="join.jsp";
	});
	
	$('#login').on("click", function(){
		var emp = {empNo : $('#empNo').val(), passwd : $('#passwd').val()}; 
		
		if($('#empNo').val() == 0){
			alert("사원번호를 입력해주세요");
			return;
		}
		
		alert(emp.empNo + " " + emp.passwd);
		
		$.ajax({
			type: "post",
			url : "LoginHandler",
			cache : false,
			contentType : "application/json",
			data : JSON.stringify(emp),
			success : function(result, status, xhr){
				alert("result : " + result + ", "+ "status : " + status +", "+ "xhr : " + xhr);
				if (result){
					alert("로그인 성공" + result);
					window.location.href = "index.jsp";
				}else{
					alert("로그인 실패" + result);
				}
			}, error : function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
		
				
	});

});
</script>
</head>
<body>
	<fieldset>
	<legend>로그인</legend>
	<ul>
		<li>
			<label for="empNo">사원번호</label>
			<input id="empNo" type="number" name="empNo">
		</li>
		<li>
			<label for="passwd">비밀번호</label>
			<input id="passwd" type="password" name="password">
		</li>
		
			<button id="login">로그인</button>
			<button id="join">회원가입</button>
		
	</ul>
	</fieldset>
</body>
</html>