<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	
</head>
<body>
	
	<!-- 메뉴바 위 메인사진 -->
	<div class="fh5co-hero" data-section="home"> 
		<div class="fh5co-overlay"></div>

		<c:choose>
			<c:when test="${ empty loginUser }">
				<!-- case1. 로그인 전 -->
				<div class="fh5co-cover text-center" data-stellar-background-ratio="0.5" style="background-image: url(resources/images/cover_bg_1.jpg);">
			</c:when>
			<c:otherwise>
				<!-- case2. 로그인 후 -->
				<div class="fh5co-cover text-center" data-stellar-background-ratio="0.5" style="background-image: url(https://mblogthumb-phinf.pstatic.net/MjAxODA5MjBfMTQy/MDAxNTM3Mzk2MDA1MDQz.lILFXdcSq5GuodvkJNjk9ho-GtDLY_h-exQ7CGx3p88g.X0_ojSPQY7Pw668XVETDQKNe7T7vVkJL1pcjEvt0FsYg.JPEG.zoomsee8616/1537395343581.jpg?type=w800);">
			</c:otherwise>
		</c:choose>

			<div class="display-t">
				<div class="display-tc">
					<div class="container">
						<div class="col-md-10 col-md-offset-1">
							<div class="animate-box">
								<c:choose>
									<c:when test="${ empty loginUser }">
										<!-- case1. 로그인 전 -->
										<h1>👩‍❤️‍👨우리 둘만의 특별한 공간, 함께 만드는 추억</h1>
										<h2>UsTwo</h2>
										<button type="button" class="btn btn-primary" style="font-size: 20px;" onclick="moveToLoginForm()">지금 바로 시작하기!</button>
									</c:when>
									<c:otherwise>
										<!-- case2. 로그인 후 -->
										<h1>"합시다, 러브. 나랑, 나랑 같이."</h1>
										<h2>유진 &amp; 애신</h2>
										<p><span>2018.07.07</span></p>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		function moveToLoginForm() {
			location.href="loginForm";
		}
	</script>

</body>
</html>