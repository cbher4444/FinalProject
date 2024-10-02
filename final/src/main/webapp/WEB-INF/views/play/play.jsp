<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<style>
	
		.wedding-events:hover{
			transform:scale(1.1);
			transition: all .5s;
		}
		
		.wedding-events{
			transition: all .8s;
		}
		
		
	</style>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="../common/menubar.jsp"/>
	<script>
		// 메뉴바에 클릭된 메뉴 하이라이트
		$(()=>{ $(".nav-header #menubar_map").addClass("active"); })
	</script>

	<!-- 내용 -->
	<div id="fh5co-when-where" class="fh5co-section-gray">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
					<h2>Couple Play</h2>
				</div>
			</div>
			<div class="row row-bottom-padded-md">
				<div class="col-md-6 text-center animate-box">
					<div style="overflow:hidden;">
						<a href="movie">
							<div class="wedding-events">
								<div class="ceremony-bg" style="background-image: url(https://pimg.mk.co.kr/meet/neds/2021/11/image_readtop_2021_1079080_16371247144853257.jpg);"></div>
								<div class="desc">
									<h3>인기 영화 둘러보기</h3>
									<p><strong>Saturday, December 28, 2017, 4.00 PM - 5.00PM @ Boracay Beach</strong></p>
									<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
								</div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-md-6 text-center animate-box">
					<div style="overflow:hidden;">
						<a href="">
							<div class="wedding-events">
								<div class="ceremony-bg" style="background-image: url(resources/images/wed-party.jpg);"></div>
								<div class="desc">
									<h3>놀거리 추천 받기</h3>
									<p><strong>Saturday, December 28, 2017, 6.00 PM - 11.00PM @ Boracay Beach</strong></p>
									<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
								</div>
							</div>
						</a>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<!-- <div id="map" class="fh5co-map"></div> -->
				</div>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>