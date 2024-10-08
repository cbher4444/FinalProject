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
    	
    	.swiper-slide img:hover{
    		background-color:black;
    	}
    
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
    	
    	.circle{
    		font-size:12px;
    		width: 60px;
    		height: 60px;
    		display: flex;
    		border-radius : 50%;
    		border : 1px solid #343b48;
    		position : relative;
    		top:-50px;
    		background: conic-gradient(yellowgreen 277deg, white 0deg);
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
    	
    	div.media.discover div.content_wrapper {
	flex-wrap: wrap
}

div.media.discover div.content_wrapper.pad {
	padding-bottom: 100px
}

div.media.discover div.content_wrapper div.content {
	width: 100%;
	display: flex;
	align-items: flex-start;
	align-content: flex-start
}

div.media.discover div.content_wrapper>div.title {
	width: 100%;
	margin-bottom: 20px
}

div.media.discover div.card div.image div.options div.glyphicons_v2, div.media.discover div.content_wrapper>div.title h2
	{
	font-size: 1.6em
}

div.media.discover div.white_column {
	padding-left: 30px;
	background: 0 0
}

div.media.discover div.apply {
	width: 100%;
	margin-top: 20px;
	display: flex;
	justify-content: center;
	align-items: center;
	align-content: center;
	border-radius: 20px;
	height: 44px
}

div.media.discover div.apply:hover {
	background-color: rgba(var(- -tmdbDarkBlue), 1)
}

div.media.discover div.apply.disabled, div.media.discover div.apply.disabled:hover
	{
	background-color: rgba(228, 228, 228, .7);
	-webkit-backdrop-filter: blur(10px);
	backdrop-filter: blur(10px)
}

div.media.discover div.apply.disabled a {
	color: rgba(0, 0, 0, .5)
}

div.media.discover div.apply.disabled a:hover {
	cursor: default
}

div.media.discover div.apply.small.invisible {
	visibility: hidden
}

div.media.discover div.apply.full {
	display: none;
	height: 50px
}

div.media.discover div.apply.full.fixed {
	display: flex;
	position: fixed;
	bottom: 0;
	left: 0;
	border-radius: 0;
	z-index: 5
}

div.media.discover div.apply p {
	align-content: center;
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0
}

div.media.discover div.apply a {
	color: #fff;
	font-size: 1.2em;
	line-height: 1;
	font-weight: 600;
	width: 100%;
	height: 100%;
	justify-content: center;
	align-content: center
}

div.media.discover div.filter_panel {
	min-width: 260px;
	width: 260px;
	border: 1px solid #e3e3e3;
	border-radius: var(- -imageBorderRadius);
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
	overflow: hidden
}

div.media.discover div.filter_panel h2, div.media.discover div.filter_panel h3
	{
	margin: 0;
	padding: 0
}

div.media.discover div.filter_panel div.name {
	width: 100%;
	display: flex;
	justify-content: space-between;
	flex-wrap: nowrap;
	align-items: center;
	padding: 14px 16px
}

div.media.discover div.filter_panel div.name:hover {
	cursor: pointer
}

div.media.discover div.filter_panel div.name h2 {
	display: inline-flex;
	font-size: 1.1em;
	justify-content: space-between;
	padding-right: 10px;
	width: 100%
}

div.media.discover div.filter_panel div.name h2 span {
	background-color: rgba(0, 0, 0, .08);
	border-radius: 8px;
	display: inline-flex;
	align-items: center;
	padding: 0 10px;
	font-family: "Roboto Mono", monospace;
	font-size: .8em;
	font-weight: 300
}

div.media.discover div.filter_panel div.name span.chevron-right {
	transform: rotate(90deg)
}

div.media.discover div.filter_panel.closed div.name span.chevron-right {
	transform: rotate(0)
}

div.media.discover div.filter_panel.closed div.filter {
	display: none
}

div.media.discover div.filter_panel div.filter {
	width: 100%;
	border-top: 1px solid #eee;
	padding: 14px 16px 16px
}

div.media.discover div.filter_panel+div.filter_panel {
	margin-top: 12px
}

div.media.discover div.filter_panel div.filter h3 {
	display: inline-flex;
	align-items: center;
	width: 100%;
	font-size: 1em;
	font-weight: 300;
	margin-bottom: 10px
}

div.media.discover div.filter_panel div.filter h3 span.glyphicons_v2 {
	margin-left: 6px
}

div.media.discover div.apply a, div.media.discover div.apply p, div.media.discover div.filter_panel div.filter h3 a,
	div.media.discover span.col_1 {
	display: inline-flex;
	align-items: center
}

div.media.discover div.filter_panel.buttons {
	display: flex;
	flex-wrap: nowrap
}

div.media.discover div.filter_panel.buttons div {
	display: inline-flex;
	width: 50%;
	padding: 10px
}

div.media.discover div.filter_panel.buttons div.selected {
	background-color: rgba(var(- -tmdbLightBlue), 1)
}

div.media.discover div.filter_panel.buttons div a {
	width: 100%;
	text-align: center;
	font-weight: 600
}

div.media.discover div.filter_panel.buttons div.selected a {
	color: #fff
}

div.media.discover .full_width {
	width: 100%
}

div.media.discover div.range {
	padding-bottom: 16px
}

div.media.discover .font_size_1, div.media.discover .font_size_1 ul li {
	font-size: .9em
}

div.media.discover div.year_column {
	display: flex;
	justify-content: space-between;
	margin-top: 8px
}

div.media.discover span.col_1 {
	width: 100px;
	color: #a4a4a4
}

div.media.discover ul.multi_select.text {
	margin-top: -8px
}

div.media.discover ul.multi_select.text li {
	display: inline-flex;
	border: 1px solid #9e9e9e;
	border-radius: 14px;
	padding: 4px 12px;
	font-size: .9em;
	margin-right: 6px;
	margin-top: 8px
}

div.media.discover ul.multi_select.text li:last-of-type {
	margin-right: 0
}

div.media.discover a, div.media.discover ul.multi_select.text li a {
	color: #000;
}

div.media.discover ul.multi_select.text a:hover, div.media.discover ul.multi_select.text li.selected,
	div.media.discover ul.multi_select.text li.selected a, div.media.discover ul.multi_select.text li:hover,
	div.media.discover ul.multi_select.text li:hover a {
	background-color: rgba(var(- -tmdbLightBlue), 1);
	color: #F69D9D;
	border-color: rgba(var(- -tmdbLightBlue), 1)
}

div.media.discover ul.multi_select.text li.no_hover a, div.media.discover ul.multi_select.text li.no_hover:hover
	{
	background-color: transparent;
	color: #000;
	border-color: #9e9e9e
}

div.media.discover .k-form-field {
	display: inline-flex;
	width: 100%
}

div.media.discover label.k-form-field+label {
	margin-top: 6px;
	display: inline-flex
}

div.media.discover div.labels {
	margin-top: 6px
}

div.media.discover div.results {
	margin-top: -30px
}

div.page_wrapper {
	width: 100%;
	display: flex;
	justify-content: space-between;
	flex-wrap: wrap
}

div.media.discover a:hover, div.media.discover div.card.style_1 div.content a:hover
	{
	color: rgba(var(- -tmdbLightBlue), 1);
}

div.media.discover div.card.style_1 div.hover {
	visibility: hidden;
	position: absolute;
	top: 0;
	left: 0;
	background-color: rgba(0, 0, 0, .5);
	-webkit-backdrop-filter: blur(20px);
	backdrop-filter: blur(20px);
	width: 100%;
	height: 100%;
	border-radius: var(- -imageBorderRadius);
	z-index: 5;
	transition: linear .1s;
	opacity: 0
}

div.media.discover div.card.style_1 div.hover.on {
	visibility: visible;
	opacity: 1
}

div.media.discover div.card.style_1 {
	position: relative;
	top: 0;
	left: 0;
	display: flex;
	flex-wrap: wrap;
	align-content: flex-start;
	border: 1px solid #e3e3e3;
	border-radius: var(- -imageBorderRadius);
	overflow: hidden;
	margin-top: 30px;
	width: calc(( 100vw - 80px - 260px - ( var(- -discoverColumnPadding)*var(- -numberOfDiscoverColumns)))/var(- -numberOfDiscoverColumns));
	max-width: calc(( var(- -maxPrimaryPageWidth)- 80px- 260px- (var(- -discoverColumnPadding)*var(- -numberOfDiscoverColumns)))/var(- -numberOfDiscoverColumns))
}

div.media.discover div.card.style_1.filler {
	border: 0;
	margin-top: 0;
	height: 0;
	box-shadow: none
}

div.media.discover div.card.style_1 div.image {
	width: 100%;
	height: calc(( 100vw - 80px - 260px - ( var(- -discoverColumnPadding)*var(- -numberOfDiscoverColumns)))/var(- -numberOfDiscoverColumns)*1.5);
	max-height: calc(( var(- -maxPrimaryPageWidth)- 80px- 260px- (var(- -discoverColumnPadding)*var(- -numberOfDiscoverColumns)))/var(- -numberOfDiscoverColumns)*1.5)
}

div.media.discover div.card.style_1 div.image div.wrapper {
	width: 100%;
	height: 100%;
	position: relative;
	top: 0;
	left: 0
}

div.media.discover div.card.style_1 div.image div.wrapper a.image, div.media.discover div.card.style_1 div.image img
	{
	display: inline-block;
	width: 100%;
	height: 100%
}

div.media.discover div.card div.image div.options {
	position: absolute;
	top: 8px;
	right: 8px;
	z-index: 4;
	opacity: .6
}

div.media.discover div.card div.image div.options:hover {
	opacity: 1;
	filter: brightness(0) saturate(100%) invert(53%) sepia(33%)
		saturate(3054%) hue-rotate(156deg) brightness(98%) contrast(99%);
	cursor: pointer
}

div.media.discover div.card.style_1 div.content {
	width: 100%;
	padding: 26px 10px 12px;
	position: relative;
	white-space: normal;
	display: flex;
	align-content: flex-start;
	flex-wrap: wrap
}

div.media.discover div.card.style_1 div.content div.consensus {
	position: absolute;
	top: -19px;
	left: 10px
}

div.media.discover div.card div.consensus div.outer_ring {
	margin-right: 0
}

div.media.discover div.card.style_1 div.content h2 {
	font-size: 1em;
	margin: 0;
	width: 100%;
	word-wrap: normal;
	overflow-wrap: break-word
}

div.media.discover div.card.style_1 div.content a {
	font-weight: 700;
	color: #000
}

div.media.discover div.card.style_1 div.content p {
	font-size: 1em;
	margin: 0;
	padding: 0;
	color: rgba(0, 0, 0, .6)
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
	
		<div class="media discover"
			style="position: absolute; top: 300px; left: 150px;">

			

			<div class="filter_panel card">
				<div class="name" data-callback="filterCallback()">
					<h2>필터</h2>
					<span class="glyphicons_v2 chevron-right"></span>
				</div>

				

				<div class="filter">
					<h3>장르</h3>
					<ul id="with_genres" class="multi_select text" name="with_genres[]">
						<li data-value="878"><span class="no_click"
							onclick="changeGenre(878)">SF</span></li>
						<li data-value="10770"><span class="no_click"
							onclick="changeGenre(10770)">TV
								영화</span></li>
						<li data-value="10751"><span class="no_click"
							onclick="changeGenre(10751)">가족</span></li>
						<li data-value="27"><span class="no_click"
							onclick="changeGenre(27)">공포</span></li>
						<li data-value="99"><span class="no_click"
							onclick="changeGenre(99)">다큐멘터리</span></li>
						<li data-value="18"><span class="no_click"
							onclick="changeGenre(18)">드라마</span></li>
						<li data-value="10749"><span class="no_click"
							onclick="changeGenre(10749)">로맨스</span></li>
						<li data-value="12"><span class="no_click"
							onclick="changeGenre(12)">모험</span></li>
						<li data-value="9648"><span class="no_click"
							onclick="changeGenre(9648)">미스터리</span></li>
						<li data-value="80"><span class="no_click"
							onclick="changeGenre(80)">범죄</span></li>
						<li data-value="37"><span class="no_click"
							onclick="changeGenre(37)">서부</span></li>
						<li data-value="53"><span class="no_click"
							onclick="changeGenre(53)">스릴러</span></li>
						<li data-value="16"><span class="no_click"
							onclick="changeGenre(16)">애니메이션</span></li>
						<li data-value="28"><span class="no_click"
							onclick="changeGenre(28)">액션</span></li>
						<li data-value="36"><span class="no_click"
							onclick="changeGenre(36)">역사</span></li>
						<li data-value="10402"><span class="no_click"
							onclick="changeGenre(10402)">음악</span></li>
						<li data-value="10752"><span class="no_click"
							onclick="changeGenre(10752)">전쟁</span></li>
						<li data-value="35"><span class="no_click"
							onclick="changeGenre(35)">코미디</span></li>
						<li data-value="14"><span class="no_click"
							onclick="changeGenre(14)">판타지</span></li>
					</ul>
				</div>



			</div>


		</div>
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
			                    
			                   
			                </div>
			            </div>
			
			            
			            <div class="swiper-prev">
			                <div class="material-icons">arrow_back_ios</div>
			            </div>
			            <div class="swiper-next">
			                <div class="material-icons">arrow_forward_ios</div>
			            </div>
			  </section>
			  
		<script>

			const options = {
					  method: 'GET',
					  headers: {
					    accept: 'application/json',
					    Authorization: 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwYjI3MjU0NjIzZTEyNTZmMjU5YTBiMGFjOWQ4YWY5MyIsIm5iZiI6MTcyODAwODUzMy44NjgyMzYsInN1YiI6IjY2ZjI2YWU2YTgyYjAwNTcwMzI2Y2NmZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.rlGTYNGlYvpSKbsyEdcLBIGG-Ij0Mr2ra3UtH2IOUlE'
					  }
					};
		
					fetch('https://api.themoviedb.org/3/movie/popular?language=ko-KR&page=1', options)
					  .then(response => response.json())
					  .then((data) =>{
						  let movieList = data['results'];
						  
						  let template = "";
						  movieList.forEach(a => {
							let image = 'http://media.themoviedb.org/t/p/w220_and_h330_face' + a['poster_path'];
							let title = a['title'];
							let overview = a['overview'];
							let vote = a['vote_average'].toFixed(1);
							let movieid = a['id'];
							let date = a['release_date'];
							
							template += " <div class='swiper-slide'>" 
						                + "<a href=''>"
						                + 	"<img src="+ image + " alt=''>"
						                + "</a>"
						               	+  "<p style='text-align:center; margin:0;'>" + title + "</p>"
						                +  "<p style='text-align:center; margin:0;'>" + date + "</p>"
						                +  "<div class='circle' style='background:conic-gradient(yellowgreen "+ vote * 36 +"deg, white 0deg)' ><div class='inner-circle'>"
							            +  "<span>" + (vote * 10) + "%</span>"
							            + "</div></div>"
						            	+ "</div>";
						            	
						    
						  })
						
						  $(".movie.swiper .swiper-container .swiper-wrapper").html(template);
						  
					  })
					  .catch(err => console.error(err));
		</script>
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
	
	
	function changeGenre(genreCode){
		$.ajax({
			url:"discoverMovie",
			data:{genre:genreCode},
			success:function(data){
				let movieList = data.results;
				movie = "";
				
				for(let i in movieList){
					
					let row = movieList[i];
					
					movie +=  " <div class='swiper-slide'>" 
				                + "<a href=''>"
				                + 	"<img src='http://media.themoviedb.org/t/p/w220_and_h330_face"+ row.poster_path + "' alt=''>"
				                + "</a>"
				               	+  "<p style='text-align:center; margin:0;'>" + row.title + "</p>"
				                +  "<p style='text-align:center; margin:0;'>" + row.release_date + "</p>"
				                +  "<div class='circle' style='background:conic-gradient(yellowgreen "+ row.vote_average.toFixed(1) * 36 +"deg, white 0deg)' ><div class='inner-circle'>"
					            +  "<span>" + (row.vote_average.toFixed(1) * 10) + "%</span>"
					            + "</div></div>"
				            	+ "</div>";
				}
				
				$(".movie.swiper .swiper-container .swiper-wrapper").html(movie);
				$(".filter #with_genres li").each(function(i, item){
					if(item.dataset.value == genreCode){
						console.log(item.firstChild);
					}
				})
				
			}, error:function(){
				console.log("장르 변경 ajax 통신 실패")
			}
		})
		
	}
	

	
	
	 new Swiper('.movie.swiper .swiper-container',{
	        slidesPerView: 3, // 한번에 보여줄 슬라이드 개수
	        spaceBetween: 0, // 슬라이드 사이 여백
	        loop:true,
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