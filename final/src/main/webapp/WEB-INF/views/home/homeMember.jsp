<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<style>
		#fh5co-couple img{
			width: 231px;
			height: 231px;
			object-fit: cover;
		}

		.modal-body{
			display: flex;
			flex-direction: column;
			align-items: start;
		}

		.modal-body .form-group{
			width: 100%;
		}

		.modal-body table{
			margin-top: 10px;
		}

		.modal-body table tr td:first-child{
			text-align: right;
		}

		.modal-body table tr td{
			padding: 10px;
		}
		
		.modal-footer{
			display: flex;
			flex-direction: column;
			align-items: center;
		}

		.modal-footer button{
			width: 50%;
		}

	</style>
</head>
<body>

	<!-- 메뉴바 위 메인사진 -->
	<jsp:include page="mainPicture.jsp"/>
	
	<!-- 메뉴바 -->
	<jsp:include page="../common/menubar.jsp"/>
	<script>
		// 메뉴바에 클릭된 메뉴 하이라이트
		$(()=>{ $(".nav-header #menubar_home").addClass("active"); })
	</script>

	<!-- 내용 -->
	<div id="fh5co-couple" class="fh5co-section-gray">
		<div class="container">
			<div class="row row-bottom-padded-md animate-box">
				<div class="col-md-6 col-md-offset-3 text-center">
					<div class="col-md-5 col-sm-5 col-xs-5 nopadding">
						<c:choose>
							<c:when test="${ not empty loginUser.originName }">
								<img src="${ loginUser.changeName }" alt="profile picture" class="img-responsive"/>
							</c:when>
							<c:otherwise>
								<img src="resources/images/blank-profile-picture.png"alt="profile picture" class="img-responsive" />
							</c:otherwise>
						</c:choose>
						<h3>${ loginUser.userName }</h3>
					</div>
					<div class="col-md-2 col-sm-2 col-xs-2 nopadding"><h2 class="amp-center"><i class="icon-heart"></i></h2></div>
					<div class="col-md-5 col-sm-5 col-xs-5 nopadding">
						<c:choose>
							<c:when test="${ not empty partner.originName }">
								<img src="${ partner.changeName }" alt="profile picture" class="img-responsive"/>
							</c:when>
							<c:otherwise>
								<img src="resources/images/blank-profile-picture.png" alt="profile picture" class="img-responsive" />
							</c:otherwise>
						</c:choose>
						<h3>${ partner.userName }</h3>
					</div>
				</div>
			</div>
			<div class="row animate-box">
				<div class="col-md-8 col-md-offset-2">
					<div class="col-md-12 text-center heading-section">
						<c:choose>
							<c:when test="${ not empty couple.startDate }">
								<!-- 만남시작일자가 있는경우 -->
								<h2>❤️ +${ dDay.totalDays }일</h2>
								<c:if test="${ dDay.months gt 0 }">
									<p>(
										<c:if test="${ dDay.years gt 0 }">
											${ dDay.years }년
										</c:if>
										<c:if test="${ dDay.months gt 0 }">
											${ dDay.months }개월
											${ dDay.days }일
										</c:if>
									 	)
									</p>
								</c:if>
							</c:when>
							<c:otherwise>
								<!-- 만남시작일자가 없을경우 -->
								<h2>D+XXX</h2>
								<p>(만남시작일을 등록후, "데이카운트" 기능을 사용해보세요!)</p>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
			<div class="row animate-box" style="display: flex; justify-content: center;">
				<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">⚙️ 커플 홈 설정</button>
			</div>
		</div>
	</div>

	<!-- ---------------------------------------- Modal ---------------------------------------- -->
	
	<!-- 커플 홈 설정 -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
		
			<!-- Modal content-->
			<div class="modal-content" style="padding-top: 10px;">
				<form class="form-inline" action="update.co" method="post" enctype="multipart/form-data">
					<input type="hidden" name="coupleCode" value="${ couple.coupleCode }">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" style="font-size: 30px;">&times;</button>
						<h3 class="modal-title">⚙️ 커플 홈 설정</h3>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<div style="width: 100%; position: relative;">
								<div>
									<c:choose>
										<c:when test="${ empty couple.changeName }">
											<!-- 배경사진이 없는경우 -->
											<img src="resources/images/main-default-bg-img.jpg" id="modalBgImg" alt="background-image" style="width: 100%; opacity: 70%;">
										</c:when>
										<c:otherwise>
											<!-- 배경사진이 있는경우 -->
											<img src="${ couple.changeName }" id="modalBgImg" alt="background-image" style="width: 100%;">
										</c:otherwise>
									</c:choose>
								</div>
								<c:if test="${ empty couple.changeName }">
									<div style="position: absolute; top:50%; left: 50%; transform: translate(-50%, -50%);">
										<p style="font-size: 24px; color: black;">( 기본 배경사진 )</p>
									</div>
								</c:if>
							</div>
							<table>
								<tr>
									<td>커플 배경사진</td>
									<td>
										<input type="file" id="upfile" name="reupfile" onchange="loadImg(this)">
										<input type="hidden" name="originName" value="${ couple.originName }">
										<input type="hidden" name="changeName" value="${ couple.changeName }">
									</td>
								</tr>
								<tr>
									<td>커플 문장</td>
									<td><input type="text" class="form-control" name="sentence" value='${ couple.sentence }' placeholder="커플 문장을 등록해보세요!" style="width: 100%;"></td>
									<!-- 문장에 ''를 쓰면 잘 안나올거임. (value에서 ''로 감싸고 있기때문) -->
								</tr>
								<tr>
									<td>커플 만남시작날짜</td>
									<td><input type="date" class="form-control" name="startDate" value="${ couple.startDate }"></td>
								</tr>
							</table>
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary btn-block">수정</button>
					</div>
				</form>
			</div>
			
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>

	<script>
		// 부트스트랩에서 모달 실행시 body에 padding-right을 추가하는데, 해당 값을 초기화함.
		// (스크롤바가 없어지면서 화면이 옆으로 움직이는것 때문에 부트스트랩에서 자동으로 추가하게끔 되어있었음)
		$('#myModal').on('hidden.bs.modal', function () {
		  $('body').css('padding-right', ''); // Reset the padding on modal close
		});

		// ----------------------- 사진변경 - 파일 선택시 선택된 이미지로 미리보기 -----------------------
		function loadImg(inputFile){
			if(inputFile.files.length == 1) { // 선택한 파일이 있으면
				const reader = new FileReader();
				reader.readAsDataURL(inputFile.files[0]);
				reader.onload = function(e){
					$("#modalBgImg").attr("src", e.target.result);
				}
			}else { // 파일 선택 취소시.
				if('${ couple.changeName }' != ""){ // 기존사진 있으면 -> 기존거 그대로
					$("#modalBgImg").attr("src", '${ couple.changeName }');
				}else { // 기존사진 없으면 -> 기본이미지로
					$("#modalBgImg").attr("src", "resources/images/main-default-bg-img.jpg");
				}
			}
		}
	</script>

</body>
</html>