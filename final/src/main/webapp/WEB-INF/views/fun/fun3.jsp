<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<style>
		#made-calederCover {
			display: flex;
		}

		#made-calederCover > .calendar {
			display: flex;
			flex-wrap: wrap;
			width: 1072px;
			margin: auto;
			border: 1px solid #000;
			border-radius: 10px;
			padding: 10px;
			box-sizing: border-box;
		}

		#made-calederCover > .calendar > .calendar-header {
			width: 100%;
			height: 30px;
			text-align: center;
		}

		#made-calederCover > .calendar > .calendar-day {
			width: 150px;
			height: 30px;
			text-align: center;
			padding-left: 10px;
		}

		#made-calederCover > .calendar > .calendar-date {
			width: 150px;
			height: 120px;
			padding: 10px;
		}

		.abled {
			cursor: pointer;
		}

		.made-btn {
			background-color: #ffffff00;
			border: none;
		}

		.today {
			background-color: #F69D9D52;
			color: white;
		}

		.today p {
			color: white;
		}

		#made-detailQ {
			background-color: white;
			border: none;
			border-radius: 15px;
			width: 600px;
			height: 400px;
			padding: 40px 20px;
			margin: auto;
			position: fixed;
			z-index: 1001;
			top: 0;
			left: 0;
			right: 0;
			bottom: 0;
			display: none;
		}

		#made-cover {
			background-color: #00000030;
			width: 100%;
			height: 100%;
			position: fixed;
			top: 0;
			left: 0;
			display: none;
			z-index: 1000;
		}

		#made-x {
			cursor: pointer;
			position: absolute;
			top: 10px;
			right: 10px;
			font-size: 16px;
		}
		
		#btns {
			width: 1072px;
			margin: 0 auto;
			display: flex;
			justify-content: end;
		}

		.heading-section {
			margin-bottom: 0 !important;
		}

		.answer {
			width: 45%;
			margin: 0 2.5%;
			padding: 30px;
			background-color: #f8eb3050;
			position: relative;
			min-height: 230px;
		}

		.triangle {
			width: 0;
			height: 0;
			border-top: 15px solid #00000080;
			border-bottom: 15px solid white;
			border-left: 15px solid #00000080;
			border-right: 15px solid white;
			position: absolute;
			bottom: 0;
			right: 0;
		}

		#answerTextArea {
			resize: none;
			width: 100%;
			height: 150px;
			border: 1px solid #00000015;
			background-color: transparent;
			padding: 5px 10px;
		}

		#answerTextArea:focus {
			outline: none;
		}

		#answerTextArea::placeholder {
			color: #00000080;
		}
	</style>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="../common/menubar.jsp"/>
	<script>
		// 메뉴바에 클릭된 메뉴 하이라이트
		$(()=>{ $(".nav-header #menubar_fun").addClass("active"); });
		$(()=>{ $(".nav-header #menubar_fun3").addClass("active"); });
	</script>

	<!-- 내용 -->
	<div id="fh5co-blog-section" class="fh5co-section-gray">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center heading-section">
					<h2>오늘의 질문</h2>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row row-bottom-padded-md">
				<div id="btns">
					<button id="made-prev" class="made-btn material-symbols-outlined" style="font-size: 35px;">chevron_left</button>
					<button id="made-today" class="made-btn">today</button>
					<button id="made-next" class="made-btn material-symbols-outlined" style="font-size: 35px;">chevron_right</button>
				</div>
				<div id="made-calederCover">
					<script>
						$(() => {
							let today = new Date();
							today.setHours(0, 0, 0, 0);
							let currentMonth = new Date(today.getFullYear(), today.getMonth(), 1);
							let listSave;

							function saveList(list) {
								listSave = list;
							}

							function renderCalendar(container, date) {
								let startDate = currentMonth.getFullYear().toString() +
												'-' + 
												('0' + (currentMonth.getMonth() + 1)).slice(-2) +
												'-' + 
												('0' + currentMonth.getDate()).slice(-2);
								let endDate = currentMonth.getFullYear().toString() +
											  '-' + 
											  ('0' + (currentMonth.getMonth() + 1)).slice(-2) +
											  '-' + 
											  new Date(currentMonth.getFullYear(), currentMonth.getMonth() + 1, 0).getDate();
								$.ajax({
									url: 'selectQnA.today',
									data: {
										'email': '${ loginUser.email }',
										'coupleCode': '${ loginUser.coupleCode }',
										'partnerEmail': '${ loginUser.partnerEmail }',
										'startDate': startDate,
										'endDate': endDate,
									}, success: function(list) {
										$(container).empty();
										let month = date.getMonth();
										let year = date.getFullYear();

										let firstDay = new Date(year, month, 1).getDay();
										let lastDate = new Date(year, month + 1, 0).getDate();
										
										let calendar = $('<div>').addClass('calendar');
										
										calendar.append($('<div>').addClass('calendar-header').text(date.toLocaleString('en-us', { month: 'long' }) + ' ' + year));
										
										const daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
										for (let day of daysOfWeek) {
											let dayDiv = $('<div>').addClass('calendar-day').text(day);
											calendar.append(dayDiv);
										}

										for (let i = 0; i < firstDay; i++) {
											calendar.append($('<div>').addClass('calendar-date'));
										}

										for (let date = 1; date <= lastDate; date++) {
											let calendarDate = $('<div>').addClass('calendar-date').text(date);

											if (list && list.length > 0) {
												for (let i in list) {
													let qDate = new Date(list[i].qtodayDate);
													let qYear = qDate.getFullYear();
													let qMonth = String(qDate.getMonth() + 1).padStart(2, '0');
													let qDay = String(qDate.getDate()).padStart(2, '0');
													if (date === Number(qDay) && (month + 1) === Number(qMonth) && year === Number(qYear)) {
														calendarDate = $('<div>').addClass('calendar-date').addClass('abled').html(date + '</br><p style="font-size: 13px">' + list[i].qtodayContent + '<p>');
													}
												}
											}

											if (date === today.getDate() && month === today.getMonth() && year == today.getFullYear()) {
												calendarDate.addClass('today');
											}

											calendar.append(calendarDate);
										}
										
										$(container).append(calendar);
										saveList(list);
									}, error: function() {
										console.log('error');
									}
								});
							}
							
							function render() {
								renderCalendar('#made-calederCover', currentMonth);
							}

							$(document).on('click', '.abled', function(event) {
								for (let i in listSave) {
									if (listSave && listSave.length > 0) {
										if (listSave[i].qtodayContent === $(this).children('p').text()) {
											let originDate = new Date(listSave[i].qtodayDate);
											let editYear = originDate.getFullYear();
											let editMonth = String(originDate.getMonth() + 1).padStart(2, '0');
											let editDay = String(originDate.getDate()).padStart(2, '0');

											if (editMonth.length === 1) {
												editMonth = '0' + editMonth;
											}
											if (editDay.length === 1) {
												editDay = '0' + editDay;
											}
											$('#today').val(editYear + '-' + editMonth + '-' + editDay);
											
											$('#made-q').text('Q. ' + listSave[i].qtodayContent);
											$('#partnerAnswer').text(listSave[i].partnerContent);
											
											if (listSave[i].myContent !== '아직 등록된 답변이 존재하지 않습니다.') {
												$('#answerTextArea').val(listSave[i].myContent);
											} else {
												$('#answerTextArea').val('');
											}
										}
									}
								}
								$('#made-detailQ').css('display', 'block');
								$('#made-cover').css('display', 'block');
								$('body').css('overflow', 'hidden');
							});

							$('#made-cover').on('click', () => {
								$('#made-detailQ').css('display', '');
								$('#made-cover').css('display', '');
								$('body').css('overflow', '');
								render();
							});

							$('#made-x').on('click', () => {
								$('#made-detailQ').css('display', '');
								$('#made-cover').css('display', '');
								$('body').css('overflow', '');
								render();
							});

							$('#made-next').on('click', function() {
								currentMonth.setMonth(currentMonth.getMonth() + 1);
								render();
							});

							$('#made-today').on('click', function() {
								currentMonth = new Date(today.getFullYear(), today.getMonth(), 1);
								render();
							});

							$('#made-prev').on('click', function() {
								currentMonth.setMonth(currentMonth.getMonth() - 1);
								render();
							});

							$('#answerTextArea').on('keyup', function() {
								$.ajax({
									url: 'updateAtoday.today',
									data: {
										'atodayContent': $(this).val(),
										'email': '${ loginUser.email }',
										'coupleCode': '${ loginUser.coupleCode }',
										'today': $('#today').val(),
									},
									success: function() {
										console.log('성공');
									}, error: function() {
										console.log('error : updateAtoday')
									}
								});
							});

							render();
						});
					</script>
				</div>
			</div>
		</div>

		<div id="made-detailQ">
			<div id="made-x" class="material-symbols-outlined">close</div>
			<div id="made-q" style="font-size: 22px;">
				Q. 서로의 첫인상
			</div>
			<br>
			<div style="display: flex;">
				<div id="made-userAnswer1" class="answer">
					<div id="made-answerContent1" class="answerContent">
						<p align="center" style="margin-bottom: 10px;">${ loginUser.nickName }</p>
					</div>
					<textarea name="" id="answerTextArea" placeholder="답변을 남겨보세요."></textarea>
					<input type="hidden" id="today">
					<div class="triangle"></div>
				</div>
				<div id="made-userAnswer2" class="answer">
					<div id="made-answerContent2" class="answerContent">
						<p align="center" style="margin-bottom: 10px;">${ partner.nickName }</p>
					</div>
					<div id="partnerAnswer"></div>
					<div class="triangle"></div>
				</div>
			</div>
		</div>

		<div id="made-cover"></div>
	</div>

	<jsp:include page="../common/footer.jsp"/>
</body>
</html>