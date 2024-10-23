<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">

	<style>
		.pink-background{
			background-color: #F69D9D;
			padding: 10rem;
		}

		.pink-background h2{
			color : white;
			font-size: 50px;
		}

		.pink-background p{
			color : white;
			font-size: 24px;
		}

		.no-background{
			padding: 10rem;
		}

		.no-background h2{
			color:  #F69D9D;
			font-size: 50px;
		}

		.no-background p{
			font-size: 24px;
		}

		.couple-fun-img{
			height: 432px;
			overflow-y: hidden;
			object-fit: cover;
			object-position: center top;
		}
	</style>
</head>
<body>

	<!-- 메뉴바 위 메인사진 -->
	<jsp:include page="mainPicture.jsp"/>
	
	<!-- 메뉴바 -->
	<jsp:include page="../common/menubar.jsp"/>
	<script>
		// 메뉴바에 클릭된 메뉴 하이라이트
		$(()=>{ $(".nav-header #menubar_home").addClass("active"); })
	</script>

	<!-- 웰컴메시지 -->
	<div id="fh5co-couple" class="fh5co-section-gray" style="min-height: 0 !important;">
		<div class="container">
			<div class="row animate-box">
				<div class="col-md-8 col-md-offset-2">
					<div class="col-md-12 text-center heading-section" style="margin-bottom:0;">
						<h2>💕환영합니다💕</h2>
						<p style="font-size: 24px;">우리의 UsTwo는<br>연인간의 소중한 순간들을 더 특별하게 간직하고,<br>좋은 관계를 이어나가는데 도움이 될 만한 다양한 기능을 제공합니다.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 앨범 -->
	<div class="pink-background">
		<div class="container">
			<div class="row animate-box" style="margin-bottom: 10px;">
				<div class="col-md-7">
					<h2>📸 Couple Album</h2>
					<p>둘만의 특별한 순간들을 사진으로 보관해보세요.<br><br>
						"Couple Ablue"로 구글 포토와 연동하여 어디서든 접근!<br><br>
						"Couple Story"로 사진에 스토리를 넣어보세요.
					</p>
				</div>
				<div class="col-md-5">
					<img src="resources/images/homeGuest/album.png" alt="" width="100%">
				</div>
			</div>
			<div class="row animate-box">
				<div class="col-md-6">
					<img src="resources/images/homeGuest/story_list.png" alt="" width="100%">
				</div>
				<div class="col-md-6">
					<img src="resources/images/homeGuest/story_detail.png" alt="" width="100%">
				</div>
			</div>
		</div>
	</div>
	
	<!-- Play -->
	<div class="no-background">
		<div class="container">
			<div class="row animate-box" style="display: flex; position: relative;">
				<div class="col-md-6">
					<h2>Couple Play 🎬</h2>
					<p>뭐 볼지 고민인가요? <br>인기 영화 / 인기 TV프로그램 정주행은 어떠세요?</p>
					<img src="resources/images/homeGuest/movie_detail.png" alt="" width="100%" style="position: absolute; bottom: 0; left: 0;">
				</div>
				<div class="col-md-6">
					<img src="resources/images/homeGuest/movie_list.png" alt="" width="100%">
				</div>
			</div>
		</div>
	</div>

	<!-- Plan -->
	<div class="pink-background">
		<div class="container">
			<div class="row animate-box" style="display: flex; align-items: flex-start;">
				<div class="col-md-12" style="text-align: center;">
					<h2>📅 Couple Plan</h2>
				</div>
			</div>
			<div class="row animate-box">
				<div class="col-md-6">
					<img src="resources/images/homeGuest/calendar.png" alt="calendar" width="100%">
					<p>"커플 캘린더"로 일정을 공유하세요.<br>알림일을 설정하면 문자알림서비스도 이용가능합니다.</p>
				</div>
				<div class="col-md-6">
					<img src="resources/images/homeGuest/mindmap.png" alt="mindmap" width="100%">
					<p>"커플 마인드맵"으로 서로의 생각을 정리하고 공유해보세요.</p>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 예산관리 -->
	<div class="no-background">
		<div class="container">
			<div class="row animate-box" style="display: flex; align-items: center;">
				<div class="col-md-6">
					<img src="resources/images/homeGuest/budget.png" alt="" width="100%">
				</div>
				<div class="col-md-6" style="text-align:start;">
					<h2>Couple Budget💰</h2>
					<p>현실도 보아야 하니까!<br>우리 커플이 돈을 어디에 얼마나 쓰고 있을까요?</p>
					<p>지출을 카테고리별로 분석하여 어떤 부분에 가장 많은 비용이 드는지 한눈에 확인할 수 있어요.</p>
				</div>
			</div>
		</div>
	</div>

	<!-- Fun -->
	<div class="pink-background">
		<div class="container">
			<div class="row animate-box">
				<div class="col-md-12" style="text-align: center;">
					<h2>🎉 Couple Fun</h2>
				</div>
			</div>
			<div class="row animate-box" style="margin-bottom: 20px;">
				<div class="col-md-6">
					<img src="resources/images/homeGuest/dating_test.png" alt="dating_test" width="100%" class="couple-fun-img">
					<p>내 연애점수는? AI가 내준 연애고사로 내 점수를 알아보세요!</p>
				</div>
				<div class="col-md-6">
					<img src="resources/images/homeGuest/question.png" alt="question" width="100%" class="couple-fun-img">
					<p>매일 질문에 답하면서 서로에 대해 더 깊이 이해해보아요.</p>
				</div>
			</div>
			<div class="row animate-box">
				<div class="col-md-6">
					<img src="resources/images/homeGuest/consulting.png" alt="consulting" width="100%" class="couple-fun-img">
					<p>고민이 있으신가요? AI에게 연애상담을 받아보세요.</p>
				</div>
				<div class="col-md-6">
					<img src="resources/images/homeGuest/ladder.png" alt="ladder" width="100%" class="couple-fun-img">
					<p>뭐 먹을지 고민이라면? AI가 추천하는 색다른 음식 도전!</p>
				</div>
			</div>
		</div>
	</div>

	<!-- 메신저/화상채팅 -->
	<div class="no-background">
		<div class="container">
			<div class="row animate-box" style="display: flex; align-items: center;">
				<div class="col-md-8">
					<img src="https://contents-cdn.viewus.co.kr/image/2024/05/CP-2023-0021/image-7f6b0417-bfd0-4d72-98b6-d7b15f013b49.jpeg" alt="" width="100%">
				</div>
				<div class="col-md-4" style="text-align: start;">
					<h2>Messenger,<br>VidoeCall📱</h2>
					<p>메신저로 간편하게 연락하세요.<br>
						언제든지 화상채팅으로 더 깊은 대화를 나눌 수 있어요.</p>
				</div>
			</div>
		</div>
	</div>

	<!-- 리뷰 -->
	<div id="fh5co-started" style="background-image:url(https://images.unsplash.com/photo-1684895675307-1b1b1f9d8d56?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D);" data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
			<div class="container">
				<div class="row animate-box">
					<div class="col-md-8 col-md-offset-2 text-center heading-section">
						<h2>많은 커플들이 사용하고 있어요.👩‍❤️‍👨</h2>
						<p>"앱 다운받지 않고 웹으로 접근할 수 있어서 너무 좋아요!<br>SNS에 모든 사진을 올리니 좀 그랬는데, 우리만의 공간이 생겨서 너무 좋아요.<br>기능도 많고, 완전 강추!!👍" — 민지</p>
						<p>"가끔 심심할때 오늘의 질문 보는데, <br>오래 만나서 다 알았다고 생각했는데 아니였어요.😂 <br>서로 더 알아가는 계기가 되서 좋았어요. 추천합니다!" — 지혜</p>
						<p>"여자친구가 연애시험보라고 해서 써봤는데,<br>제가 부족한 면이 많네요. 많이 배우겠습니다ㅋㅋ<br>덕분에 여자친구랑 재밌는 시간보냈어요. 감사합니다~~🙏" — 정우</p>
						<br>
						<div style="display: flex; justify-content: center;">
							<button type="button" class="btn btn-primary btn-block" style="font-size: 30px; line-height: 30px; width: fit-content;" onclick="location.href='loginForm'">❤️ 지금 바로 시작하기! ❤️</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>
	
</body>
</html>