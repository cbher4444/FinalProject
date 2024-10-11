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
				select: function(arg) { // 달력 빈공간 클릭시 -> 일정추가 modal
					showAddModal(arg);
					calendar.unselect();
				},
				eventClick: function(arg) { // 달력 일정 클릭시 -> 일정수정 modal
					showEditModal(arg);
				},
				editable: true,
				dayMaxEvents: true, // allow "more" link when too many events
				height: 'auto', // 스크롤 없앰
				viewDidMount: function() {
					// '우리일정'버튼에 active 클래스 추가
					const buttonGroup = document.querySelector(".fc-button-group");
					if (buttonGroup) {
						const firstButton = buttonGroup.querySelector("button");
						if (firstButton) {
							firstButton.classList.add("fc-button-active");
						}
					}
    			},
				// ----------------------- google calendar -----------------------
				// 작동 잘됨. 나중에 주석 풀어주기~
				// googleCalendarApiKey: 'apikey',
				// events: {
				// 	googleCalendarId: 'calendarid',
				// },
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
									<td>* 제목 :</td>
									<td><input type="text" class="form-control" id="title" placeholder="제목을 입력해주세요." style="width: 100%;"></td>
								</tr>
								<tr>
									<td>* 시작 :</td>
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
											<option id="bothCalendarNo" value="">우리일정</option>
											<option id="myCalendarNo" value="">내일정</option>
											<option id="partnerCalendarNo" value="">상대방일정</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>색상 :</td>
									<td>
										<select id="color" class="form-control">
											<option value="#3788d8">파랑</option>
											<option value="rgb(247, 120, 120)">빨강</option>
											<option value="rgb(253, 204, 113)">노랑</option>
											<option value="rgb(95, 180, 95)">초록</option>
											<option value="rgb(120, 120, 247)">보라</option>
											<option value="rgb(236, 154, 236)">핑크</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>상세내용 :</td>
									<td><textarea id="content" class="form-control" style="width:100%; height:100px; resize:none;"></textarea></td>
								</tr>
								<tr>
									<td>알림 :</td>
									<td>
										<input type="datetime-local" class="form-control" id="alertDate">
									</td>
								</tr>
							</table>
						</div>
					</div>
					<div class="modal-footer" style="display: flex; align-items: center; justify-content: center;">
						<button type="button" class="btn btn-primary btn-block" onclick="addEventToFullCalendar();" style="width: 100px; height: 50px; margin-right: 10px;">추가</button>
						<button type="reset" class="btn btn-secondary btn-block" style="width: 100px; height: 50px;">초기화</button>
					</div>
				</form>
			</div>
		</div>
	</div>

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
									<td>* 제목 :</td>
									<td><input type="text" class="form-control" id="edit-title" placeholder="제목을 입력해주세요." style="width: 100%;"></td>
								</tr>
								<tr>
									<td>* 시작 :</td>
									<td>
										<input type="date" class="form-control" id="edit-startDate">
										<input type="time" class="form-control" id="edit-startTime">
									</td>
								</tr>
								<tr>
									<td>종료 :</td>
									<td>
										<input type="date" class="form-control" id="edit-endDate">
										<input type="time" class="form-control" id="edit-endTime">
									</td>
								</tr>
								<tr>
									<td>캘린더 :</td>
									<td>
										<select name="calendarNo" id="edit-calendarNo" class="form-control" >
											<option id="edit-bothCalendarNo" value="">우리일정</option>
											<option id="edit-myCalendarNo" value="">내일정</option>
											<option id="edit-partnerCalendarNo" value="">상대방일정</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>색상 :</td>
									<td>
										<select id="edit-color" class="form-control">
											<option value="#3788d8">파랑</option>
											<option value="rgb(247, 120, 120)">빨강</option>
											<option value="rgb(253, 204, 113)">노랑</option>
											<option value="rgb(95, 180, 95)">초록</option>
											<option value="rgb(120, 120, 247)">보라</option>
											<option value="rgb(236, 154, 236)">핑크</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>상세내용 :</td>
									<td><textarea id="edit-content" class="form-control" style="width:100%; height:100px; resize:none;"></textarea></td>
								</tr>
								<tr>
									<td>알림 :</td>
									<td>
										<input type="datetime-local" class="form-control" id="edit-alertDate">
									</td>
								</tr>
							</table>
						</div>
					</div>
					<div class="modal-footer" style="display: flex; align-items: center; justify-content: center;">
						<button type="button" class="btn btn-primary btn-block" onclick="" style="width: 100px; height: 50px; margin-right: 10px;">수정</button>
						<button type="reset" class="btn btn-secondary btn-block" onclick="" style="width: 100px; height: 50px;">삭제</button>
					</div>
				</form>
			</div>
		</div>
	</div>



	<!-- ---------------------------------------- html 끝 ---------------------------------------- -->

	

	<script>
		$(".fc-button-group button:first-child").addClass("fc-button-active");

		// ----------------------- 페이지 로딩후 기본 실행 -----------------------
		$(function(){
			selectCalendarList() // 캘린더 리스트 가져오기
			selectScheduleList(); // 현재 '달' 데이터 가져오기
			
			// '달'이 바뀌었을때 해당 달 데이터 가져오기
			calendar.on('datesSet', function(info) {
				selectScheduleList();
			});

			// Attach reset function to modal close event
			$('#addModal').on('hide.bs.modal', resetAddModal);
		})

		// ----------------------- DB에서 캘린더 가져오기 -----------------------
		function selectCalendarList(){
			$.ajax({
				url:"clist.pl",
				data:{
					coupleCode: '${loginUser.coupleCode}',
				},
				success:function(list){
					// console.log(list);
					setCalendarNo(list);
				}, error:function(){
					console.log("캘린더 조회용 ajax 통신 실패");
				}
			})
		}

		// ----------------------- 캘린더 번호 세팅하기 -----------------------
		function setCalendarNo(list){
			for (let i in list) {
				let item = list[i];
				if (item.owner === 'BOTH') {
					$("#bothCalendarNo").val(item.calendarNo);
					// $('button[title="우리일정"]').css('background-color', item.defaultColor);
				}else if(item.owner === '${loginUser.email}'){
					$("#myCalendarNo").val(item.calendarNo);
					// $('button[title="내일정"]').css('background-color', item.defaultColor);
				}else {
					$("#partnerCalendarNo").val(item.calendarNo);
					// $('button[title="상대방일정"]').css('background-color', item.defaultColor);
				}
			};
		}

		// ----------------------- DB에서 일정 가져오기 -----------------------
		function selectScheduleList(){
			$.ajax({
				url:"slist.pl",
				data:{
					coupleCode: '${loginUser.coupleCode}',
					yearMonth: getCurrentYearMonth(),
				},
				success:function(list){
					// console.log(list);

					const events = list.map(item => ({
						id: item.scheduleNo,
						title: item.title,
						start: item.startTime ? item.startDate + "T" + item.startTime : item.startDate,
						end: item.endTime ? item.endDate + "T" + item.endTime : item.endDate,
						color: item.color,
					}));

					// console.log(events);

					calendar.getEvents().forEach(event => event.remove()); // Clear previous events if needed
					calendar.addEventSource(events); // Add events to FullCalendar

				}, error:function(){
					console.log("일정 조회용 ajax 통신 실패");
				}
			})
		}

		// ----------------------- 현재 달 구하기 -----------------------
		function getCurrentYearMonth(){
			let currentDate = calendar.getDate();
			let currentYear = currentDate.getFullYear();
			let currentMonth = String(currentDate.getMonth() + 1);
			let currentYearMonth = currentYear + "-" + currentMonth.padStart(2, '0') + "-01";
			return currentYearMonth;
		}

		// ----------------------- 달력 빈공간 클릭시 -> 일정추가 modal -----------------------
		function showAddModal(arg){
			// 모달 띄우기
			$("#addModal").modal("show");
			
			// 클릭된 날짜 모달에 반영
			$("#startDate").val(arg.startStr);

			// 하루만 클릭된 경우는 값을 종료일 안넣어줌. 2일 이상 드래그 해서 선택한경우만 종료일+1일로 넣어줌.
			if(arg.start.getDate() + 1 !== arg.end.getDate()) {
				$("#endDate").val(arg.endStr);
			}
		}
		
		// ----------------------- 일정 추가 modal 리셋 -----------------------
		function resetAddModal() {
			// Clear all input fields in the modal
			$("#title").val("");
			$("#startDate").val("");
			$("#startTime").val("");
			$("#endDate").val("");
			$("#endTime").val("");
			$("#calendarNo").val($("#bothCalendarNo").val());
			$("#color").val($("#color option:first-child").val());
			$("#content").val("");
			$("#alertDate").val("");
		}

		// ----------------------- 일정 추가 (Full-Calendar) -----------------------
		function addEventToFullCalendar(){
			// let start = $("#startDate").val();
			// let end = $("#endDate").val();

			// if($("#startTime").val().length != 0){ // 시작시간을 입력한 경우
			// 	start += "T" + $("#startTime").val();
			// }
			
			// if($("#endTime").val().length != 0){ // 종료시간을 입력한 경우
			// 	if(end.length === 0) { // 종료시간은 입력했는데 종료날짜는 입력 안한경우
			// 		$("#endDate").val($("#startDate").val()); // 시작날짜로 세팅
			// 	}
			// 	end = $("#endDate").val() + "T" + $("#endTime").val();
			// }

			// var eventData = {
			// 	title: $("#title").val(),
			// 	start: start,
			// 	end: end,
			// 	color: $("#color").val(),
			// };
			// console.log(eventData);
			
			// if (eventData.title == "") { //  제목 미입력시
			if ($("#title").val() == "") { //  제목 미입력시
				alert("제목을 입력해주세요.");
				$("#title").focus();
				return;
			// } else if (eventData.start == "") {  // 시작일 미입력시
			} else if ($("#startDate").val() == "") {  // 시작일 미입력시
				alert("시작일을 입력해주세요.");
				$("#startDate").focus();
				return;
			} else if ($("#endDate").val().length !== 0 && $("#startDate").val() > $("#endDate").val()) { // 끝나는 날짜가 시작하는 날짜보다 값이 크면 안됨
				alert("종료일이 잘못되었습니다. 시작일과 같거나 커야합니다.");
				$("#endDate").focus();
				return;
			} else if ($("#startDate").val() === $("#endDate").val() && $("#startTime").val() > $("#endTime").val()) { // 시작&끝 날짜 같은데 시작시간이 끝나는시간보다 빠른경우.
				alert("종료시간이 잘못되었습니다. 시작시간보다 같거나 커야합니다.");
				$("#endTime").focus();
				return;
			} else { // 정상 => 이벤트 추가
				// calendar.addEvent(eventData); // Full-Calendar
				insertSchedule(); // db에 추가
				$("#addModal").modal("hide");
				resetAddModal(); // input 초기화
			}
		}

		// ----------------------- 일정 추가 (DB) -----------------------
		function insertSchedule(){
			$.ajax({
				url:"sinsert.pl",
				data:{
					title : $("#title").val(),
					startDate : $("#startDate").val(),
					startTime : $("#startTime").val(),
					endDate : $("#endDate").val(),
					endTime : $("#endTime").val(),
					calendarNo : $("#calendarNo").val(),
					color : $("#color").val(),
					content : $("#content").val(),
					alertDate : $("#alertDate").val(),
					writer : '${loginUser.email}',
				}, success:function(status){
					// console.log(status);
					selectScheduleList();
				}, error:function(){
					console.log("일정 추가용 ajax 통신 실패!");
				}
			})
		}
		

		// ----------------------- 일정 클릭시 -> 일정수정 modal -----------------------
		function showEditModal(arg){
			let currentEvent = arg.event; // Store the currently selected event

			$("#edit-title").val(currentEvent.title);

			let startStr = arg.event.startStr;
			let endStr = arg.event.endStr;

			const [startDate, startTime] = startStr.split(/[T+]/);
			const [endDate, endTime] = endStr.split(/[T+]/);

			$("#edit-startDate").val(startDate);
			$("#edit-endDate").val(endDate);
			$("#edit-startTime").val(startTime);
			$("#edit-endTime").val(endTime);

			// 모달 띄우기
			$("#editModal").modal("show");
		}


		// Add event for edit button
		// document.getElementById('editBtn').addEventListener('click', function() {
		// 		const title = $("#edit-title").val();
		// 		const startDate = $("#edit-startDate").val();
		// 		const startTime = $("#edit-startTime").val();
		// 		const endDate = $("#edit-endDate").val();
		// 		const endTime = $("#edit-endTime").val();

		// 		// Update the event with new data
		// 		currentEvent.setProp('title', title);
		// 		currentEvent.setStart(`${startDate}T${startTime}`);
		// 		currentEvent.setEnd(`${endDate}T${endTime}`);

		// 		// Close the modal
		// 		$("#editModal").modal("hide");
		// });

		// Add event for delete button
		// document.getElementById('deleteBtn').addEventListener('click', function() {
		// 	if (confirm('해당 일정을 삭제하시겠습니까?')) {
		// 		currentEvent.remove(); // Remove the event from the calendar
		// 		$("#editModal").modal("hide"); // Close the modal
		// 	}
		// });



	</script>
</body>
</html>