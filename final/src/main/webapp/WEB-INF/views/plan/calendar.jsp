<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js'></script>
	<script src='https://cdn.jsdelivr.net/npm/@fullcalendar/google-calendar@6.1.15/index.global.min.js'></script>
	<style>

		option:hover {
			opacity: .5 !important;
		}


		.modal td{
			padding: 10px !important;
		}

		.modal td:first-child{
			text-align: right;
		}

		.fc-toolbar-chunk:nth-child(2){
			display: flex;
		}

	</style>
	<script>
		// ----------------------- full calendar -----------------------
		let calendar;
		document.addEventListener('DOMContentLoaded', function() {
			const calendarEl = document.getElementById('calendar');
			calendar = new FullCalendar.Calendar(calendarEl, {
				locale: 'ko', // 언어 설정
				customButtons: { // 커스텀 버튼
					both: {
						text: '우리일정',
						click: function() {
								alert('clicked the both button!');
						}
					},
					mine: {
						text: '내일정',
						click: function() {
								alert('clicked the mine button!');
						}
					},
					partner: {
						text: '상대방일정',
						click: function() {
								alert('clicked the partner button!');
						}
					},
				},
				headerToolbar: { // 헤더 버튼 구성 설정
					left: 'both,mine,partner today',
					center: 'prev title next',
					right: 'multiMonthYear,dayGridMonth,timeGridWeek,timeGridDay listMonth',
				},
				buttonText: { // 버튼 이름 바꾸기
					today: '오늘',
					year: '년',
					month: '월',
					week: '주',
					day:'일',
					list: '목록(월)',
				},
				initialDate: new Date().toISOString().split('T')[0], // 초기값:오늘날짜로 지정 => '2024-10-07'
				navLinks: true, // can click day/week names to navigate views
				selectable: true,
				selectMirror: true,
				select: function(arg) { // 달력 빈공간 클릭시
					clickCalendar(arg);
					calendar.unselect();
				},
				eventClick: function(arg) { // 달력 일정 클릭시
					clickSchedule(arg);
				},
				editable: true,
				dayMaxEvents: true, // allow "more" link when too many events
				height: 'auto', // 스크롤 없앰
				// ----------------------- google calendar -----------------------
				googleCalendarApiKey: '',
				events: {
					googleCalendarId: '',
				},
			});
		
			calendar.render();
		})
	</script>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="../common/menubar.jsp"/>
	<script>
		// 메뉴바에 클릭된 메뉴 하이라이트
		$(()=>{ $(".nav-header #menubar_plan").addClass("active"); })
		$(()=>{ $(".nav-header #menubar_calendar").addClass("active"); })
	</script>

	<!-- 내용 -->
	<div id="fh5co-couple" class="fh5co-section-gray" style="padding-bottom: 0;">
		<div class="container">
			<div class="row animate-box">
				<div class="col-md-8 col-md-offset-2">
					<div class="col-md-12 text-center heading-section" style="margin-bottom:0; padding-bottom: 0;">
						<h2 style="margin-bottom: 0;">📅 커플 캘린더</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<!-- full calendar -->
				<div id='calendar' style="padding: 30px; background-color: #F6FAF7;"></div>
			</div>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>


	<!-- ---------------------------------------- Modal ---------------------------------------- -->

	<!-- 추가용 Modal -->
	<div class="modal fade" id="addModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content" style="padding-top: 10px;">
				<form class="form-inline">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" style="font-size: 30px;">&times;</button>
						<h3 class="modal-title">일정 추가</h3>
					</div>
					<div class="modal-body">
						<div class="form-group" style="width: 100%;">
							<table style="width: 95%;">
								<tr>
									<td>제목 :</td>
									<td><input type="text" class="form-control" id="title" placeholder="제목을 입력해주세요." style="width: 100%;"></td>
								</tr>
								<tr>
									<td>시작 :</td>
									<td>
										<input type="date" class="form-control" id="startDate">
										<input type="time" class="form-control" id="startTime">
									</td>
								</tr>
								<tr>
									<td>종료 :</td>
									<td>
										<input type="date" class="form-control" id="endDate">
										<input type="time" class="form-control" id="endTime">
									</td>
								</tr>
								<tr>
									<td>캘린더 :</td>
									<td>
										<select name="calendarNo" id="calendarNo" class="form-control" >
											<option value="both">우리일정</option>
											<option value="mine">내일정</option>
											<option value="partner">상대방일정</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>색상 :</td>
									<td>
										<select id="color" class="form-control">
											<option value="#3788d8" style="background: #3788d8;"></option>
											<option value="rgb(247, 120, 120)" style="background: rgb(247, 120, 120);"></option>
											<option value="rgb(253, 204, 113)" style="background: rgb(253, 204, 113);"></option>
											<option value="rgb(95, 180, 95)" style="background: rgb(95, 180, 95);"></option>
											<option value="rgb(120, 120, 247)" style="background: rgb(120, 120, 247);"></option>
											<option value="rgb(236, 154, 236)" style="background: rgb(236, 154, 236);"></option>
										</select>
									</td>
								</tr>
								<tr>
									<td>상세내용 :</td>
									<td><textarea id="content" class="form-control" style="width:100%; height:100px; resize:none;"></textarea></td>
								</tr>
							</table>

							<script>
								// Set initial color based on the selected option
								const colorSelect = document.getElementById('color');
								colorSelect.style.backgroundColor = colorSelect.value;

								// Update background color when a new color is selected
								colorSelect.addEventListener('change', function () {
									colorSelect.style.backgroundColor = this.value;
								});
							</script>
						</div>
					</div>
					<div class="modal-footer" style="display: flex; align-items: center; justify-content: center;">
						<button type="button" class="btn btn-primary btn-block" onclick="addSchedule();" style="width: 100px; height: 50px; margin-right: 10px;">추가</button>
					</div>
				</form>
			</div>
		</div>
	</div> <!-- 추가용 Modal -->


	<!-- 수정용 Modal -->
	<div class="modal fade" id="editModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content" style="padding-top: 10px;">
				<form class="form-inline">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" style="font-size: 30px;">&times;</button>
						<h3 class="modal-title">일정 수정</h3>
					</div>
					<div class="modal-body">
						<div class="form-group" style="width: 100%;">
							<table style="width: 95%;">
								<tr>
									<td>제목 :</td>
									<td><input type="text" class="form-control" id="edit-title" placeholder="제목을 입력해주세요." style="width: 100%;"></td>
								</tr>
								<tr>
									<td>시작일 :</td>
									<td>
										<input type="date" class="form-control" id="edit-startDate">
										<input type="time" class="form-control" id="edit-startTime">
									</td>
								</tr>
								<tr>
									<td>종료일 :</td>
									<td>
										<input type="date" class="form-control" id="edit-endDate">
										<input type="time" class="form-control" id="edit-endTime">
									</td>
								</tr>
								<tr>
									<td>색상 :</td>
									<td>
										<select id="edit-color" style="padding: 10px;">
											<option value="skyblue" style="background: skyblue;">하늘색</option>
											<option value="red" style="background: red;">빨간색</option>
											<option value="orange" style="background: orange;">주황색</option>
											<option value="green" style="background: green;">초록색</option>
											<option value="blue" style="background: blue;">파랑색</option>
											<option value="purple" style="background: purple;">보라색</option>
										</select>
									</td>
								</tr>
							</table>
						</div>
					</div>
					<div class="modal-footer" style="display: flex; align-items: center; justify-content: center;">
						<button type="button" class="btn btn-primary btn-block" id="editBtn" style="width: 100px; height: 50px; margin-right: 10px;">수정</button>
						<button type="button" class="btn btn-secondary btn-block" id="deleteBtn" style="width: 100px; height: 50px; margin-top: 0;">삭제</button>
					</div>
				</form>
			</div>
		</div>
	</div> <!-- 수정용 Modal -->



	<!-- ---------------------------------------- html 끝 ---------------------------------------- -->

	

	<script>
		$(function(){
			// 현재 '달' 데이터 가져오기
			selectScheduleList(getCurrentYearMonth());
			
			// '달'이 바뀌었을때 해당 달 데이터 가져오기
			calendar.on('datesSet', function(info) {
				selectScheduleList(getCurrentYearMonth());
			});
		})

		// ----------------------- 현재 달 구하기 -----------------------
		function getCurrentYearMonth(){
			let currentDate = calendar.getDate();
			let currentYear = currentDate.getFullYear();
			let currentMonth = String(currentDate.getMonth() + 1);
			let currentYearMonth = currentYear + "-" + currentMonth.padStart(2, '0') + "-01";
			return currentYearMonth;
		}
		

		// ----------------------- 달력 빈공간 클릭시 -----------------------
		function clickCalendar(arg){
			// 모달 띄우기
			$("#addModal").modal("show");
			
			// 클릭된 날짜 모달에 반영
			$("#startDate").val(arg.startStr);
			$("#endDate").val(arg.endStr);
		}

		// ----------------------- 일정 클릭시 -----------------------
		function clickSchedule(arg){
			let currentEvent = arg.event; // Store the currently selected event

			// 모달 띄우기
			$("#editModal").modal("show");
			$("#edit-title").val(currentEvent.title);

			let startStr = arg.event.startStr;
			let endStr = arg.event.endStr;

			const [startDate, startTime] = startStr.split(/[T+]/);
			const [endDate, endTime] = endStr.split(/[T+]/);

			$("#edit-startDate").val(startDate);
			$("#edit-endDate").val(endDate);
			$("#edit-startTime").val(startTime);
			$("#edit-endTime").val(endTime);
		}

		// ----------------------- DB에서 일정가져오기 -----------------------
		function selectScheduleList(yearMonth){
			$.ajax({
				url:"slist.pl",
				data:{
					yearMonth:yearMonth,
				},
				success:function(list){
					// console.log(list);

					const events = list.map(item => ({
						title: item.scheduleTitle,        
						start: item.startDate,
						end: item.endDate,
						color: item.color,
					}));

					// Clear previous events if needed
					calendar.getEvents().forEach(event => event.remove());

					// Add events to FullCalendar
					calendar.addEventSource(events);
							
				}, error:function(){
					console.log("일정조회용 ajax 통신 실패");
				}
			})
		}

		// ----------------------- 일정 추가 (Front-end) -----------------------
		function addSchedule(){
			let start = $("#startDate").val();
			let end = $("#endDate").val();

			if($("#startTime").val().trim().length != 0){
				start += "T" + $("#startTime").val();
			}
			if($("#endTime").val().trim().length != 0){
				end += "T" + $("#endTime").val();
			}

			var eventData = {
				title: $("#title").val(),
				start: start,
				end: end,
				color: $("#color").val(),
			};
			
			if (eventData.title == "" || eventData.start == "" || eventData.end == "") { //빈값입력시 오류
				alert("입력하지 않은 값이 있습니다.");
			} else if ($("#start").val() > $("#end").val()) { //끝나는 날짜가 시작하는 날짜보다 값이 크면 안됨
				alert("시간을 잘못입력 하셨습니다.");
			} else { // 정상 => 이벤트 추가
				calendar.addEvent(eventData);
				insertSchedule();
				$("#addModal").modal("hide");
				$("#title").val("");
				$("#startDate").val("");
				$("#endDate").val("");
				$("#startTime").val("");
				$("#endTime").val("");
			}
		}

		// ----------------------- 일정 추가 (DB) -----------------------
		function insertSchedule(){
			let start = $("#startDate").val();
			let end = $("#endDate").val();

			if($("#startTime").val().trim().length != 0){
				start += "T" + $("#startTime").val();
			}
			if($("#endTime").val().trim().length != 0){
				end += "T" + $("#endTime").val();
			}
			
			$.ajax({
				url:"sinsert.pl",
				data:{
					calendarNo : 1, // 임시
					scheduleTitle : $("#title").val(),
					scheduleContent : "내용자리(임시 데이터)",
					startDate : start,
					endDate : end,
					writerEmail : '${loginUser.email}',
					color : $("#color").val(),
					isAnniversary : "n", // 임시
					//alertDate : "null", // 임시
				}, success:function(status){
					console.log(status);
				}, error:function(){
					console.log("일정 추가용 ajax 통신 실패!");
				}
			})
		}
		

		// Add event for edit button
		document.getElementById('editBtn').addEventListener('click', function() {
				const title = $("#edit-title").val();
				const startDate = $("#edit-startDate").val();
				const startTime = $("#edit-startTime").val();
				const endDate = $("#edit-endDate").val();
				const endTime = $("#edit-endTime").val();

				// Update the event with new data
				currentEvent.setProp('title', title);
				currentEvent.setStart(`${startDate}T${startTime}`);
				currentEvent.setEnd(`${endDate}T${endTime}`);

				// Close the modal
				$("#editModal").modal("hide");
		});

		// Add event for delete button
		document.getElementById('deleteBtn').addEventListener('click', function() {
			if (confirm('해당 일정을 삭제하시겠습니까?')) {
				currentEvent.remove(); // Remove the event from the calendar
				$("#editModal").modal("hide"); // Close the modal
			}
		});



	</script>
</body>
</html>