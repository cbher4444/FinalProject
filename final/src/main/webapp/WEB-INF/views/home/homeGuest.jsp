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
	<div id="fh5co-couple" class="fh5co-section-gray">
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
			<div class="row animate-box" style="display: flex; align-items: center;">
				<div class="col-md-4" style="text-align: end;">
					<h2>📸 Couple Album</h2>
					<p>둘만의 특별한 순간들을 사진과 동영상으로 남기고, 시간별 혹은 주제별로 깔끔하게 정리된 앨범에서 다시 추억해보세요.</p>
					<p>"1년 전 오늘" 어떤 추억이 있었는지 확인할 수 있고, 사진에 댓글을 달아 서로의 감정을 나누며 소중한 기억을 더 깊이 새겨보아요.</p>
				</div>
				<div class="col-md-8">
					<img src="resources/images/homeGuest/album.png" alt="" width="100%">
				</div>
			</div>
		</div>
	</div>
	
	<!-- 지도 -->
	<div class="no-background">
		<div class="container">
			<div class="row animate-box" style="display: flex; align-items: center;">
				<div class="col-md-8">
					<img src="resources/images/homeGuest/map.png" alt="" width="100%">
				</div>
				<div class="col-md-4" style="text-align:start;">
					<h2>Couple Map 🗺️</h2>
					<p>실시간으로 서로의 위치를 확인해 어디서든 쉽게 만나고, 안전을 위해 위치를 공유할 수 있어요.</p>
					<p>함께했던 장소는 추억 마커로 저장하고, 가고 싶은 곳은 기록해 다음 데이트에 활용해보세요!</p>
				</div>
			</div>
		</div>
	</div>

	<!-- 캘린더 -->
	<div class="pink-background">
		<div class="container">
			<div class="row animate-box" style="display: flex; align-items: center;">
				<div class="col-md-4" style="text-align: end;">
					<h2>📅 Couple Plan</h2>
					<p>공유 캘린더로 기념일 및 일정을 공유하고,<br>기념일 알림문자를 통해<br>소중한 순간을 놓치지 않도록 도와줘요.</p>
					<p>함께 할 일 / 버킷리스트를 써보고,<br>하나하나 실행해보세요!</p>
				</div>
				<div class="col-md-8">
					<img src="resources/images/homeGuest/calendar.png" alt="" width="100%">
				</div>
			</div>
		</div>
	</div>
	
	<!-- 예산관리 -->
	<div class="no-background">
		<div class="container">
			<div class="row animate-box" style="display: flex; align-items: center;">
				<div class="col-md-8">
					<img src="resources/images/homeGuest/budget.png" alt="" width="100%">
				</div>
				<div class="col-md-4" style="text-align:start;">
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
			<div class="row animate-box" style="display: flex; align-items: center;">
				<div class="col-md-4" style="text-align: end;">
					<h2>🎉 Couple Fun</h2>
					<p>같이 무엇을 할지 고민인가요?<br>더 이상 걱정하지 마세요.</p>
					<p>커플연애고사 부터 커플랜덤퀴즈까지!<br>서로를 더 깊이 이해해보세요.</p>
					<p>우리 커플에게 맞는 활동을 찾아줄 기능도<br>준비되어 있어요😁</p>
				</div>
				<div class="col-md-8">
					<img src="resources/images/homeGuest/fun.png" alt="" width="100%">
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
					<h2>Messenger,<br>VidoeCall☎️</h2>
					<p>메신저로 간편하게 연락하세요.<br>이모티콘을 보내고, 음성 메시지, 이미지, 동영상도 간편하게 공유해보세요.</p>
					<p>언제든지 화상채팅으로 더 깊은 대화를 나눌 수 있어요.<br>두 사람만의 특별한 순간을 더욱 풍성하게 만들어보세요!</p>
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
						<p>"가고 싶은곳 지도에 표시해놓고 하나씩 같이 가보는 재미가 있습니다.<br>가끔 심심할때 커플 퀴즈 같은거 해보는데, <br>오래 만나서 다 알았다고 생각했는데 아니였어요.😂 <br>서로 더 알아가는 계기가 되서 좋았어요. 추천합니다!" — 지혜</p>
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