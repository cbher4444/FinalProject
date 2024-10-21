<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js'></script>
	<script src='https://cdn.jsdelivr.net/npm/@fullcalendar/google-calendar@6.1.15/index.global.min.js'></script>
	<style>

		/* 모달 -> 요소 간격 띄우기*/
		.modal td{
			padding: 10px !important;
		}

		/* 모달 왼쪽열 -> 오른쪽 정렬*/
		.modal td:first-child{
			text-align: right;
		}

		/* 캘린더 중앙 날짜부분 -> 정렬 한줄로. ex) "<", "2024년 10월", ">" */
		.fc-toolbar-chunk:nth-child(2){
			display: flex;
		}

		/* 캘린더 각각의 뷰 -> 커서 포인터로 바꾸기 */
		.fc-daygrid-day-frame, /* 월 */
		.fc-scrollgrid-section-body, /* 주, 일 */
		.fc-list-event-title /* 목록 (일정제목)*/
		{
			cursor: pointer;
		}

		/* active된 버튼 위로 살짝 올리기 */
		.fc-button-group>.fc-button-active{
			transform: translateY(-10px) !important;
			transition-duration: .5s;
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
					all: {
						text: '모든일정',
						click: function() {
							onClickCalendarOption("all", this);
						}
					},
					both: {
						text: '우리일정',
						click: function() {
							onClickCalendarOption("both", this);
						}
					},
					mine: {
						text: '내일정',
						click: function() {
							onClickCalendarOption("mine", this);
						}
					},
					partner: {
						text: '상대방일정',
						click: function() {
							onClickCalendarOption("partner", this);
						}
					},
					calColor: {
						text: '캘린더 기본색상 변경',
						click: function() {
							$("#calColorModal").modal("show");
						}
					}
				},
				headerToolbar: { // 헤더 버튼 구성 설정
					left: 'all,both,mine,partner',
					center: 'prev title next',
					right: 'today multiMonthYear,dayGridMonth,timeGridWeek,timeGridDay listMonth',
				},
				footerToolbar: {
					left: 'calColor',
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
				eventClick: function(info) { // 달력 일정 클릭시 -> 일정수정 modal
					info.jsEvent.preventDefault(); // 구글일정링크 타지 않도록.
					if (info.event.url) { // url이 있는 경우 -> 구글 일정임!
						showGoogleModal(info);
					} else { // url 없는 경우 -> 우리 db에서 가져온 일정.
						showEditModal(info);
					}
				},
				//editable: true, // 드래그로 수정가능
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
					};
    			},
				// ----------------------- google calendar -----------------------
				googleCalendarApiKey: 'AIzaSyBZsgy3NZzVqBP7IX6HcjRHDtPU65xqMkQ', // 구글 api. 넣으면 공휴일도 보임!
				events: {
					googleCalendarId: 'ko.south_korea#holiday@group.v.calendar.google.com', // 한국 공휴일
				},
				eventColor: '#ff0000', // 빨간색
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
											<option id="myCalendarNo">내일정</option>
											<option id="bothCalendarNo">우리일정</option>
											<option id="partnerCalendarNo">상대방일정</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>색상 :</td>
									<td>
										<select id="color" class="form-control">
											<option value=""></option>
											<option value="#ff5733">주황</option>
											<option value="#fdcc71">노랑</option>
											<option value="#27ae60">초록</option>
											<option value="#3788d8">파랑</option>
											<option value="#7878f7">보라</option>
											<option value="#ec9aec">핑크</option>
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
						<button type="button" class="btn btn-primary btn-block" onclick="addScheduleValidate();" style="width: 100px; height: 50px; margin-right: 10px;">추가</button>
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
								<input type="hidden" id="edit-scheduleNo">
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
											<option id="edit-myCalendarNo">내일정</option>
											<option id="edit-bothCalendarNo">우리일정</option>
											<option id="edit-partnerCalendarNo">상대방일정</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>색상 :</td>
									<td>
										<select id="edit-color" class="form-control">
											<option value=""></option>
											<option value="#ff5733">주황</option>
											<option value="#fdcc71">노랑</option>
											<option value="#27ae60">초록</option>
											<option value="#3788d8">파랑</option>
											<option value="#7878f7">보라</option>
											<option value="#ec9aec">핑크</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>상세내용 :</td>
									<td><textarea id="edit-content" class="form-control" style="width:100%; height:100px; resize:none;"></textarea></td>
								</tr>
								<tr>
									<td>알림 :</td>
									<td><input type="datetime-local" class="form-control" id="edit-alertDate"></td>
								</tr>
								<tr>
									<td>작성자 :</td>
									<td><span id="edit-writerName"></span> <span id="edit-writer"></span><br></td>
								</tr>
								<tr>
									<td>작성일 :</td>
									<td><span id="edit-createDate"></span></td>
								</tr>
							</table>
						</div>
					</div>
					<div class="modal-footer" style="display: flex; align-items: center; justify-content: center;">
						<button type="button" class="btn btn-primary btn-block" onclick="editScheduleValidate()" style="width: 100px; height: 50px; margin-right: 10px;">수정</button>
						<button type="reset" class="btn btn-secondary btn-block" onclick="deleteScheduleValidate()" style="width: 100px; height: 50px;">삭제</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- 구글 일정 Modal -->
	<div class="modal fade" id="googleModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content" style="padding-top: 10px;">
				<form class="form-inline">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" style="font-size: 30px;">&times;</button>
						<h3 class="modal-title">일정 (from 구글 캘린더)</h3>
					</div>
					<div class="modal-body">
						<div class="form-group" style="width: 100%;">
							<table style="width: 95%;">
								<tr>
									<td>제목 :</td>
									<td><input type="text" class="form-control" id="google-title" style="width: 80%;" disabled></td>
								</tr>
								<tr>
									<td>일시 :</td>
									<td>
										<input type="date" class="form-control" id="google-startDate" disabled>
									</td>
								</tr>
								<tr>
									<td>캘린더 :</td>
									<td>
										<select name="calendarNo" class="form-control" disabled>
											<option>구글캘린더 (공휴일)</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>색상 :</td>
									<td>
										<select class="form-control" disabled>
											<option>빨강</option>
										</select>
									</td>
								</tr>
							</table>
						</div>
					</div>
					<div class="modal-footer" style="display: flex; align-items: center; justify-content: center;">
						* 구글캘린더의 일정은 조회만 가능합니다.
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- 캘린더 기본색상 변경 Modal -->
	<div class="modal fade" id="calColorModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content" style="padding-top: 10px;">
				<form class="form-inline">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" style="font-size: 30px;">&times;</button>
						<h3 class="modal-title">캘린더 기본색상 변경</h3>
					</div>
					<div class="modal-body">
						<div class="form-group" style="width: 100%;">
							<table style="width: 95%;">
								<tr>
									<td>우리일정 :</td>
									<td>
										<select id="ourCalendarColor" class="form-control">
											<option value="#ff5733">주황</option>
											<option value="#fdcc71">노랑</option>
											<option value="#27ae60">초록</option>
											<option value="#3788d8">파랑</option>
											<option value="#7878f7">보라</option>
											<option value="#ec9aec">핑크</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>내일정 :</td>
									<td>
										<select id="myCalendarColor" class="form-control">
											<option value="#ff5733">주황</option>
											<option value="#fdcc71">노랑</option>
											<option value="#27ae60">초록</option>
											<option value="#3788d8">파랑</option>
											<option value="#7878f7">보라</option>
											<option value="#ec9aec">핑크</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>상대방일정 :</td>
									<td>
										<select id="partnerCalendarColor" class="form-control">
											<option value="#ff5733">주황</option>
											<option value="#fdcc71">노랑</option>
											<option value="#27ae60">초록</option>
											<option value="#3788d8">파랑</option>
											<option value="#7878f7">보라</option>
											<option value="#ec9aec">핑크</option>
										</select>
									</td>
								</tr>
							</table>
						</div>
					</div>
					<div class="modal-footer" style="display: flex; align-items: center; justify-content: center;">
						<button type="button" class="btn btn-primary btn-block" onclick="updateCalendarColors();" style="width: 100px; height: 50px; margin-right: 10px;">수정</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- ---------------------------------------- html 끝 ---------------------------------------- -->

	

	<script>
		let scheduleList;
		let calendarNo_both;
		let calendarNo_mine;
		let calendarNo_partner;
		let currentCalendarNoList;

		initialSetting();

		// ----------------------- 초기 세팅 -----------------------
		async function initialSetting(){
			let calendarList = await selectCalendarList();
			setCalendarNo(calendarList);
			setCalendarNoList("all");
			fetchAndDisplaySchedule();

			// Attach reset function to modal close event
			$('#addModal').on('hide.bs.modal', resetAddModal);
		}

		async function fetchAndDisplaySchedule(){
			scheduleList = await selectScheduleList();
			// console.log(scheduleList);
			displayOnFullCalendar(scheduleList);
		}

		// ----------------------- DB에서 캘린더 가져오기 -----------------------
		function selectCalendarList(){
			return new Promise((resolve, reject) => {
				$.ajax({
					url:"clist.pl",
					data:{
						coupleCode: '${loginUser.coupleCode}',
					},
					success:function(list){
						// console.log(list);
						resolve(list);
					}, error:function(){
						reject(new Error('캘린더 조회용 ajax 통신 실패'));
					}
				})
			})
		}

		// ----------------------- 캘린더 번호 세팅하기 -----------------------
		function setCalendarNo(calendarList){
			for (let i in calendarList) {
				let item = calendarList[i];
				if (item.owner === 'BOTH') {
					calendarNo_both = item.calendarNo;
					$("#bothCalendarNo").val(item.calendarNo);
					$("#edit-bothCalendarNo").val(item.calendarNo);
					setCalendarBtnColor("우리일정", item.defaultColor);
					$('#ourCalendarColor').val(item.defaultColor); // 캘린더 기본색상 변경 모달
				}else if(item.owner === '${loginUser.email}'){
					calendarNo_mine = item.calendarNo;
					$("#myCalendarNo").val(item.calendarNo);
					$("#edit-myCalendarNo").val(item.calendarNo);
					setCalendarBtnColor("내일정", item.defaultColor);
					$('#myCalendarColor').val(item.defaultColor);
				}else {
					calendarNo_partner = item.calendarNo;
					$("#partnerCalendarNo").val(item.calendarNo);
					$("#edit-partnerCalendarNo").val(item.calendarNo);
					setCalendarBtnColor("상대방일정", item.defaultColor);
					$('#partnerCalendarColor').val(item.defaultColor);
				}
			};
		}

		// ----------------------- 캘린더 버튼에 기본배경색상 넣어주기 -----------------------
		function setCalendarBtnColor(btnText, defaultColor){
			let $button;
			let hoveredColor = "#02252F";

			switch(btnText) {
				case '우리일정':
					$button = $("button[title=우리일정]");
					break;
				case '내일정':
					$button = $("button[title=내일정]");
					break;
				case '상대방일정':
					$button = $("button[title=상대방일정]");
					break;
			}
			
			$button.css("background-color", defaultColor); // Default background
			$button.hover(
				function() {
					$(this).css("background-color", hoveredColor); // On hover
				},
				function() {
					$(this).css("background-color", defaultColor); // Back to default when not hovered
				}
			);
		}

		// ----------------------- DB에서 일정 가져오기 -----------------------
		function selectScheduleList(){
			return new Promise((resolve, reject) => {
				$.ajax({
					url:"slist.pl",
					data:{
						coupleCode: '${loginUser.coupleCode}',
						currentYear: new Date().getFullYear(),
						calendarNoList: currentCalendarNoList,
					},
					success:function(list){
						// console.log(list);
						resolve(list);
					}, error:function(){
						reject(new Error('일정 조회용 ajax 통신 실패'));
					}
				})
			})
		}

		// ----------------------- 선택된 캘린더번호에 대한 event 실행 -----------------------
		function onClickCalendarOption(option, el){
			setCalendarNoList(option);
			setActiveButton(el);
			fetchAndDisplaySchedule();
		}

		// -----------------------  현재 선택된 캘린더번호 버튼에 active 클래스 추가 -----------------------
		function setActiveButton(clickedButton) {
			const buttonGroup = document.querySelector(".fc-button-group");
			if (buttonGroup) {
				// Remove "fc-button-active" class from all buttons in the group
				buttonGroup.querySelectorAll("button").forEach(button => {
					button.classList.remove("fc-button-active");
				});
				// Add "fc-button-active" class to the clicked button
				clickedButton.classList.add("fc-button-active");
			}
		}

		// ----------------------- 현재 선택된 캘린더번호를 리스트에 보관. -----------------------
		function setCalendarNoList(option){
			switch (option) {
				case "all":
					currentCalendarNoList = [calendarNo_both, calendarNo_mine, calendarNo_partner];
					break;
				case "both":
					currentCalendarNoList = [calendarNo_both];
					break;
				case "mine":
					currentCalendarNoList = [calendarNo_mine];
					break;
				case "partner":
					currentCalendarNoList = [calendarNo_partner];
					break;
				default:
					console.log("setCalendarNoList(option) -> 잘못된 입력:" + option);
			}
		}

		// ----------------------- Full Calendar에 일정 표시하기 -----------------------
		function displayOnFullCalendar(list){
			const events = list.map(item => ({
							id: item.scheduleNo,
							title: item.title,
							start: item.startTime ? item.startDate + "T" + item.startTime : item.startDate,
							end: item.endTime ? item.endDate + "T" + item.endTime : item.endDate,
							color: item.color,
						}));
			// console.log(events);
			calendar.getEvents().forEach(event => {
				if(event.url.length == 0) {
					event.remove();
				}
			});  // Clear previous events
			calendar.addEventSource(events); // Add events to FullCalendar
		}

		// ----------------------- 달력 빈공간 클릭시 -> 일정추가 modal -----------------------
		function showAddModal(arg){
			let [startDate, startTime] = splitDateString(arg.startStr);
			let [endDate, endTime]  = splitDateString(arg.endStr);

			// 클릭된 날짜 모달에 반영
			$("#startDate").val(startDate);
			$("#startTime").val(startTime);

			// 하루만 클릭된 경우는 값을 종료일 안넣어줌. 2일 이상 드래그 해서 선택한경우만 종료일+1일로 넣어줌.
			// if(arg.start.getDate() + 1 !== arg.end.getDate()) {
			// 	$("#endDate").val(endDate);
			// }
			$("#endDate").val(endDate);
			$("#endTime").val(endTime);

			// 모달 띄우기
			$("#addModal").modal("show");
		}

		// ----------------------- 날짜시간 텍스트 나누기 -----------------------
		function splitDateString(originalText){
			// let originalText = "2024-10-13T01:30:00+09:00";

			// Split the string at 'T'
			let [startDateTime, timezone] = originalText.split('+'); // Split to ignore timezone
			let [startDate, startTimeWithSeconds] = startDateTime.split('T'); // Split date and time
			
			// Cut the startTime to remove seconds
			let startTime;
			if(startTimeWithSeconds) {
				startTime = startTimeWithSeconds.substring(0, 5); // Get only HH:MM
			}

			//console.log("Start Date:", startDate); // Output: 2024-10-13
			//console.log("Start Time:", startTime); // Output: 01:30

			return [startDate, startTime];
		}

		// ----------------------- 일정 추가 (검증) -----------------------
		function addScheduleValidate(){
			if ($("#title").val() == "") { //  제목 미입력시
				alert("제목을 입력해주세요.");
				$("#title").focus();
				return;
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
			} else { // 정상
				if($("#endTime").val().length != 0){ // 종료시간을 입력한 경우
					if($("#endDate").val() === "") { // 종료시간은 입력했는데 종료날짜는 입력 안한경우
						$("#endDate").val($("#startDate").val()); // 시작날짜로 세팅
					}
				};
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
					if(status === 'success') {
						fetchAndDisplaySchedule();
					}else {
						console.log("insertSchedule() 결과: " + status);
					}
				}, error:function(){
					console.log("일정 추가용 ajax 통신 실패!");
				}
			})
		}
			
		// ----------------------- 일정 추가 modal 리셋 -----------------------
		function resetAddModal() {
			// Clear all input fields in the modal
			$("#title").val("");
			$("#startDate").val("");
			$("#startTime").val("");
			$("#endDate").val("");
			$("#endTime").val("");
			$("#calendarNo").val($("#myCalendarNo").val());
			$("#color").val("");
			$("#content").val("");
			$("#alertDate").val("");
		}	

		// ----------------------- 구글 일정 클릭시 -> 구글 modal 띄우기 -----------------------
		function showGoogleModal(arg){
			let currentEvent = arg.event; // Store the currently selected event
			
			$("#google-title").val(currentEvent.title);
			$("#google-startDate").val(currentEvent.startStr);

			// 모달 띄우기
			$("#googleModal").modal("show");
		}


		// ----------------------- 일반(우리DB) 일정 클릭시 -> 일정수정 modal 띄우기 -----------------------
		async function showEditModal(arg){
			let currentEvent = arg.event; // Store the currently selected event
			const [startDate, startTime] = currentEvent.startStr.split(/[T+]/);
			const [endDate, endTime] = currentEvent.endStr.split(/[T+]/);
			
			$("#edit-scheduleNo").val(currentEvent.id);
			$("#edit-title").val(currentEvent.title);
			$("#edit-startDate").val(startDate);
			$("#edit-startTime").val(startTime);
			$("#edit-endDate").val(endDate);
			$("#edit-endTime").val(endTime);

			// Ensure scheduleList is loaded
			if (!Array.isArray(scheduleList)) {
				scheduleList = await selectScheduleList();
			}

			// js에 저장된 일정리스트에서 현재 일정 선택
			let currentItem;
			scheduleList.forEach((item) => {
				if(item.scheduleNo == currentEvent.id){
					currentItem = item;
				}
			});
			// console.log(currentItem);

			// 모달에서 현재 일정에 해당하는 select option 선택
			$("#edit-calendarNo option").each((index, el) => {
				if($(el).val() == currentItem.calendarNo){
					$(el).prop("selected", true);
				}
			})

			// 모달에서 현재 색상에 해당하는 select option 선택
			$("#edit-color option").each((index, el) => {
				if($(el).val() == currentItem.color){
					$(el).prop("selected", true);
				}
			})

			$("#edit-content").val(currentItem.content);
			$("#edit-alertDate").val(currentItem.alertDate);

			$("#edit-writerName").text(currentItem.writerName);
			$("#edit-writer").text('(' + currentItem.writer + ')');
			$("#edit-createDate").text(currentItem.createDate);

			// 모달 띄우기
			$("#editModal").modal("show");
		}

		// ----------------------- 일정 수정 (검증) -----------------------
		function editScheduleValidate(){
			if ($("#edit-title").val() == "") { //  제목 미입력시
				alert("제목을 입력해주세요.");
				$("#edit-title").focus();
				return;
			} else if ($("#edit-startDate").val() == "") {  // 시작일 미입력시
				alert("시작일을 입력해주세요.");
				$("#edit-startDate").focus();
				return;
			} else if ($("#edit-endDate").val().length !== 0 && $("#edit-startDate").val() > $("#edit-endDate").val()) { // 끝나는 날짜가 시작하는 날짜보다 값이 크면 안됨
				alert("종료일이 잘못되었습니다. 시작일과 같거나 커야합니다.");
				$("#edit-endDate").focus();
				return;
			} else if ($("#edit-startDate").val() === $("#edit-endDate").val() && $("#edit-startTime").val() > $("#edit-endTime").val()) { // 시작&끝 날짜 같은데 시작시간이 끝나는시간보다 빠른경우.
				alert("종료시간이 잘못되었습니다. 시작시간보다 같거나 커야합니다.");
				$("#edit-endTime").focus();
				return;
			} else { // 정상
				if($("#edit-endTime").val().length != 0){ // 종료시간을 입력한 경우
					if($("#edit-endDate").val() === "") { // 종료시간은 입력했는데 종료날짜는 입력 안한경우
						$("#edit-endDate").val($("#edit-startDate").val()); // 시작날짜로 세팅
					}
				};
				updateSchedule(); // db에 수정
				$("#editModal").modal("hide");
				resetEditModal(); // input 초기화
			}
		}

		// ----------------------- 일정 수정 (DB) -----------------------
		function updateSchedule(){
			$.ajax({
				url:"supdate.pl",
				data:{
					scheduleNo: $("#edit-scheduleNo").val(),
					title : $("#edit-title").val(),
					startDate : $("#edit-startDate").val(),
					startTime : $("#edit-startTime").val(),
					endDate : $("#edit-endDate").val(),
					endTime : $("#edit-endTime").val(),
					calendarNo : $("#edit-calendarNo").val(),
					color : $("#edit-color").val(),
					content : $("#edit-content").val(),
					alertDate : $("#edit-alertDate").val(),
				}, success:function(status){
					// console.log(status);
					if(status === 'success') {
						fetchAndDisplaySchedule();
						$("#editModal").modal("hide");
						resetEditModal(); // input 초기화
						alert("성공적으로 해당 일정을 수정하였습니다.");
					}else {
						console.log("updateSchedule() 결과: " + status);
					}
				}, error:function(){
					console.log("일정 수정용 ajax 통신 실패!");
				}
			})
		}

		// ----------------------- 일정 수정 modal 리셋 -----------------------
		function resetEditModal(){
			// Clear all input fields in the modal
			$("#edit-title").val("");
			$("#edit-startDate").val("");
			$("#edit-startTime").val("");
			$("#edit-endDate").val("");
			$("#edit-endTime").val("");
			$("#edit-calendarNo").val("");
			$("#edit-color").val("");
			$("#edit-content").val("");
			$("#edit-alertDate").val("");
			$("#edit-writerName").val("");
			$("#edit-writer").val("");
			$("#edit-createDate").val("");
		}

		// ----------------------- 일정 삭제 검증 -----------------------
		function deleteScheduleValidate(){
			if (confirm('해당 일정을 정말 삭제하시겠습니까?')) {
				deleteSchedule();
			}

			$("#editModal").modal("hide");
			resetEditModal(); // input 초기화
		}

		// ----------------------- 일정 삭제 (DB) -----------------------
		function deleteSchedule(){
			$.ajax({
				url:"sdelete.pl",
				data:{
					scheduleNo: $("#edit-scheduleNo").val(),
				}, success:function(status){
					// console.log(status);
					if(status === 'success') {
						fetchAndDisplaySchedule();
						// alert("성공적으로 해당 일정을 삭제하였습니다.")
					}else {
						console.log("deleteSchedule() 결과: " + status);
					}
				}, error:function(){
					console.log("일정 삭제용 ajax 통신 실패!");
				}
			})
		}

		// ----------------------- 캘린더 기본색상 변경 Modal - 수정버튼 누를시 -----------------------
		function updateCalendarColors(){
			// 작업중!!!!
			$.ajax({
				url:"cUpdate.pl",
				data:{
					scheduleNo: "",
				}, success:function(status){
					console.log(status);
					
				}, error:function(){
					console.log("updateCalendarColors() - ajax 통신 실패!");
				}
			})
		}

	</script>
</body>
</html>