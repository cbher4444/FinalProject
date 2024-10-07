<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js'></script>
	<style>
		option{
			color: white;
		}

	</style>
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
				<div id='calendar' style="padding: 30px; background-color: #F6FAF7;" class=""></div>
			</div>
		</div>
	</div>
	
	<!-- 추가용 Modal -->
	<div class="modal fade" id="addModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content" style="padding-top: 10px;">
				<form class="form-inline">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" style="font-size: 30px;">&times;</button>
						<h3 class="modal-title">일정 추가</h3>
					</div>
					<div class="modal-body">
						<div class="form-group" style="width: 100%;">
							<label for="title">제목 :</label>
							<input type="text" class="form-control" id="title" placeholder="제목을 입력해주세요." style="width: 90%;"><br><br>
							
							<label for="startDate">시작일 :</label>
							<!-- <input type="datetime-local" class="form-control" id="startDate"> -->
							<input type="date" class="form-control" id="startDate">
							<input type="time" class="form-control" id="startTime">
							<br><br>

							<label for="endDate">종료일 :</label>
							<!-- <input type="datetime-local" class="form-control" id="endDate"> -->
							<input type="date" class="form-control" id="endDate">
							<input type="time" class="form-control" id="endTime">
							<br><br>

							<label for="endTime">색상 :</label>
							<select id="color" style="padding: 10px;">
								<option value="skyblue" style="background: #3788d8;">하늘색</option>
								<option value="red" style="background: red;">빨간색</option>
								<option value="orange" style="background: orange;">주황색</option>
								<option value="yellow" style="background: yellow;">노랑색</option>
								<option value="green" style="background: green;">초록색</option>
								<option value="blue" style="background: blue;">파랑색</option>
								<option value="purple" style="background: purple;">보라색</option>
							</select>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary btn-block" id="addBtn">추가</button>
					</div>
				</form>
			</div> <!-- Modal content -->
		</div>
	</div> <!-- 추가용 Modal -->

	<!-- 수정용 Modal -->
	<div class="modal fade" id="editModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content" style="padding-top: 10px;">
				<form class="form-inline">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" style="font-size: 30px;">&times;</button>
						<h3 class="modal-title">일정 수정</h3>
					</div>
					<div class="modal-body">
						<div class="form-group" style="width: 100%;">
							<label for="title">제목 :</label>
							<input type="text" class="form-control" id="edit-title" placeholder="제목을 입력해주세요." style="width: 90%;"><br><br>
							
							<label for="start">시작일 :</label>
							<!-- <input type="datetime-local" class="form-control" id="edit-startDate"> -->
							<input type="date" class="form-control" id="edit-startDate">
							<input type="time" class="form-control" id="edit-startTime">
							<br><br>

							<label for="end">종료일 :</label>
							<!-- <input type="datetime-local" class="form-control" id="edit-endDate"> -->
							<input type="date" class="form-control" id="edit-endDate">
							<input type="time" class="form-control" id="edit-endTime">
							<br><br>

							<label for="endTime">색상 :</label>
							<select id="edit-color" style="padding: 10px;">
								<option value="skyblue" style="background: skyblue;">하늘색</option>
								<option value="red" style="background: red;">빨간색</option>
								<option value="orange" style="background: orange;">주황색</option>
								<option value="green" style="background: green;">초록색</option>
								<option value="blue" style="background: blue;">파랑색</option>
								<option value="purple" style="background: purple;">보라색</option>
							</select>
						</div>
					</div>
					<div class="modal-footer" style="display: flex; align-items: center; justify-content: center;">
						<button type="button" class="btn btn-primary btn-block" id="editBtn" style="width: 100px; height: 50px; margin-right: 10px;">수정</button>
						<button type="button" class="btn btn-secondary btn-block" id="deleteBtn" style="width: 100px; height: 50px; margin-top: 0;">삭제</button>
					</div>
				</form>
			</div> <!-- Modal content -->
		</div>
	</div> <!-- 추가용 Modal -->


	<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>



	<!-- ---------------------------------------- html 끝 ---------------------------------------- -->

	

	<script>
		$(function(){
			// selectScheduleList();
		})

		// ----------------------- DB에서 일정가져오기 -----------------------
		function selectScheduleList(){
			$.ajax({
				url:"slist.pl",
				success:function(list){
					
					console.log(list);
					
				}, error:function(){
					console.log("일정조회용 ajax 통신 실패");
				}
			})
		}
		

		// ----------------------- full calendar -----------------------
		var calendar;
		document.addEventListener('DOMContentLoaded', function() {
			var calendarEl = document.getElementById('calendar');
		
			calendar = new FullCalendar.Calendar(calendarEl, {
				locale: 'ko',
				headerToolbar: {
					left: 'prev,next today',
					center: 'title',
					right: 'dayGridMonth,timeGridWeek,timeGridDay'
				},
				initialDate: new Date().toISOString().split('T')[0], // 오늘날짜 구하기 - Output: '2024-10-07'
				navLinks: true, // can click day/week names to navigate views
				selectable: true,
				selectMirror: true,
				select: function(arg) {
					// ------------------ 예시 ------------------
					// var title = prompt('추가할 일정명을 입력하세요:');
					// if (title) {
					// 	calendar.addEvent({
					// 		title: title,
					// 		start: arg.start,
					// 		end: arg.end,
					// 		allDay: arg.allDay
					// 	})
					// }
					// calendar.unselect()
					// ------------------------------------------


					// 모달 띄우기
					$("#addModal").modal("show");
					
					// 클릭된 날짜 모달에 반영
					$("#startDate").val(arg.startStr);
					$("#endDate").val(arg.endStr);
					
					// console.log(arg.startStr);
					// console.log(arg.endStr);

					calendar.unselect();
				},
				eventClick: function(arg) {
					// ------------------ 예시 ------------------
					// if (confirm('해당 일정을 삭제하시겠습니까?')) {
					// 	arg.event.remove()
					// }
					// ------------------------------------------

					// 모달 띄우기
					$("#editModal").modal("show");

					let startStr = arg.event.startStr;
					let endStr = arg.event.endStr;
					
					const [startDate, startTime] = startStr.split(/[T+]/);
					const [endDate, endTime] = endStr.split(/[T+]/);
					
					$("#edit-title").val(arg.event.title);

					$("#edit-startDate").val(startDate);
					$("#edit-endDate").val(endDate);
					
					$("#edit-startTime").val(startTime);
					$("#edit-endTime").val(endTime);
					

				},
				editable: true,
				dayMaxEvents: true, // allow "more" link when too many events
				events: [
					{
						title: 'All Day Event',
						start: '2024-10-01'
					},
					{
						title: 'Long Event',
						start: '2024-10-07',
						end: '2024-10-10'
					},
					{
						groupId: 999,
						title: 'Repeating Event',
						start: '2024-10-09T16:00:00'
					},
					{
						groupId: 999,
						title: 'Repeating Event',
						start: '2024-10-16T16:00:00'
					},
					{
						title: 'Conference',
						start: '2024-10-11',
						end: '2024-10-13'
					},
					{
						title: 'Meeting',
						start: '2024-10-12T10:30:00',
						end: '2024-10-12T12:30:00'
					},
					{
						title: 'Lunch',
						start: '2024-10-12T12:00:00'
					},
					{
						title: 'Meeting',
						start: '2024-10-12T14:30:00'
					},
					{
						title: 'Happy Hour',
						start: '2024-10-12T17:30:00'
					},
					{
						title: 'Dinner',
						start: '2024-10-12T20:00:00'
					},
					{
						title: 'Birthday Party',
						start: '2024-10-13T07:00:00'
					},
					{
						title: 'Click for Google',
						url: 'http://google.com/',
						start: '2024-10-28'
					}
				],
			});
		
			calendar.render();
		});


		// ----------------------- 일정 추가 -----------------------
		$("#addBtn").on("click", function () {

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

			//빈값입력시 오류
			if (
				eventData.title == "" ||
				eventData.start == "" ||
				eventData.end == ""
			) {
				alert("입력하지 않은 값이 있습니다.");

				//끝나는 날짜가 시작하는 날짜보다 값이 크면 안됨
			} else if ($("#start").val() > $("#end").val()) {
				alert("시간을 잘못입력 하셨습니다.");

			} else {
				// 이벤트 추가
				calendar.addEvent(eventData);
				$("#addModal").modal("hide");

				$("#title").val("");

				$("#startDate").val("");
				$("#endDate").val("");

				$("#startTime").val("");
				$("#endTime").val("");
			}
		});


	</script>
</body>
</html>