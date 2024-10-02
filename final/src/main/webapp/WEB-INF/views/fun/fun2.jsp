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

		canvas {
			margin-top : 100px;  
			transition: 2s;
			transition: transform 2s ease;
			will-change: transform;
		}

		#made-btn {
			z-index : 1000;
			background: #f29b9b;
			margin-top: 1rem;
			padding: .8rem 1.8rem;
			border: none;
			font-size: 1.5rem;
			font-weight: bold;
			border-radius: 5px;
			transition: .2s;
			cursor: pointer;
			color: white;
			font-size: 16px;
			font-weight: 100;
		}

		#made-btn:active {
			background: #444;
			color: #f9f9f9;
		}
		
		#made-menu {
			width: 100%;
			overflow: hidden;
			display: flex;
			align-items: center;
			text-align : center;
			flex-direction: column;
			position: relative;
		}

		#made-menu::before {
			margin-top : 100px; 
			content: "";
			position: absolute;
			width: 10px;
			height: 50px;
			border-radius: 5px;
			background: #000;
			top: -20px;
			left: 50%;
			transform: translateX(-50%);
			z-index: 22;
		}
	</style>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="../common/menubar.jsp"/>
	<script>
		// 메뉴바에 클릭된 메뉴 하이라이트
		$(()=>{ $(".nav-header #menubar_fun").addClass("active"); })
		$(()=>{ $(".nav-header #menubar_fun2").addClass("active"); })
	</script>

	<!-- 내용 -->
	<div id="fh5co-blog-section" class="fh5co-section-gray">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center heading-section">
					<h2>오늘 뭐 먹지?</h2>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-md-offset-4 text-center animate-box" id="defaultContainerRowDiv2">
					<div id="made-menu">
						<canvas width="600" height='600'></canvas>  
						<button onclick="rotate()" id="made-btn">GO!</button>
					  </div>

					  <script>
						const $c = document.querySelector("canvas");
						const ctx = $c.getContext(`2d`);

						const product = ["떡볶이", '돈가스', "초밥", "피자", "냉면", "치킨", '족발', "피자", "삼겹살", "햄버거"];

						const colors = ["#dc0936", "#e6471d", "#f7a416", "#efe61f ", "#60b236", "#209b6c", "#169ed8", "#3f297e", "#87207b", "#be107f"];

						const newMake = () => {
							const [cw, ch] = [$c.width / 2, $c.height / 2];
							const arc = Math.PI / (product.length / 2);
						
							for (let i = 0; i < product.length; i++) {
								ctx.beginPath();
								ctx.fillStyle = colors[i % (colors.length -1)];
								ctx.moveTo(cw, ch);
								ctx.arc(cw, ch, cw, arc * (i - 1), arc * i);
								ctx.fill();
								ctx.closePath();
							}

							ctx.fillStyle = "#fff";
							ctx.font = "18px Pretendard";
							ctx.textAlign = "center";

							for (let i = 0; i < product.length; i++) {
								const angle = (arc * i) + (arc / 2);

								ctx.save()  ;

								ctx.translate(
									cw + Math.cos(angle) * (cw - 50),
									ch + Math.sin(angle) * (ch - 50),
								);

								ctx.rotate(angle + Math.PI / 2);

								product[i].split(" ").forEach((text, j) => {
									ctx.fillText(text, 0, 30 * j);
								});

								ctx.restore();
							}
						}

						const rotate = () => {
							// 초기 상태 설정
							$c.style.transition = `none`;
							$c.style.transform = `rotate(0deg)`; // 회전 초기화

							setTimeout(() => {
								const ran = Math.floor(Math.random() * product.length);
								const arc = 360 / product.length;
								const rotateDegree = (ran * arc) + 3600; // 3600도 회전

								console.log('Rotate value:', rotateDegree);

								// 회전 적용
								$c.style.transition = `transform 2s ease`; // 전환 효과 적용
								$c.style.transform = `rotate(-${rotateDegree}deg)`;
							}, 100); // 약간의 지연
						};

						newMake();
					  </script>
				</div>
			</div>
		</div>
	</div>
	<!-- fh5co-blog-section -->
	
	
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>