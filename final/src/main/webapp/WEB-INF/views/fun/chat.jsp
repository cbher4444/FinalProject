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
				let value = '';

				$.ajax({
					url: "selectQlove.qna",
					data: {
						"coupleCode": 'DFGDFG5623SAD12',
						"email": 'user02@email.com',
					}, success: function(qData) {
						$.ajax({
							url: "selectAlove.qna",
							data: {
								"coupleCode": 'DFGDFG5623SAD12',
								"email": 'user02@email.com',
							}, success: function(aData) {
								for (let i in qData) {
									if (aData[i] === null) {
										value += `
											<div class="aiMsg">
												<div class="aiText">답변 준비 중...</div>
											</div>
											<div class="userMsg">
												<div class="userText">` + qData[i].qloveContent + `</div>
											</div>
										`;
									} else {
										value += `
											<div class="aiMsg">
												<div class="aiText">` + aData[i].aloveContent + `</div>
											</div>
											<div class="userMsg">
												<div class="userText">` + qData[i].qloveContent + `</div>
											</div>
										`;
									}
								}

								$('#made-textBox').html(value);
							}, error: function() {
								console.log("ajax 통신 오류(답변 로딩)")
							}
						});
					}, error: function() {
						console.log("ajax 통신 오류(질문 로딩)")
					}
				});
			};

			chatUpdate();

			setInterval(function() {
				chatUpdate();
			}, 100)
		});
	</script>
</body>
</html>