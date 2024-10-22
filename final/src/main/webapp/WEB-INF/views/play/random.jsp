<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="../common/menubar.jsp"/>
	<script>
		// 메뉴바에 클릭된 메뉴 하이라이트
		$(()=>{ $(".nav-header #menubar_map").addClass("active"); })
	</script>

	<div id="fh5co-couple" class="fh5co-section-gray">
		<div class="container">
			<div class="row animate-box">
				<div class="col-md-8 col-md-offset-2">
					<div class="col-md-12 text-center heading-section" style="margin-bottom: 0;">
						<h2>오늘의 데이트 코스를 추천 받아보세요!</h2>
						<section class="random">
					        <div class="inner">
					            <div class="title">
					                <h1 align="center">오늘 뭐하지?</h1>
					            </div>
					            <div class="container">
					                <div id="menu-display" style="width:250px;height:250px;margin-left:220px;">
					                    <img id="menu-image" src="resources/randomImg/물음표.png" alt="추천 메뉴" style="width:250px;height:250px;">
					                    
					                </div>
					            </div>
					            <div class="name">
					                <p id="menu-name"></p>
					                <button class="btn btn-lg btn-primary" id="recommend-button">추천하기</button>
					            </div>
					        </div>
					    </section>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
	 document.addEventListener('DOMContentLoaded', function() {
	        // 메뉴 데이터
	        
	        	const menus = [
	                { name: "영화보기", image: "resources/randomImg/영화.jpg" },
	                { name: "방탈출", image: "resources/randomImg/방탈출.jpg" },
	                { name: "볼링", image: "resources/randomImg/볼링.png" },
	                { name: "노래방", image: "resources/randomImg/노래방.jpg" },
	                { name: "놀이동산", image: "resources/randomImg/놀이동산.jfif" },
	                { name: "쇼핑", image: "resources/randomImg/쇼핑몰.webp" },
	                { name: "낚시카페", image: "resources/randomImg/낚시카페.jpg" },
	                { name: "보드게임", image:"resources/randomImg/보드게임.jfif"},
	                { name: "북카페", image: "resources/randomImg/만화카페.png"},
	                { name: "뮤지컬", image:"resources/randomImg/뮤지컬.jpg"},
	                { name: "원데이클래스", image:"resources/randomImg/원데이클래스.jfif"},
	                { name: "피시방", image:"resources/randomImg/피시방.jpg"},
	                { name: "집", image:"resources/randomImg/집.jpg"},
	                { name: "동물카페", image:"resources/randomImg/동물카페.jpg"},
	                { name: "공원", image:"resources/randomImg/공원.jfif"},
	                { name: "클라이밍", image:"resources/randomImg/클라이밍.jpg"},
	                { name: "찜질방", image:"resources/randomImg/찜질방.jpg"},
	                { name: "바다", image:"resources/randomImg/바다.jpg"},
	            ];
	             
	       

	        const menuImage = document.getElementById('menu-image');
	        const menuName = document.getElementById('menu-name');

	        // 슬롯머신 애니메이션 실행
	        function startSlotMachine() {
	            // 슬롯머신 이미지 배열 생성
	            let images = [];
	            for (let i = 0; i < 10; i++) {
	                const randomIndex = Math.floor(Math.random() * menus.length);
	                images.push(menus[randomIndex].image);
	            }

	            // 슬롯머신 애니메이션
	            let index = 0;
	            menuImage.style.opacity = 1; // Make sure image is visible
	            menuImage.src = images[index];
	            const duration = 3; // 애니메이션 총 지속 시간 (초)
	            const frameRate = 30; // 애니메이션 프레임 속도 (프레임/초)
	            const frames = duration * frameRate; // 총 프레임 수
	            const interval = duration * 1000 / frames; // 각 프레임 간격 (밀리초)
	            
	            const animationInterval = setInterval(() => {
	                menuImage.src = images[index];
	                index = (index + 1) % images.length; // 순환
	            }, interval);

	            // 애니메이션 종료 후 최종 이미지 설정
	            setTimeout(() => {
	                clearInterval(animationInterval);
	                const finalIndex = Math.floor(Math.random() * menus.length);
	                const selectedMenu = menus[finalIndex];
	                menuImage.src = selectedMenu.image;
	                menuName.textContent = selectedMenu.name;
	                menuImage.style.opacity = 1;
	            }, duration * 1000); // duration 동안 회전 후 멈춤
	        }

	        document.getElementById('recommend-button').addEventListener('click', function() {
	            menuImage.style.opacity = 0; // 이미지 사라지게 하기
	            setTimeout(() => {
	                startSlotMachine();
	            }, 500); // 클릭 후 500ms 후에 슬롯머신 시작
	        });
	    });
	</script>



	
	
	
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>