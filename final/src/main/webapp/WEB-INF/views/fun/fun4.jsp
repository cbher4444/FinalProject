<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<style>
		body * {
			box-sizing: border-box;
		}

		#made-coverDiv {
			display: flex;
			border-bottom: 1px solid #000;
		}
		#made-q {
			width: 100%;
			height: 30px;
			background-color: #ffffff00;
			border: none;
		}

		#made-q:focus {outline: none;}

		#made-btn {
			background-color: #ffffff00;
			border: none;
			font-size: 16px;
		}

		.userText, .aiText {
			border-radius: 20px;
			min-width: 50px;
			max-width: 90%;
			text-align: left;
			padding: 5px 10px;
			min-height: 30px;
			word-break: break-all;
			margin-bottom: 25px;
		}

		.userText {
			background-color: #f69d9d80;
		}

		.aiText {
			background-color: #fff;
		}

		.userMsg, .aiMsg {
			display: flex;
		}

		.userMsg {
			justify-content: end;
		}

		.aiMsg {
			justify-content: start;
		}

		.col-md-4 {
			width: 52% !important;
			margin: 0 24% !important;
		}

		#made-textBox {
			max-height: 500px;
			overflow:auto;
			margin-bottom: 10px;
			flex-direction: column-reverse;
			display: flex;
		}

		.made-btns {
			width: 20px;
			height: 20px;
			border-radius: 50%;
			border: 1px solid #00000080;
			cursor: pointer;
			text-align: center;
			margin: 10px;
			font-size: 12px;
		}

		.corrent {
			background-color: #F69D9D;
			color: white;
			border: none;
		}

		#made-miniPageBar {
			display: flex;
			justify-content: center;
		}

		#made-content {
			width: 700px;
			position: fixed;
			background-color: #fff;
			padding: 40px 50px;
			z-index: 1000;
			border-radius: 25px;
			height: 483.516px;
			margin: auto;
			right: 0;
			left: 0;
			top: 0;
			bottom: 0;
		}

		#made-cover {
			width: 100%;
			height: 100%;
			position: fixed;
			background-color: #00000080;
			z-index: 999;
		}

		#made-closeBtn {
			position: absolute;
			right: 50px;
			font-size: 20px;
			cursor: pointer;
		}
		
		input, progress {
			accent-color: #F69D9D;
		}

		#made-miniBar {
			display: flex;
			flex-direction: row;
			position: absolute;
			right: 30px;
		}

		#noMoreSee {
			margin-right: 20px;
		}

		#noMoreSeeText {
			font-weight: normal;
		}

		#noMoreSeeText, #noMoreSeeInput, #made-closeText {
			cursor: pointer;
		}
	</style>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="../common/menubar.jsp"/>
	<script>
		let guides = [
			`
				<h3>1. 서비스 이용 방법</h3>
				&nbsp;&nbsp;&nbsp;1) 상담 요청: 연애와 관련된 고민이나 궁금한 점을 자유롭게 입력해 주세요.<br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(1) "짝사랑을 하고 있는데 고백해도 될까요?"<br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(2) "연인과 자주 싸워서 고민이에요. 어떻게 해야 할까요?"<br />
				&nbsp;&nbsp;&nbsp;2) AI의 응답<br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(1) 입력된 질문을 기반으로 AI가 상황에 맞는 조언을 제공합니다.<br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(2) AI는 중립적이며 논리적인 조언을 목표로 하므로,<br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;개인적인 감정 처리를 돕기 위한 방향으로 이야기를 나눕니다.<br />
				&nbsp;&nbsp;&nbsp;3) 대화 지속<br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(1) AI의 답변에 대한 추가 질문이나 새로운 고민을 입력하여 대화를 이어갈 수 있습니다.<br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(2) AI는 대화 내역을 바탕으로 보다 구체적이고 심층적인 조언을 제공할 수 있습니다.<br /><br />
			`,
			`
				<h3>2. 자주 묻는 질문 (FAQ)</h3>
				&nbsp;&nbsp;&nbsp;Q1: AI가 개인적인 감정을 이해할 수 있나요?<br />
				&nbsp;&nbsp;&nbsp;A1: AI는 감정을 이해하려고 노력하지만,<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;인간처럼 깊은 감정적 교류를 하지는 않습니다.<br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;대신 상황에 맞는 논리적이고 객관적인 조언을 제공하려고 합니다.<br /><br />

				&nbsp;&nbsp;&nbsp;Q2: AI 상담은 익명인가요?<br />
				&nbsp;&nbsp;&nbsp;A2: 네, AI 상담은 익명으로 이루어지며, 개인 정보는 수집되지 않습니다.<br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;안심하고 상담해 주세요.<br /><br />

				&nbsp;&nbsp;&nbsp;Q3: 특정한 상황을 이야기해도 되나요?<br />
				&nbsp;&nbsp;&nbsp;A3: 물론입니다! 연애 관련 고민은 매우 개인적인 상황이므로,<br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;구체적인 상황을 입력하시면 AI가 더욱 맞춤형 조언을 제공할 수 있습니다.<br /><br />

				&nbsp;&nbsp;&nbsp;Q4: AI의 조언이 항상 옳은가요?<br />
				&nbsp;&nbsp;&nbsp;A4: AI는 다양한 정보를 바탕으로 최선의 조언을 제공합니다.<br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;하지만 모든 인간관계는 복잡하며,<br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;AI의 조언이 절대적인 해결책이 아닐 수 있습니다.<br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;중요한 결정을 내릴 때는 다양한 의견을 참고하는 것이 좋습니다.<br /><br />
			`,
			`
				<h3>3. 유의 사항</h3>
				&nbsp;&nbsp;&nbsp;1) AI는 법적 또는 전문가 상담의 대체가 아니며,<br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;심각한 관계 문제나 정신 건강 관련 문제는 전문가와 상담하는 것이 중요합니다.<br />
				&nbsp;&nbsp;&nbsp;2) AI의 조언은 참고용이며, 사용자가 모든 결정을 책임져야 합니다.<br />
				&nbsp;&nbsp;&nbsp;3) AI는 모든 상황을 100% 이해하지 못할 수 있으니, 이를 고려하여 사용해 주세요.<br /><br />
			`,
			`
				<h3>4. 상담 팁</h3>
				&nbsp;&nbsp;&nbsp;1) 구체적인 상황 설명<br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: 문제를 구체적으로 설명해 주시면 더 정확한 조언을 받을 수 있습니다.<br />
				&nbsp;&nbsp;&nbsp;2) 연애의 단계<br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: 연애 초기, 연인 사이, 이별 등 연애의 단계에 따라 상황을 설명해 주세요.<br />
				&nbsp;&nbsp;&nbsp;3) AI의 질문에 응답<br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: AI가 추가 질문을 하면 솔직하게 응답해 주세요. 상담의 질이 높아집니다.<br /><br />
			`,
		];

		// 메뉴바에 클릭된 메뉴 하이라이트
		$(()=>{ $(".nav-header #menubar_fun").addClass("active"); });
		$(()=>{ $(".nav-header #menubar_fun4").addClass("active"); });

		$(() => {
			if (getCookie('usTwoPopup')) {
				closePopup();
			}

			$('#made-q').on('focus', () => {$('#made-q').attr('placeholder', '')});
			
			$('#made-q').on('blur', () => {
				if ($('#made-q').val() === '') {
					$('#made-q').attr('placeholder', 'AI에게 질문을 해보세요~!');
				}
			});

			$(document).on('keyup', function(event) {
				if (event.keyCode === 13) {
					callGemini();
				}
			});

			$('#made-guideDiv').html(guides[0]);

			$('#made-guide1').on('click', function(event) {
				guideSetting(0, '483.516px', event.target);
				
			});

			$('#made-guide2').on('click', function(event) {
				guideSetting(1, '688.266px', event.target);
			});

			$('#made-guide3').on('click', function(event) {
				guideSetting(2, '329.953px', event.target);
			});

			$('#made-guide4').on('click', function(event) {
				guideSetting(3, '381.141px', event.target);
			});
		});

		function guideSetting(index, height, event) {
			$('div[id^=made-guide]').removeClass('corrent');
			$(event).addClass('corrent');
			$('#made-content').css('height', height);
			$('#made-guideDiv').html(guides[index]);
		}

		function closePopup() {
			$('#made-cover').css('display', 'none');
			$('#made-content').css('display', 'none');
			if ($('#noMoreSeeInput').is(':checked') == true) {
				setCookie("usTwoPopup", "done");
			}
		}

		function callGemini() {
			if ($('#made-q').val() === null || $('#made-q').val() === '') {
				alert('고민을 입력해주세요.');
			} else {
				let questionContent = $('#made-q').val();
				$('#made-q').val('');

				$.ajax({
					url: 'geminiQnA',
					data: {
						'prompt': questionContent,
						"coupleCode": '${ loginUser.coupleCode }',
						"email": '${ loginUser.email }',
					},
					success: function(result) {
						
					}, error: function(jqXHR, textStatus, errorThrown) {
						console.error("AJAX Error: " + textStatus, errorThrown);
						console.log('Error QnA')
					}
				});
			}
		}

		function getCookie(name) {
			var nameOfCookie = name + "=";
			var x = 0;
			while (x <= document.cookie.length) {
				var y = (x + nameOfCookie.length);

				if (document.cookie.substring(x, y) === nameOfCookie) {
					if ((endOfCookie = document.cookie.indexOf(";", y)) === -1)
						endOfCookie = document.cookie.length;
					return unescape(document.cookie.substring(y, endOfCookie));
				}

				x = document.cookie.indexOf(' ', x) + 1;

				if (x === 0) break;
			}

			return "";
		}

		function setCookie(name, value) {
			document.cookie = name + '=' + escape(value) + '; path=/;';
		}
	</script>

	<div id="made-cover"></div>
	<div id="made-content">
		<div id="made-closeBtn" class="material-symbols-outlined" onclick="closePopup()">close</div>
		<div id="made-guideDiv"></div>
		<div align="center" id="made-miniPageBar">
			<div id="made-guide1" class="corrent made-btns">1</div>	
			<div id="made-guide2" class="made-btns">2</div>	
			<div id="made-guide3" class="made-btns">3</div>	
			<div id="made-guide4" class="made-btns">4</div>	
		</div>
		<div id="made-miniBar">
			<div id="noMoreSee">
				<label for="noMoreSeeInput" id="noMoreSeeText">더이상 보지않기</label>
				<input type="checkbox" id="noMoreSeeInput" />
			</div>
			<div id="made-closeText" onclick="closePopup()">닫기</div>
		</div>
	</div>

	<div id="fh5co-blog-section" class="fh5co-section-gray">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center heading-section">
					<h2>연애 상담 받기</h2>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-md-offset-4 text-center animate-box">
					<jsp:include page="chat.jsp" />
					<div id="made-coverDiv">
						<input type="text" name="q" id="made-q" placeholder="AI에게 질문을 해보세요~!" />
						<button id="made-btn" class="material-symbols-outlined" onclick="callGemini()">arrow_forward</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="../common/footer.jsp"/>
</body>
</html>