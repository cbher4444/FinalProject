<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://unpkg.com/@zegocloud/zego-uikit-prebuilt/zego-uikit-prebuilt.js"></script>

<style>
#face-btn {
	position: fixed;
	bottom: 40px;
	right: 10%;
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

#face-popup {
	display: none;
	width: 700px;
	height: 480px;
	background-color: #f1f1f1;
	border: 1px solid #888;
	position: fixed;
	bottom: 50px;
	right: 50px;
	z-index: 1200;
}
</style>
</head>
<body>
	<button type="button" id="face-btn">face</button>
	
	<script>
		$(document).ready(function() {

			// 채팅 버튼 클릭 시 팝업 창 띄우기
			$('#face-btn').click(function() {
				$('#face-btn').fadeOut();
				// AJAX 요청 예시
				$.ajax({
					url : 'faceTalk', // 서버로부터 데이터를 가져올 주소 (필요에 따라 변경)
					
					method : 'POST',
					success : function(response) {
						window.open("localhost:8444/final/faceTalkForm", "PopupWin", "width=500,height=600");
						$('#face-popup').fadeIn();
					},
					error : function() {
						alert('Failed to load chat window.');
					}
				});
			});

			// 팝업 닫기 버튼
			$('#close-popup').click(function() {
				$('#chat-popup').fadeOut();
				$('#chatting-btn').fadeIn();
			});

		});
	</script>

</body>
</html>