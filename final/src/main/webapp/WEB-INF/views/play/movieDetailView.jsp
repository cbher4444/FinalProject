<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>UsTwo</title>
	<style>
		#fh5co-couple img{
			width: 231px;
			height: 231px;
			object-fit: cover;
		}

		.modal-body{
			display: flex;
			flex-direction: column;
			align-items: start;
		}

		.modal-body .form-group{
			width: 100%;
		}

		.modal-footer{
			display: flex;
			flex-direction: column;
			align-items: center;
		}

		.modal-footer button{
			width: 50%;
			
		}
		
		.circle{
    		font-size:12px;
    		width: 60px;
    		height: 60px;
    		display: flex;
    		border-radius : 50%;
    		border : 1px solid #343b48;
    		position : relative;
    		background: conic-gradient(yellowgreen 277deg, white 0deg);
    		top:-50px;
    		left: -145px;
    	}
    	
    	.inner-circle{
    		width:90%;
    		height:90%;
    		border-radius:inherit;
    		background-color : #353b48;
    		margin: auto;
    		display: flex;
    		color:white;
    		justify-content: center;
    	}
    	
    	.inner-circle span{
    		display:flex;
    		align-items: center;
    	}
    	
    	.col-md-3.text-center.animate-box.fadeInUp.animated{
    		width:250px;
    	}
    	
    	.groom-men img{
    		width:250px;
    		height:250px;
    	}

	</style>
	<link rel="stylesheet" href="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.css" />
    <script src="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>

	<!-- 메뉴바 -->
	<jsp:include page="../common/menubar.jsp"/>
	
	<!-- 메뉴바 위 메인사진 -->
	<div class="fh5co-hero" data-section="home"> 
		<div class="fh5co-overlay"></div>

				<div class="fh5co-cover text-center backPoster" data-stellar-background-ratio="0.5" >

			<div class="display-t">
				<div class="display-tc">
					<div class="">
						<div class="col-md-10 col-md-offset-1">
							<div class="animate-box" style="display:flex;flex-wrap:wrap;justify-content: space-evenly;width:1265px;margin-left:200px">
								<img class="mainPoster" src="https://image.tmdb.org/t/p/w1920_and_h800_multi_faces/yDHYTfA3R0jFYba16jBB1ef8oIt.jpg" style="width:300px;height:400px;position:relative;">
								<h1 class="overView" style='width:925px; text-align:left;padding:55px 25px;'>"합시다, 러브. 나랑, 나랑 같이."</h1>
								<div class='circle'>
									<div class='inner-circle'>
					            		<span>  </span>
					            	</div>
					            </div>
								<h2 class="title">유진 &amp; 애신</h2>
								<p><span class="releaseDate">2018.07.07</span></p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	

	<script>
		// 메뉴바에 클릭된 메뉴 하이라이트
		$(()=>{ $(".nav-header #menubar_map").addClass("active"); })
		
		// json 객체 데이터 뽑기(영화 정보)
		let movieInfo = ${ response }
		let backPoster = 'https://image.tmdb.org/t/p/w1920_and_h800_multi_faces' + movieInfo.backdrop_path;
		let mainPoster = 'http://media.themoviedb.org/t/p/w220_and_h330_face' + movieInfo.poster_path ;
		let overview = movieInfo.overview;
		let title = movieInfo.title;
		let vote = movieInfo.vote_average.toFixed(1) * 10;
		let date = movieInfo.release_date;
		
		// 영화 정보 데이터 넣기
		$(".backPoster").css("background-image","url("+ backPoster +")");
		$('.mainPoster').attr("src", mainPoster);
		$(".overView").text(overview);
		$(".title").text(title);
		$(".releaseDate").text(date);
		$(".circle .inner-circle span").text(vote + '%');
		if(vote > 50){
			$(".circle").css("background","conic-gradient(yellowgreen "+ vote * 3.6 +"deg, white 0deg)")
		}else{
			$(".circle").css("background","conic-gradient(orange "+ vote * 3.6 +"deg, white 0deg)")
		}
		

		
	  
		
	</script>

	<!-- 내용 -->
	<div id="fh5co-guest">
			<div class="container">
				<div class="row animate-box fadeInUp animated">
					<div class="col-md-8 col-md-offset-2 text-center heading-section">
						<h2>주요 출연진</h2>
					</div>
				</div>
				<div class="row row-bottom-padded-lg">
					<div class="swiper">
						<div class="swiper-container">
							<div class="swiper-wrapper">
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
	
	const swiper = new Swiper('.swiper .swiper-container',{
        slidesPerView: 4, // 한번에 보여줄 슬라이드 개수
        spaceBetween: 20, // 슬라이드 사이 여백
        loop:false,

    });
	
	// json 객체 데이터 뽑기 (출연진 정보)
	  let credit = ${credit}.cast;
	    
	    value = "";
	    $(credit).each(function(i, item){
	    	if(i < 13){
	    		value += "<div class='swiper-slide'>"
						+	"<div class='col-md-3 text-center animate-box fadeInUp animated'>"
						+		"<div class='groom-men'>"
						+			"<img src='https://media.themoviedb.org/t/p/w138_and_h175_face"+ item.profile_path + "' class='img-responsive' onerror=\"this.onerror=null; this.src='resources/images/member/blank-profile-picture.png';\" alt='Free HTML5 Bootstrap Template by FreeHTML5.co'>"
						+			"<h3 style='margin-bottom:10px;'>"+ item.name +"</h3>"
						+			"<h3>"+ item.character + "</h3>"
						+		"</div>"
						+	"</div>"
						+ "</div>";
	    	}
	    })
	    
		swiper.appendSlide(value);
	    swiper.update();
		


	</script>


</body>
</html>