<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<style>
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
		})
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
					<div id="made-coverDiv">
						<input type="text" name="q" id="made-q" placeholder="AI에게 질문을 해보세요~!" />
						<button id="made-btn" class="material-symbols-outlined">arrow_forward</button>
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