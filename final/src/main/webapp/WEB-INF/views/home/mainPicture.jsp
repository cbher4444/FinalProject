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

		<!-- 배경사진 -->
		<c:choose>
			<c:when test="${ empty loginUser }">
				<!-- case1. 로그인 전 -->
				<div class="fh5co-cover text-center" data-stellar-background-ratio="0.5" style="background-image: url(resources/images/cover_bg_1.jpg);">
			</c:when>
			<c:otherwise>
				<!-- case2. 로그인 후 -->
				<c:choose>
					<c:when test="${ empty couple.changeName }">
						<!-- 배경사진이 없는경우 -->
						<div class="fh5co-cover text-center" data-stellar-background-ratio="0.5" style='background-image: url(resources/images/main-default-bg-img.jpg);'>
					</c:when>
					<c:otherwise>
						<!-- 배경사진이 있는경우 -->
						<div class="fh5co-cover text-center" data-stellar-background-ratio="0.5" style='background-image: url("${ couple.changeName }");'>
					</c:otherwise>
				</c:choose>
			</c:otherwise>
		</c:choose>
			
			<!-- 배경사진 위 여러 텍스트 -->
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
										<h1>
											<c:choose>
												<c:when test="${ empty couple.sentence }">
													<!-- 커플문구가 없을경우 -->
													"이곳에 보일 커플문구를 설정해보세요."
												</c:when>
												<c:otherwise>
													${ couple.sentence }
												</c:otherwise>
											</c:choose>
										</h1>
										<h2>
											<c:choose>
												<c:when test="${ empty loginUser.nickName }">
													<!-- 닉네임이 없으면 그냥 이름 -->
													${ loginUser.userName }
												</c:when>
												<c:otherwise>
													${ loginUser.nickName }
												</c:otherwise>
											</c:choose>
											&amp;
											<c:choose>
												<c:when test="${ empty partner.nickName }">
													<!-- 닉네임이 없으면 그냥 이름 -->
													${ partner.userName }
												</c:when>
												<c:otherwise>
													${ partner.nickName }
												</c:otherwise>
											</c:choose>
										</h2>
										<p>
											<span>
												<c:choose>
													<c:when test="${ empty couple.startDate }">
														<!-- 만남시작일자가 없을경우 -->
														XXXX-XX-XX
													</c:when>
													<c:otherwise>
														${ couple.startDate }
													</c:otherwise>
												</c:choose>
											</span>
										</p>
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