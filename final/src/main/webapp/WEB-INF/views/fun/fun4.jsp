<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<style>
		body * {
			box-sizing: border-box;
		}

		#made-coverDiv {
			display: flex;
			border-bottom: 1px solid #000;
		}
		#made-q {
			width: 100%;
			height: 30px;
			background-color: #ffffff00;
			border: none;
		}

		#made-q:focus {outline: none;}

		#made-btn {
			background-color: #ffffff00;
			border: none;
			font-size: 16px;
		}

		.userText, .aiText {
			border-radius: 20px;
			min-width: 50px;
			max-width: 90%;
			text-align: left;
			padding: 5px 10px;
			min-height: 30px;
			word-break: break-all;
			margin-bottom: 25px;
		}

		.userText {
			background-color: #f69d9d80;
		}

		.aiText {
			background-color: #fff;
		}

		.userMsg, .aiMsg {
			display: flex;
		}

		.userMsg {
			justify-content: end;
		}

		.aiMsg {
			justify-content: start;
		}

		.col-md-4 {
			width: 60% !important;
			margin: 0 20% !important;
		}

		#made-textBox {
			max-height: 500px;
			overflow:auto;
			margin-bottom: 10px;
			flex-direction: column-reverse;
			display: flex;
		}
	</style>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="../common/menubar.jsp"/>
	<script>
		// 메뉴바에 클릭된 메뉴 하이라이트
		$(()=>{ $(".nav-header #menubar_fun").addClass("active"); })
		$(()=>{ $(".nav-header #menubar_fun4").addClass("active"); })

		$(() => {
			$('#made-q').on('focus', () => {$('#made-q').attr('placeholder', '')});
			$('#made-q').on('blur', () => {
				if ($('#made-q').val() === '') {
					$('#made-q').attr('placeholder', 'AI에게 질문을 해보세요~!');
				}
			});

			$(document).on('keyup', function(event) {
				if (event.keyCode === 13) {
					callGemini();
				}
			})
		})

		function callGemini() {
			if ($('#made-q').val() === null || $('#made-q').val() === '') {
				alert('고민을 입력해주세요.');
			} else {
				let questionContent = $('#made-q').val();
				$('#made-q').val('');

				$.ajax({
					url: 'geminiQnA',
					data: {
						'prompt': questionContent,
						"coupleCode": 'DFGDFG5623SAD12',
						"email": 'user02@email.com',
					},
					success: function(result) {
						
					}, error: function(jqXHR, textStatus, errorThrown) {
						console.error("AJAX Error: " + textStatus, errorThrown);
						console.log('Error QnA')
					}
				});
			}
		}
	</script>

	<!-- 내용 -->
	<div id="fh5co-blog-section" class="fh5co-section-gray">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center heading-section">
					<h2>연애 상담 받기</h2>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-md-offset-4 text-center animate-box">
					<jsp:include page="chat.jsp" />
					<div id="made-coverDiv">
						<input type="text" name="q" id="made-q" placeholder="AI에게 질문을 해보세요~!" />
						<button id="made-btn" class="material-symbols-outlined" onclick="callGemini()">arrow_forward</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- fh5co-blog-section -->
	
	
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>