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

		#made-testBody {
			width: 100%;
			border: 1px solid #000;
		}

		#made-testHead {
			width: 100%;
			height: 100px;
			border-bottom: 1px solid #000;
			font-size: 30px;
			padding-top: 35px;
		}

		#made-testContent {
			display: flex;
		}

		#made-testContent > div {
			width: 50%;
			padding: 20px;
		}

		#made-testContent > div > div {
			margin-bottom: 20px;
		}

		#made-testContentFirst {
			border-right: 1px solid #000;
		}

		.testQtitle {
			font-size: 20px;
		}
	</style>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="../common/menubar.jsp"/>
	<script>
		// 메뉴바에 클릭된 메뉴 하이라이트
		$(()=>{ $(".nav-header #menubar_fun").addClass("active"); })
		$(()=>{ $(".nav-header #menubar_fun1").addClass("active"); })
	</script>

	<!-- 내용 -->
	<div id="fh5co-blog-section" class="fh5co-section-gray">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center heading-section">
					<h2>연애고사</h2>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-md-offset-4 text-center animate-box" id="defaultContainerRowDiv2">
					<a href="javascript:void(0)" class="btn btn-primary btn-lg" id="default-btn">시험 치러 가기</a>

					<script>
						$(() => {
							$('#default-btn').on('click', () => {
								let content = '';
								let testNo = 1;
								$.ajax({
									url: "selectQuestion.test",
									data: {
										"coupleCode": 'DFGDFG5623SAD12',
										"email": 'user01@email.com',
									}, success: function(question) {
										for (let i in question) {
											$.ajax({
												url: "selectOption.test",
												data: {"qtestNo": testNo},
												success: function(option) {
													
												}, error: function() {
													console.log('ajax 통신 에러 : 보기 조회');
												}
											})
										}

										/*
											<div id="made-testBody">
												<div id="made-testHead">
													<div id="made-testTitle" align="center">유진 ❤️ 애신</div>
												</div>

												<div id="made-testContent">
													<div id="made-testContentFirst" class="testContent" align="left">
														<div id="made-testQ1" class="testQ">
															<div id="made-testQ1Title" class="testQtitle">
																Q1. 첫 만남 장소를 고르시오.
															</div>
															<div id="made-testQ1Content" class="testQcontent">
																<input type="radio" name="made-testQ1A" id="made-testQ1A1">
																<label for="made-testQ1A1">대학교 동아리</label> <br>
																<input type="radio" name="made-testQ1A" id="made-testQ1A2">
																<label for="made-testQ1A2">헌팅 포차</label> <br>
																<input type="radio" name="made-testQ1A" id="made-testQ1A3">
																<label for="made-testQ1A3">도서관</label> <br>
																<input type="radio" name="made-testQ1A" id="made-testQ1A4">
																<label for="made-testQ1A4">고등학교</label> <br>
															</div>
														</div>
													</div>
												</div>
											</div>

											<br><br>

											<a href="javascript:void(0)" class="btn btn-primary btn-lg" id="default-btn">채점하기</a>
										*/
									}, error: function() {
										console.log('ajax 통신 에러 : 질문 조회');
									}
								})

								$('#defaultContainerRowDiv2').html(content);
							});
						});
					</script>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>