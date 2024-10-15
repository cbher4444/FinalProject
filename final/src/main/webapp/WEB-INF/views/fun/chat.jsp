<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<body>
		<div id="made-textBox">
		</div>

		<script>
			$(() => {
				function chatUpdate() {
					let messages = []; // 메시지를 담을 배열
		
					$.ajax({
						url: "selectQlove.qna",
						data: {
							"coupleCode": '${ loginUser.coupleCode }',
							"email": '${ loginUser.email }',
						}, success: function(qData) {
							$.ajax({
								url: "selectAlove.qna",
								data: {
									"coupleCode": '${ loginUser.coupleCode }',
									"email": '${ loginUser.email }',
								}, success: function(aData) {
									if (Array.isArray(aData) && Array.isArray(qData)) {
										for (let i in qData) {
											let aiLoveContent = aData[i] && aData[i].aloveContent !== undefined 
																? aData[i].aloveContent 
																: '답변 준비 중...';
											
											// 메시지를 배열에 추가
											messages.push(`
												<div class="aiMsg">
													<div class="aiText">` + aiLoveContent + `</div>
												</div>
												<div class="userMsg">
													<div class="userText">` + qData[i].qloveContent + `</div>
												</div>
											`);
										}
		
										// 배열을 역순으로 정렬
										messages.reverse();
										$('#made-textBox').html(messages.join(''));
									} else {
										console.error("Received data is not an array", aData, qData);
									}
								}, error: function(jqXHR, textStatus, errorThrown) {
									console.error("AJAX Error: " + textStatus, errorThrown);
									console.log('Error Answer loading');
								}
							});
						}, error: function(jqXHR, textStatus, errorThrown) {
							console.error("AJAX Error: " + textStatus, errorThrown);
							console.log('Error Question loading');
						}
					});
				};
		
				chatUpdate();
		
				setInterval(function() {
					chatUpdate();
				}, 1000);
			});
		</script>
		
	</body>
</html>