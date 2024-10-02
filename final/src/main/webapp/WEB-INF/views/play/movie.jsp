<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UsTwo</title>
<link rel="stylesheet" href="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.css" />
    <script src="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style>
    	.swiper-slide a img{
    		width: 400px;
    		height: 400px;
    	}
    	
    	.swiper-prev{
    		position:relative;
    		top:-245px;
    		left:-100px;
    		display:inline;
    	}
    	
    	.swiper-next{
    		position:relative;
    		top:-245px;
    		right:-1200px;
    		display:inline;
    	}
    	
    	.material-icons{
    		color:#F69D9D;
    		font-size:30px;
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
	<div id="fh5co-guest">
		<div class="container">
			<div class="row animate-box">
				<div class="col-md-8 col-md-offset-2 text-center heading-section">
					<h2>인기 영화 둘러보기</h2>
				</div>
			</div>
			<div class="row row-bottom-padded-lg">
				<section class="movie swiper">
			            <div class="swiper-container">
			                <div class="swiper-wrapper">
			                    <div class="swiper-slide">
			                        <a href="">
			                            <img src="https://pimg.mk.co.kr/meet/neds/2021/11/image_readtop_2021_1079080_16371247144853257.jpg" alt="">
			                        </a>
			                        <p style="text-align:center; margin:0;">스파이더맨</p>
			                        <p style="text-align:center; margin:0;">2024.07.27</p>
			                    </div>
			                    <div class="swiper-slide">
			                        <a href="">
			                            <img src="https://pimg.mk.co.kr/meet/neds/2021/11/image_readtop_2021_1079080_16371247144853257.jpg" alt="">
			                        </a>
			                        <p style="text-align:center; margin:0;">스파이더맨</p>
			                        <p style="text-align:center; margin:0;">2024.07.27</p>
			                    </div>
			                    <div class="swiper-slide">
			                        <a href="">
			                            <img src="https://pimg.mk.co.kr/meet/neds/2021/11/image_readtop_2021_1079080_16371247144853257.jpg" alt="">
			                        </a>
			                        <p style="text-align:center; margin:0;">스파이더맨</p>
			                        <p style="text-align:center; margin:0;">2024.07.27</p>
			                    </div>
			                    <div class="swiper-slide">
			                        <a href="">
			                            <img src="https://pimg.mk.co.kr/meet/neds/2021/11/image_readtop_2021_1079080_16371247144853257.jpg" alt="">
			                        </a>
			                        <p style="text-align:center; margin:0;">스파이더맨</p>
			                        <p style="text-align:center; margin:0;">2024.07.27</p>
			                    </div>
			                </div>
			            </div>
			
			            
			            <div class="swiper-prev">
			                <div class="material-icons">arrow_back_ios</div>
			            </div>
			            <div class="swiper-next">
			                <div class="material-icons">arrow_forward_ios</div>
			            </div>
			  </section>
			</div>
			<div class="row animate-box">
				<div class="col-md-8 col-md-offset-2 text-center heading-section">
					<h2>OTT든 뭐든 보여드림</h2>
				</div>
			</div>
			<div class="row">
				<section class="ott swiper">
			            <div class="swiper-container">
			                <div class="swiper-wrapper">
			                    <div class="swiper-slide">
			                        <a href="">
			                            <img src="https://i.namu.wiki/i/HMgOJ9qu5qJn3YWIJe4ttQNI25P0uxJ6u6_zNaJhJYDF3vnypCBBOd0vrHyeeOzMYIkuJmcvu4RcpkqXp2EG2A.webp" alt="">
			                        </a>
			                        <p style="text-align:center; margin:0;">흑백요리사</p>
			                        <p style="text-align:center; margin:0;">2024.09.17</p>
			                    </div>
			                    <div class="swiper-slide">
			                        <a href="">
			                            <img src="https://i.namu.wiki/i/HMgOJ9qu5qJn3YWIJe4ttQNI25P0uxJ6u6_zNaJhJYDF3vnypCBBOd0vrHyeeOzMYIkuJmcvu4RcpkqXp2EG2A.webp" alt="">
			                        </a>
			                        <p style="text-align:center; margin:0;">흑백요리사</p>
			                        <p style="text-align:center; margin:0;">2024.09.17</p>
			                    </div>
			                    <div class="swiper-slide">
			                        <a href="">
			                            <img src="https://i.namu.wiki/i/HMgOJ9qu5qJn3YWIJe4ttQNI25P0uxJ6u6_zNaJhJYDF3vnypCBBOd0vrHyeeOzMYIkuJmcvu4RcpkqXp2EG2A.webp" alt="">
			                        </a>
			                        <p style="text-align:center; margin:0;">흑백요리사</p>
			                        <p style="text-align:center; margin:0;">2024.09.17</p>
			                    </div>
			                    <div class="swiper-slide">
			                        <a href="">
			                            <img src="https://i.namu.wiki/i/HMgOJ9qu5qJn3YWIJe4ttQNI25P0uxJ6u6_zNaJhJYDF3vnypCBBOd0vrHyeeOzMYIkuJmcvu4RcpkqXp2EG2A.webp" alt="">
			                        </a>
			                        <p style="text-align:center; margin:0;">흑백요리사</p>
			                        <p style="text-align:center; margin:0;">2024.09.17</p>
			                    </div>
			                </div>
			            </div>
			
			            
			            <div class="swiper-prev">
			                <div class="material-icons">arrow_back_ios</div>
			            </div>
			            <div class="swiper-next">
			                <div class="material-icons">arrow_forward_ios</div>
			            </div>
			  </section>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>

	<script>
	 new Swiper('.movie.swiper .swiper-container',{
	        slidesPerView: 3, // 한번에 보여줄 슬라이드 개수
	        spaceBetween: 20, // 슬라이드 사이 여백
	        // 1번 슬라이드가 가운데 보이기
	        loop:true,
	        // autoplay: {
	        //     delay : 5000,
	        // },
	        navigation : {
	            prevEl : '.movie .swiper-prev',
	            nextEl : '.movie .swiper-next',
	        },
	        effect: 'coverflow',
	        coverflowEffect: {
	          rotate: 30,
	          slideShadows: false,
	        },

	    });
	 
	 new Swiper('.ott.swiper .swiper-container',{
	        slidesPerView: 3, // 한번에 보여줄 슬라이드 개수
	        spaceBetween: 20, // 슬라이드 사이 여백
	        // 1번 슬라이드가 가운데 보이기
	        loop:true,
	        // autoplay: {
	        //     delay : 5000,
	        // },
	        navigation : {
	            prevEl : '.ott .swiper-prev',
	            nextEl : '.ott .swiper-next',
	        },
	        effect: 'coverflow',
	        coverflowEffect: {
	          rotate: 30,
	          slideShadows: false,
	        },

	    });
	</script>
</body>
</html>