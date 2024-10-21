<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">

      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'category');
        data.addColumn('number', 'Slices');
        data.addRows([
          ['외식비용', 9],
          ['활동비용', 1]
        ]);

        // Set chart options
        var options = {'width':700,
                       'height':700};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
	<style>
		#fh5co-guest {
			background: #F6FAF7;
		}

		* {
			box-sizing: border-box;
		}

		#made-defaultCategory {
			width: 100%;
			display: flex;
		}

		.defaultCategory {
			width: 300px;
			margin: 0 auto;
			border: 1px solid #00000030;
			border-radius: 10px;
		}
 
		.headBtn {
			margin: 5px 10px 0px 10px;
			padding: 0 10px;
			border-radius: 10px 10px 0 0;
			cursor: pointer;
		}

		.select {
			border-bottom: 3px solid #F69D9D;
		}

		.made-head {
			display: flex;
			border-bottom: 1px solid #00000030;
		}

		.made-content-mini {
			min-height: 170px;
			border-radius: 0 0 10px 10px;
			display: none;
			padding: 10px;
		}

		.made-content-big {
			min-height: 300px;
			display: none;
			padding: 10px;
		}

		.selectContent {
			display: block;
		}

		#made-calederCover {
			display: flex;
		}

		#made-calederCover > .calendar {
			display: flex;
			flex-wrap: wrap;
			width: calc(140px * 7 + 20px * 2 + 2px);
			margin: auto;
			border: 1px solid #00000030;
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
			width: 140px;
			height: 30px;
			text-align: center;
			padding-left: 10px;
		}

		#made-calederCover > .calendar > .calendar-date {
			width: 140px;
			height: 120px;
			padding: 10px;
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

		#made-calBtns {
			width: calc(140px * 7 + 20px * 2 + 2px);
			margin: 0 auto;
			display: flex;
			justify-content: end;
		}

		#add {
			position: absolute;
			top: 0;
			right: 0;
			width: 33px;
			text-align: center;
			font-size: 24px;
			-webkit-user-select:none;
            -moz-user-select:none;
            -ms-user-select:none;
            user-select:none;
			cursor: pointer;
		}

		#add:hover {
			color: #F69D9D;
		}

		#made-head4 {
			position: relative;
		}

		#coverALL {
			background-color: #00000080;
			width: 100%;
			height: 100%;
			position: fixed;
			top: 0;
			z-index: 9999;
		}

		#addBudgetPopup {
			width: 700px;
			height: 900px;
			top: 0;
			bottom: 0;
			right: 0;
			left: 0;
			margin: 0;
			margin: auto;
			background-color: white;
			position: fixed;
			z-index: 10000;
		}

		#tableTT {
			width: 100%;
			height: 90%;
			margin-top: 5%;
		}

		#tableTT .title {
			text-align: center;
			width: 200px;
		}

		select {
			height: 30px;
		}
		
		label {
			margin-right: 10px;
		}
	</style>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="../common/menubar.jsp"/>
	<script>
		// 메뉴바에 클릭된 메뉴 하이라이트
		$(()=>{ $(".nav-header #menubar_budget").addClass("active"); })
	</script>

	<!-- 내용 -->
	<div id="fh5co-guest">
		<div class="container">
			<div class="row animate-box">
				<div class="col-md-8 col-md-offset-2 text-center heading-section">
					<h2>Couple Budget</h2>
				</div>
			</div>
			<div class="row">
				<div id="made-defaultCategory">
					<!-- 총 수입 및 지출 -->
					<div id="made-total" class="defaultCategory">
						<div id="made-head1" class="made-head">
							<div id="made-head1Btn1" class="headBtn select">총 수입</div>
							<div id="made-head1Btn2" class="headBtn">총 지출</div>
						</div>
						<div id="made-content-mini1-1" name="made-head1Btn1" class="made-content-mini selectContent">
							1
						</div>
						<div id="made-content-mini1-2" name="made-head1Btn2" class="made-content-mini">
							2
						</div>
					</div>
					
					<!-- 정기 / 변동 / 할부 지출 -->
					<div id="made-spend" class="defaultCategory">
						<div id="made-head2" class="made-head">
							<div id="made-head2Btn1" class="headBtn select">정기 지출</div>
							<div id="made-head2Btn2" class="headBtn">변동 지출</div>
							<div id="made-head2Btn3" class="headBtn">할부 지출</div>
						</div>
						<div id="made-content-mini2-1" name="made-head2Btn1" class="made-content-mini selectContent">
							11
						</div>
						<div id="made-content-mini2-2" name="made-head2Btn2" class="made-content-mini">
							22
						</div>
						<div id="made-content-mini2-3" name="made-head2Btn3" class="made-content-mini">
							33
						</div>
					</div>
					
					<!-- 계좌 / 카드 / 현금 지출 -->
					<div id="made-spendMethod" class="defaultCategory">
						<div id="made-head3" class="made-head">
							<div id="made-head3Btn1" class="headBtn select">계좌 지출</div>
							<div id="made-head3Btn2" class="headBtn">카드 지출</div>
							<div id="made-head3Btn3" class="headBtn">현금 지출</div>
						</div>
						<div id="made-content-mini3-1" name="made-head3Btn1" class="made-content-mini selectContent">
							111
						</div>
						<div id="made-content-mini3-2" name="made-head3Btn2" class="made-content-mini">
							222
						</div>
						<div id="made-content-mini3-3" name="made-head3Btn3" class="made-content-mini">
							333
						</div>
					</div>
				</div>

				<div id="made-choiceCategory">
					<div id="made-head4" class="made-head">
						<div id="made-head4Btn1" class="headBtn select">리스트</div>
						<div id="made-head4Btn2" class="headBtn">캘린더</div>
						<div id="made-head4Btn3" class="headBtn">카테고리</div>
						<div id="add">+</div>
					</div>
					<div id="made-content">
						<!-- 리스트 -->
						<div id="made-content-big1" name="made-head4Btn1" class="made-content-big selectContent">
							<iframe src="goList?coupleCode=${ loginUser.coupleCode }" frameborder="0" width="100%" height="1100" id="myiframe"></iframe>
							<script>
								$(() => {
									let iframe = document.getElementById('myiframe');
									window.addEventListener('message', function(e) {
										let message = e.data;
										iframe.style.height = message.height + 10 + "px";
									} , false);
								})
							</script>
						</div>
						
						<!-- 캘린더 -->
						<div id="made-content-big2" name="made-head4Btn2" class="made-content-big">
							<div id="made-calBtns">
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
													calendarDate.addClass('today').html(date + '<br /><br /><p style="color: #ff1717">+ 3,000,000</p><p style="color: #2727d3">- 1,000,000</p>');
												}
			
												calendar.append(calendarDate);
											}
											
											$(container).append(calendar);
										}
			
										$('#made-next').on('click', function() {
											currentMonth.setMonth(currentMonth.getMonth() + 1);
											renderCalendar('#made-calederCover', currentMonth);
										});

										$('#made-today').on('click', function() {
											currentMonth = new Date(today.getFullYear(), today.getMonth(), 1);
											renderCalendar('#made-calederCover', currentMonth);
										});

										$('#made-prev').on('click', function() {
											currentMonth.setMonth(currentMonth.getMonth() - 1);
											renderCalendar('#made-calederCover', currentMonth);
										});
			
										renderCalendar('#made-calederCover', currentMonth);
									});
								</script>
							</div>
						</div>
						
						<!-- 카테고리별 -->
						<div id="made-content-big3" name="made-head4Btn3" class="made-content-big">
							<div id="chart_div"></div>
						</div>
					</div>
				</div>

				<script>
					$(() => {
						$('.headBtn').on('click', (event) => {
								const targetId = $(event.target).attr('id');

								// 선택된 헤드 버튼을 처리 
								$(event.target).closest('.made-head').children('.select').removeClass('select');
								$(event.target).addClass('select');

								// 해당되는 미니 컨텐츠 처리
								$(event.target).closest('.defaultCategory').children('.selectContent').removeClass('selectContent');
								$('.made-content-mini[name=' + targetId + ']').addClass('selectContent');

								// 해당되는 빅 컨텐츠 처리
								if ($('.made-content-big[name=' + targetId + ']').length > 0) {
									$('#made-content').children('.selectContent').removeClass('selectContent');
									$('.made-content-big[name=' + targetId + ']').addClass('selectContent');
								}
							});

						$('#made-choiceCategory').css('margin', $('.defaultCategory').css('margin-left'));
					})
				</script>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>

	<div id="coverALL"></div>
	<div id="addBudgetPopup">
		<div id="cancleAdd" class="material-symbols-outlined">close</div>
		<table id="tableTT">
			<tbody>
				<tr>
					<td class="title">날짜</td>
					<td><input type="date" name="budgetDate" id="budgetDate"></td>
				</tr>
				<tr>
					<td class="title">적요</td>
					<td><input type="text" name="budgetBriefs" id="budgetBriefs"></td>
				</tr>
				<tr>
					<td class="title">금액</td>
					<td><input type="number" name="budgetHowMuch" id="budgetHowMuch"></td>
				</tr>
				<tr>
					<td class="title">통화</td>
					<td>
						<select name="budgetBalance" id="budgetBalance">
							<option value="₩">₩(원화)</option>
							<option value="￥(JPY)">￥(엔화)</option>
							<option value="¥(CNY)">¥(인민폐)</option>
							<option value="$">$(달러)</option>
							<option value="€">€(유로)</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="title">수입 / 지출</td>
					<td>
						<input type="radio" id="in" name="budgetInout">
						<label for="in">수입</label>
						<input type="radio" id="out" name="budgetInout">
						<label for="out">지출</label>
					</td>
				</tr>
				<tr>
					<td class="title">카테고리</td>
					<td>
						<select name="budgetCate" id="budgetCate">
							<option value="">외식</option>
							<option value="">데이트</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="title">결제 수단</td>
					<td>
						<input type="radio" id="K" name="budgetMethod">
						<label for="K">카드</label>
						<input type="radio" id="C" name="budgetMethod">
						<label for="C">현금</label>
						<input type="radio" id="A" name="budgetMethod">
						<label for="A">계좌이체</label>
					</td>
				</tr>
				<tr>
					<td class="title">메모</td>
					<td>
						<textarea name="budgetComm" id="budgetComm" style="resize: none;"></textarea>
					</td>
				</tr>
			</tbody>
		</table>

		<button>추가하기</button>
	</div>
</body>
</html>