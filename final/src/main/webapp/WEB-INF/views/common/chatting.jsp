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
	/* 레드 닷 스타일 추가 */
#chatting-btn.red-dot::after {
    content: '';
    position: absolute;
    top: -5px; /* 위치 조정 */
    right: -5px; /* 위치 조정 */
    width: 12px;
    height: 12px;
    background-color: red;
    border-radius: 50%;
    z-index: 1000;
}
	
	</style>

  


</head>
	
<body>
	<button type="button" id="chatting-btn" >chat</button>

<!-- 사각형 창 -->
<div id="chat-popup" align="center">
    <h2 id="chat-head-line">커플 채팅</h2>
    <button id="close-popup">X</button>
    <div id="messageArea"></div>
    <input type="hidden" id="email" name="email" value="${loginUser.email }" />
    <input type="hidden" id="userName" value="${loginUser.userName }" />
   	<input type="hidden" name="coupleCode" id="coupleCode" value="${loginUser.coupleCode}" />
    <input type="text" id="myChat" name="myChat"/>
    <button type="button" id="sendBtn" value="submit">전송</button>
    
</div>


<script>
function onMessage(msg) {
    var data = msg.data;
    
    // 메시지 출력
    $("#messageArea").append(data + "<br/>");
    
    // 팝업이 열려있지 않을 때만 레드 닷을 표시
    if ($('#chat-popup').css('display') === 'none') {
        $('#chatting-btn').addClass('red-dot'); // 레드 닷 추가
    }
}
</script>

<script>



$(document).ready(function() { 

    // 채팅 버튼 클릭 시 팝업 창 띄우기
    $('#chatting-btn').click(function() {
    	$('#chatting-btn').fadeOut();
    	 $('#chatting-btn').removeClass('red-dot');
        // AJAX 요청 예시
        $.ajax({
            url: 'chatbox',  // 서버로부터 데이터를 가져올 주소 (필요에 따라 변경)
            
            method: 'POST',
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
	$('#myChat').val('')
});

$('#myChat').keydown(function(event) {
	if (event.key === "Enter") { // Enter 키가 눌리면
		event.preventDefault(); // 기본 Enter 동작 방지 (줄바꿈 방지)
		sendMessage(); // 메시지 전송 함수 호출
		$('#myChat').val(''); // 입력 필드 초기화
	}
});

	let sock = new SockJS("http://localhost:8444/final/chat/");
	
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	
	function sendMessage(){
	    // userName과 message를 하나의 문자열로 묶기 (예: "userName: message")
	    let fullMessage = $("#userName").val() + ": " + $("#myChat").val();
	    
	    // 결합된 메시지를 한 번에 전송
	    sock.send(fullMessage);
	    
	    // 메시지 입력 필드 초기화
	    $('#myChat').val('');
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