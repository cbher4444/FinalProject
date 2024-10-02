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
			cursor: pointer;
		}

		.made-btn {
			background-color: #ffffff00;
			border: none;
		}

		.today {
			background-color: #f29b9b52;
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
	</style>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="../common/menubar.jsp"/>
	<script>
		// 메뉴바에 클릭된 메뉴 하이라이트
		$(()=>{ $(".nav-header #menubar_fun").addClass("active"); })
		$(()=>{ $(".nav-header #menubar_fun3").addClass("active"); })
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

							function renderCalendar(container, date) {
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
									if (day === 'Sun') {
										dayDiv.addClass('sunday');
									}
									calendar.append(dayDiv);
								}

								for (let i = 0; i < firstDay; i++) {
									calendar.append($('<div>').addClass('calendar-date'));
								}
								
								for (let date = 1; date <= lastDate; date++) {
									let calendarDate = $('<div>').addClass('calendar-date').text(date);
									let fullDate = new Date(year, month, date);

									if (fullDate.getDay() === 0) {
										calendarDate.addClass('sunday');
									}

									if (date === today.getDate() && month === today.getMonth() && year == today.getFullYear()) {
										calendarDate.addClass('today').html(date + '<br />서로의 첫인상');
									}

									calendar.append(calendarDate);
								}
								
								$(container).append(calendar);
							}
							
							function render() {
								renderCalendar('#made-calederCover', currentMonth);
								
								$('#made-calederCover .calendar').on('click', '.calendar-date', () => {
									$('#made-detailQ').css('display', 'block');
									$('#made-cover').css('display', 'block');
									$('body').css('overflow', 'hidden');
								});

								$('#made-cover').on('click', () => {
									$('#made-detailQ').css('display', '');
									$('#made-cover').css('display', '');
									$('body').css('overflow', '');
								});

								$('#made-x').on('click', () => {
									$('#made-detailQ').css('display', '');
									$('#made-cover').css('display', '');
									$('body').css('overflow', '');
								});
							}

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

							render();
						});
					</script>
				</div>
			</div>
		</div>

		<div id="made-detailQ">
			<div id="made-x" class="material-symbols-outlined">close</div>
			<div id="made-q">
				Q. 서로의 첫인상
			</div>
			<br>
			<div id="made-manAnswer">유진 : 아직 답변을 등록하지 않았습니다.</div>
			<div id="made-womanAnswer">애신 : 사랑</div>
		</div>

		<div id="made-cover"></div>
	</div>
	<!-- fh5co-blog-section -->
	
	
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>