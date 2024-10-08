<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<style>
		.bucket-img-list img{
			object-fit: cover;
			width: 265px;
			height: 265px;
			border-radius: 50%;
			margin-bottom: 20px;
		}

		.bucket-img-list .animate-box{
			margin-bottom: 20px;
		}
	</style>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="../common/menubar.jsp"/>
	<script>
		// 메뉴바에 클릭된 메뉴 하이라이트
		$(()=>{ $(".nav-header #menubar_plan").addClass("active"); })
		$(()=>{ $(".nav-header #menubar_bucket").addClass("active"); })
	</script>

	<!-- 메뉴 타이틀 -->
	<div id="fh5co-couple" class="fh5co-section-gray">
		<div class="container">
			<div class="row animate-box">
				<div class="col-md-8 col-md-offset-2">
					<div class="col-md-12 text-center heading-section">
						<h2>🌠 커플 버킷 리스트</h2>
					</div>
				</div>
			</div>
			<div class="row animate-box bucket-img-list" style="margin-bottom: 30px;">
				<div class="col-md-3 text-center animate-box">
					<div>
						<img src="https://cdn.getnews.co.kr/news/photo/201905/131489_105935_1009.jpg" class="img-responsive" alt="">
						<h4>몽골 별 보러가기</h4>
					</div>
				</div>
				<div class="col-md-3 text-center animate-box">
					<div>
						<img src="https://i.namu.wiki/i/Ly37hgjTsuT2ddZR7PfFDokzFLFG3NQxEowwDcTXfacRVN76wLukOUUshNM-tkys-mJwRyanAmyX0Sf5nzW9PQ.webp" class="img-responsive" alt="">
						<h4>그랜드캐니언 가보기</h4>
					</div>
				</div>
				<div class="col-md-3 text-center animate-box">
					<div>
						<img src="https://tourimage.interpark.com/BBS/Tour/FckUpload/201305/6350354111862154660.jpg" class="img-responsive" alt="">
						<h4>나이아가라 폭포 가보기</h4>
					</div>
				</div>
				<div class="col-md-3 text-center animate-box">
					<div>
						<img src="https://img.veenaworld.com/wp-content/uploads/2023/03/Experience-Irelands-Favourite-Travel-Destinations-the-Moher-Cliffs.jpg" class="img-responsive" alt="">
						<h4>모헤어 절벽 가보기</h4>
					</div>
				</div>
				<div class="col-md-3 text-center animate-box">
					<div>
						<img src="https://cdn.getnews.co.kr/news/photo/201905/131489_105935_1009.jpg" class="img-responsive" alt="">
						<h4>몽골 별 보러가기</h4>
					</div>
				</div>
				<div class="col-md-3 text-center animate-box">
					<div>
						<img src="https://i.namu.wiki/i/Ly37hgjTsuT2ddZR7PfFDokzFLFG3NQxEowwDcTXfacRVN76wLukOUUshNM-tkys-mJwRyanAmyX0Sf5nzW9PQ.webp" class="img-responsive" alt="">
						<h4>그랜드캐니언 가보기</h4>
					</div>
				</div>
				<div class="col-md-3 text-center animate-box">
					<div>
						<img src="https://tourimage.interpark.com/BBS/Tour/FckUpload/201305/6350354111862154660.jpg" class="img-responsive" alt="">
						<h4>나이아가라 폭포 가보기</h4>
					</div>
				</div>
				<div class="col-md-3 text-center animate-box">
					<div>
						<img src="https://img.veenaworld.com/wp-content/uploads/2023/03/Experience-Irelands-Favourite-Travel-Destinations-the-Moher-Cliffs.jpg" class="img-responsive" alt="">
						<h4>모헤어 절벽 가보기</h4>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>