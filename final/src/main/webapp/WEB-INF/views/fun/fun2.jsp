<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<style>
		#defaultContainerRowDiv2 {
			width: 70%;
			margin: 0 15%;
		}
	</style>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="../common/menubar.jsp"/>
	<script>
		// 메뉴바에 클릭된 메뉴 하이라이트
		$(()=>{ $(".nav-header #menubar_fun").addClass("active"); })
		$(()=>{ $(".nav-header #menubar_fun2").addClass("active"); })
	</script>

	<!-- 내용 -->
	<div id="fh5co-blog-section" class="fh5co-section-gray">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center heading-section">
					<h2>오늘 뭐 먹지?</h2>
					<h4>마우스로 선을 그려보세요!</h4>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-md-offset-4 text-center animate-box" id="defaultContainerRowDiv2">
					<iframe src="goGame" frameborder="0" width="700" height="500"></iframe>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>