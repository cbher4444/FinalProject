<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>UsTwo</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
	<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
	<meta name="author" content="FREEHTML5.CO" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js" integrity="sha512-1QvjE7BtotQjkq8PxLeF6P46gEpBRXuskzIVgjFpekzFVF4yjRgrQvTG1MTOJ3yQgvTteKAcO7DSZI92+u/yZw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <!-- 
	//////////////////////////////////////////////////////

	FREE HTML5 TEMPLATE 
	DESIGNED & DEVELOPED by FREEHTML5.CO
		
	Website: 		http://freehtml5.co/
	Email: 			info@freehtml5.co
	Twitter: 		http://twitter.com/fh5co
	Facebook: 		https://www.facebook.com/fh5co

	//////////////////////////////////////////////////////
	 -->
<style>
		#chatting-btn { 
	    
	    position: fixed;
	    bottom: 40px;
	    right: 15%;
	    z-index: 999;
	    background-color: white;
	    border: 2px solid #dbdbdb;
	    outline: none;
	    cursor: pointer;
	    padding: 10px;
	    border-radius: 50%;
	    width: 50px;
	    height: 50px;
	    font-size: 13px;
	    font-weight: 500;
	    color: #333333;
	}
	
	#chat-popup{
	display:none;
	width: 300px;
	height: 550px;
	background-color: #f1f1f1;
	border: 1px solid #888;
	position: fixed;
	bottom: 50px;
	right: 50px;
	z-index: 1200;
	}
	#messageArea{
	width:270px;
	height:400px;
	border: 1px solid black;
	resize:none;
	}
	#close-popup{
	position:absolute;
	right:1px;
	top:5px;
	background-color:red;
	}
	#chat-head-line{
	margin-top: 10px;
	margin-left: 40px;
	}
	
	</style>

  


</head>
	
<body>
	<button id="chatting-btn" >chat</button>

<!-- 사각형 창 -->
<div id="chat-popup" align="center">
    <h2 id="chat-head-line">커플 채팅</h2>
    <button id="close-popup">X</button>
    <div id="messageArea"></div>
    <input type="hidden" id="userName" value="${loginUser.userName }" />
    <input type="text" id="message"/>
    <button type="button" id="sendBtn" value="submit">전송</button>
    
</div>


<script>

$(document).ready(function() { 

    // 채팅 버튼 클릭 시 팝업 창 띄우기
    $('#chatting-btn').click(function() {
    	$('#chatting-btn').fadeOut();
        // AJAX 요청 예시
        $.ajax({
            url: 'chatbox',  // 서버로부터 데이터를 가져올 주소 (필요에 따라 변경)
            method: 'GET',
            success: function(response) {
                // 응답 처리 후 팝업을 띄움
                $('#chat-popup').fadeIn();
            },
            error: function() {
                alert('Failed to load chat window.');
            }
        });
    });

    // 팝업 닫기 버튼
    $('#close-popup').click(function(){
        $('#chat-popup').fadeOut();
        $('#chatting-btn').fadeIn();
    });

});
</script>

<script>
$("#sendBtn").click(function(){
	sendMessage();
	$('#message').val('')
});

	let sock = new SockJS("http://localhost:8444/final/chat/");
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	
	function sendMessage(){
		sock.send($("#userName").val());
		sock.send($("#message").val());
		
	}
	
	function onMessage(msg){
		var data = msg.data;
		$("#messageArea").append(data + "<br/>")
	}
	
	function onClose(evt){
		$("#messageArea").append("연결끊김");
	}

</script>
	<!--  -->
</body>
</html>