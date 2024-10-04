<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="mailForm" class="row justify-content-center">
    <div class="col-8">
        <div class="form-group">
            <label for="recipient">받는사람</label>
            <input name="email" type="email" class="form-control" id="recipient" placeholder="name@example.com">
        </div>
        <div class="form-group">
            <label for="title">제목</label>
            <input name="title" type="text" class="form-control" id="title" placeholder="메일제목">
        </div>
        <div class="form-group">
            <textarea name="contents" class="form-control" id="contents" rows="10"></textarea>
        </div>
        <button id="mailSend" class="btn btn-primary">보내기</button>
    </div>
</div>

<script type="text/javascript">

$(document).ready(function() {
	
	$(document).on('click', '#mailSend', function() {
		mailSend();
	});
	
});

function mailSend() {
	var recipient = $('#recipient').val();
	var title = $('#title').val();
	var contents = $('#contents').val();
	var regex = new RegExp("([!#-'*+/-9=?A-Z^-~-]+(\.[!#-'*+/-9=?A-Z^-~-]+)*|\"\(\[\]!#-[^-~ \t]|(\\[\t -~]))+\")@([!#-'*+/-9=?A-Z^-~-]+(\.[!#-'*+/-9=?A-Z^-~-]+)*|\[[\t -Z^-~]*])");
	
	if(!regex.test(recipient)) {
		alert("이메일 주소를 올바르게 입력해주세요.");
		return false;
	} else if(title.replace(/\s/g, "") == "") {
		alert("제목을 입력해주세요.");
		return false;
	} else if(contents.replace(/\s/g, "") == "") {
		alert("내용을 입력해주세요.");
		return false;
	}
	
	var params = {};
	
	params.recipient = $('#recipient').val();
	params.title = title;
	params.contents = contents;
	
	$.ajax({
	    method: "POST"
	    ,url: "/mailTest/send"
	    ,dataType : "json"
	    ,data: JSON.stringify(params)
	    ,contentType: "application/json; charset=UTF-8"
	    ,success: function(data){
	    	
	    	console.log(data);
	    	
	    }
	    ,error : function(jqXHR, textStatus, errorThrown){
	    	
	    	console.log("에러...");
	    	
	    }
	});
}


</script>

</body>
</html>