<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원추가</title>
<script type="text/javascript" 
src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$.post("TitleListHandler", function(json){
	     var dataLength = json.length;
	     if ( dataLength >=1 ){
	         var sCont = "";
	         sCont += "<option value='' disabled selected hidden>직책을 선택하세요...</option>";
	         for ( i=0 ; i < dataLength ; i++){
	             sCont += "<option value=" + json[i].titleNo + ">" + json[i].titleName + "</>";
	         }
	         $("#title").append(sCont);   
	     }
	});
	 
	$.post("DeptListHandler", function(json){
	  	var dataLength = json.length;
		if (dataLength >= 1) {
		    var sCont = "<option value='' disabled selected hidden>부서를 선택하세요...</option>";
		    for (i = 0; i < dataLength; i++) {
		        sCont += "<option value=" + json[i].deptNo + ">"
		                + json[i].deptName + "</>";
		    }
		    $("#dept").append(sCont);
		}
	});

	var isEmpNoCheck = false;
	$('#empNoDupCheck').on("click", function(){
	    alert($('#empNo').val());
	    var emp = {empNo : $('#empNo').val()};
	    $.post("DuplicateEmpNoCheckHandler", emp, function(data){
	        if (data == 1){
	            alert("사용가능한 사원번호");
	            isEmpNoCheck = true;
	        }else{
	            alert("사원번호 중복");
	            $('#empNo').val('');
	            $('#empNo').focus();
	        }
	    });
	});
	
	$('#dept').on("change", function(){
		/* alert($('#dept').val()); */ 
		$("#manager").empty();
		 var dept = {deptNo : $('#dept').val()};
		$.get("EmpManagerListHandler", dept, function(json){
		    var dataLength = json.length;
	        if ( dataLength >=1 ){
	            var sCont = "";
	            for ( i=0 ; i < dataLength ; i++){
	                sCont += "<option value=" + json[i].empNo + ">" + json[i].empName + "</>";
	            }
	            $("#manager").append(sCont);   
	        }
		});
	});
	
	$('#cancel').on("click", function(){
	    window.location.href = "EmpListHandler";
	});
	
    $('#add').on("click", function() {
        if ($('#passwd').val() != $('#repasswd').val()){
            alert("비밀번호가 틀립니다.");
            $('#passwd').val('');
            $('#repasswd').val('');
            $('#passwd').focus();
            return;
        }
        if (!isEmpNoCheck){
            alert("중복체크 하세요");
            return;
        }
        
        //validCheck() 추가하기
        
        var newEmp = {
            empNo : $('#empNo').val(),
            empName : $('#empName').val(),
            title:{titleNo:$('#title').val()},
            manager:{empNo:$('#manager').val()},
            salary:$('#salary').val(),
            dept:{deptNo:$('#dept').val()},
            regDate:$('#regDate').val(),
            email:$('#email').val(),
            tel:$('#tel').val(),
            passwd:$('#passwd').val()
        };

        $.ajax({
            type : "post",
            url : "EmpAddHandler",
            cache : false,
            data : JSON.stringify(newEmp),
            complete : function(data) {
                alert("추가되었습니다." + data);
                alert("로그인 페이지로 이동합니다.")
                self.location = "login.jsp";;
            }
        });
    });
});
</script>
</head>
<body>
	<fieldset>
		<legend>사원추가</legend>
		<ul>
			<li>
				<label for="empNo">사원 번호</label>
				<input id="empNo" type="number" name="empNo">
				<button id="empNoDupCheck">중복체크</button>
			</li>
			<li>
				<label for="empName">사원명</label>
				<input id="empName" type="text" name="empName">
			</li>
			<li>
				<label for="dept">부서</label>
				<select id="dept"></select>
			</li>
			<li>
				<label for="manager">직속상사</label>
				<select id="manager"></select>
			</li>
			<li>
				<label for="title">직책</label>
				<select id="title"></select>
			</li>
			<li>
				<label for="salary">급여</label>
				<input id="salary" type="number" name="salary">
			</li>
			<li>
				<label for="regDate">입사일</label>
				<input id="regDate" type="date" name="regDate">
			</li>
			<li>
				<label for="email">이메일</label>
				<input id="email" type="email" name="email">
			</li>
			<li>
				<label for="tel">연락처</label>
				<input id="tel" type="tel" name="tel">
			</li>
			<li>
				<label for="passwd">비밀번호</label>
				<input id="passwd" type="password" name="passwd">
			</li>
			<li>
				<label for="repasswd">비밀번호 확인</label>
				<input id="repasswd" type="password" name="repasswd">
			</li>
			<li>
				<button id="add">추가</button>
				<button id="cancel">취소</button>
			</li>
		</ul>
	</fieldset>
</body>
</html>