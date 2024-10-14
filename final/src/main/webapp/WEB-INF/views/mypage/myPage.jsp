<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<style>
		/* 회원정보 수정칸 -> 요소 간격 띄우기*/
		#personal-info td{
			padding: 10px;
		}
		
		/* 모달 -> 요소 간격 띄우기*/
		.modal td{
			padding: 10px !important;
		}

		/* 모달 왼쪽열 -> 오른쪽 정렬*/
		.modal td:first-child{
			text-align: right;
		}
	</style>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="../common/menubar.jsp"/>
	<script>
		// 메뉴바에 클릭된 메뉴 하이라이트
		$(()=>{ $(".nav-header #menubar_myPage").addClass("active"); })
	</script>
	
	<!-- 커플등록 -->
	<c:if test="${ loginUser.status eq 'W' }">
		<div id="fh5co-couple" class="fh5co-section-gray">
			<div class="container">
				<div class="row animate-box">
					<div class="col-md-12 text-center heading-section" style="margin-bottom: 0;">
						<h2>😊 커플 등록을 완료하여 주세요.</h2>
						<p>커플 등록을 완료해야만 정상적으로 서비스를 사용할 수 있습니다.<br>아래 2가지 방법 중, 하나를 선택해서 진행해주세요.</p>
					</div>
				</div>
				<div class="row animate-box">
					<div class="col-md-6 text-center heading-section" style="margin-bottom: 0;">
						<h3>방법 1. 초대코드 공유</h3>
						<p>본인의 초대코드를 공유하세요.</p>
						<form class="form-inline" style="display: flex; flex-direction: column; align-items: center;">
							<div class="col-md-6 col-sm-6">
								<div class="form-group">
									<label for="name">나의 초대코드</label>
									<input type="text" class="form-control" id="myInviteCode" value="${ loginUser.inviteCode }" readonly style="width: 100%;">
									<br><br>
									<button type="submit" class="btn btn-primary btn-block">초대코드 공유</button>
								</div>
							</div>
						</form>
					</div>
					<div class="col-md-6 text-center heading-section" style="margin-bottom: 0;">
						<h3>방법 2. 상대방 초대코드 입력</h3>
						<p>상대방의 초대코드를 입력해주세요.</p>
						<form class="form-inline" action="piccheck.me" method="post" style="display: flex; flex-direction: column; align-items: center;">
							<div class="col-md-6 col-sm-6">
								<div class="form-group">
									<label for="email">상대방 초대코드</label>
									<input type="text" class="form-control" name="inviteCode" style="width: 100%;" maxlength="15" required>
									<br><br>
									<button type="submit" class="btn btn-primary btn-block">커플등록</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<c:if test="${ not empty partner }">
			<!-- 상대방 확인 Modal -->
			<div class="modal fade" id="partnerCheckModal" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content" style="padding-top: 10px; margin-top: 150px;">
						<form class="form-inline" action="insert.co" method="post">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" style="font-size: 30px;">&times;</button>
								<h3 class="modal-title">커플등록 - 확인절차</h3>
							</div>
							<div class="modal-body">
								<div class="form-group" style="width: 100%;">
									<br>
									<h4>💡 상대방이 맞는지 확인해주세요.</h4>
									<table style="width: 100%;">
										<input type="hidden" name="email" value="${ partner.email }">
										<tr>
											<td>&nbsp;&nbsp;이름:</td>
											<td><input type="text" name="userName" maxlength="10" value="${ partner.userName }" readonly></td>
										</tr>
										<tr>
											<td>생년월일:</td>
											<td><input type="date" name="brithday" value="${ partner.brithday }" readonly style="width: 200px;"></td>
										</tr>
										<tr>
											<td>초대코드:</td>
											<td><input type="text" name="inviteCode" value="${ partner.inviteCode }" readonly></td>
										</tr>
									</table>
									<br>
								</div>
							</div>
							<div class="modal-footer" style="display: flex; align-items: center; justify-content: center;">
								<button type="submit" class="btn btn-primary btn-block" style="width: 100px; height: 50px; margin-right: 10px;">커플등록</button>
								<button type="button" class="btn btn-secondary btn-block" style="width: 100px; height: 50px;" onclick="onClickCancelBtn()">취소</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<script>
				$("#partnerCheckModal").modal("show");

				// ----------------------- 커플등록 모달 취소버튼 클릭시 -----------------------
				function onClickCancelBtn(){
					$("#partnerCheckModal").modal("hide");
					invalidatePartner();
				};

				// ----------------------- 세션에 파트너 없애기 -----------------------
				function invalidatePartner(){
					$.ajax({
						url:"invalidatePartner.me",
						data:{
						}, success:function(status){
							console.log("invalidatePartner():" + status);
						}, error:function(){
							console.log("invalidatePartner() - ajax 통신 실패!");
						}
					})
				}
			</script>
		</c:if>

		<script>
			$(document).ready(function() {
				initializeInviteCode(); // 내 초대코드 세팅
			});

			// ----------------------- 기존에 내 초대코드가 없었던 경우 -----------------------
			async function initializeInviteCode() {
				if ("${loginUser.inviteCode}" === "") {
					console.log("기존에 내 초대코드가 없었던 경우!");
					let randomString;
					while(true){ // 초대코드 중복안될때까지 반복
						randomString = generateRandomString(10);
						if(await InviteCodeCheck(randomString)) { // 중복되는 초대코드가 없는경우
							break;
						}
					}
					$("#myInviteCode").val(randomString); // 화면에 뿌려주기
					updateInviteCode(randomString); // db에 반영
				}
			}

			// ----------------------- 랜덤코드 생성 -----------------------
			function generateRandomString(length) {
				const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
				let result = '';
				const charactersLength = characters.length;
				for (let i = 0; i < length; i++) {
					result += characters.charAt(Math.floor(Math.random() * charactersLength));
				}
				return result;
			}

			// ----------------------- 내 초대코드 DB 중복검사 -----------------------
			function InviteCodeCheck(randomString){
				return new Promise((resolve, reject) => {
					$.ajax({
						url:"iccheck.me",
						data:{
							inviteCode:randomString,
						}, success:function(status){
							// console.log(status);
							if (status === 'success') { // 중복안됨 -> 사용가능
								resolve(true);
							}else {  // 중복됨 -> 사용불가
								resolve(false);
							}
						}, error:function(){
							reject(new Error('InviteCodeCheck() -  ajax 통신 실패'));
						}
					})
				})
			}

			// ----------------------- 내 초대코드 DB에 업데이트 -----------------------
			function updateInviteCode(randomString){
				$.ajax({
					url:"icupdate.me",
					data:{
						inviteCode: randomString,
						email:'${loginUser.email}',
					}, success:function(status){
						// console.log(status);
						if(status === 'success') {
							console.log("초대코드 DB업데이트 완료");
						}else {
							console.log("updateInviteCode() 결과: " + status);
						}
					}, error:function(){
						console.log("초대코드 수정용 ajax 통신 실패!");
					}
				})
			}
		</script>
	</c:if>

	<!-- 마이페이지 -->
	<div id="fh5co-groom-bride">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
					<h2>My Page</h2>
				</div>
			</div>
			<div class="row padding">
				<div class="couple-wrap">
					<div class="col-md-6 nopadding animate-box" style="position: relative;">
						<img src="resources/images/groom.jpg" class="img-responsive" alt="profile picture">
						<button type="button" class="btn btn-primary btn-block" style="position:absolute; bottom:10px; right:10px; width: fit-content; background-color: rgb(125, 125, 125);"  onclick="onclickImgEditBtn()">사진변경</button>
					</div>
					<div class="col-md-6 nopadding animate-box">
						<div class="couple-desc" style="padding: 20px 0 0;">
							<form id="mypage-form" action="update.me" method="post">
								<table id="personal-info" align="center">
									<tr>
										<td>* 이메일</td>
										<td><input type="email" name="email" value="${ loginUser.email }" readonly required></td>
									</tr>
									<tr>
										<td>* 이름</td>
										<td><input type="text" name="userName" maxlength="10" value="${ loginUser.userName }" required></td>
									</tr>
									<tr>
										<td>&nbsp;닉네임</td>
										<td><input type="text" name="nickName" maxlength="20" value="${ loginUser.nickName }"></td>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;성별</td>
										<td>
											<input type="radio" name="gender" id="male" value="M" style="margin-right: 3px;">
											<label for="male" style="margin-left: 0;">남</label>
											<input type="radio" name="gender" id="female" value="F" style="margin-right: 3px;">
											<label for="female" style="margin-left: 0;">여</label>
										</td>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;연락처</td>
										<td><input type="text" name="phone" maxlength="11" placeholder="- 없이 입력" value="${ loginUser.phone }"></td>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;주소</td>
										<td><input type="text" name="address" value="${ loginUser.address }"></td>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;생년월일</td>
										<td><input type="date" name="brithday" value="${ loginUser.brithday }"></td>
									</tr>
									<tr>
										<td colspan="2" style="padding: 10px;">
											<button type="submit" class="btn btn-primary btn-block" style="margin: 0;">수정</button>
											<button type="button" class="btn btn-primary btn-block" style="margin: 10px 0; background-color: rgb(125, 125, 125);">비밀번호 변경</button>
											<button type="button" class="btn btn-secondary btn-block" style="margin: 0;" onclick="onclickDeleteBtn()">회원탈퇴</button>
										</td>
									</tr>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>
	
	
	<!-- ---------------------------------------- Modal ---------------------------------------- -->
	
	<!-- 회원탈퇴 Modal -->
	<div class="modal fade" id="deleteModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content" style="padding-top: 10px; margin-top: 150px;">
				<form class="form-inline" action="delete.me" method="post">
					<input type="hidden" name="email" value="${ loginUser.email }">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" style="font-size: 30px;">&times;</button>
						<h3 class="modal-title">회원탈퇴</h3>
					</div>
					<div class="modal-body">
						<div class="form-group" style="width: 100%;">
							<table style="width: 95%;">
								<tr>
									<td colspan="2" style="text-align: center;">탈퇴 후 복구가 불가능합니다.<br>정말로 탈퇴 하시겠습니까?</td>
								</tr>
								<tr>
									<td>* 비밀번호 :</td>
									<td><input type="password" class="form-control" name="userPwd" style="width: 80%;" required></td>
								</tr>
							</table>
						</div>
					</div>
					<div class="modal-footer" style="display: flex; align-items: center; justify-content: center;">
						<button type="submit" class="btn btn-danger btn-block" style="width: 100px; height: 50px; margin-right: 10px;">탈퇴하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<!-- 사진변경 Modal -->
	<div class="modal fade" id="imgModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content" style="padding-top: 10px; margin-top: 150px;">
				<form class="form-inline" action="" method="post">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" style="font-size: 30px;">&times;</button>
						<h3 class="modal-title">사진 등록/변경</h3>
					</div>
					<div class="modal-body">
						<div class="form-group" style="width: 100%;">
							<table style="width: 95%;">
								<tr>
									<td>첨부파일</td>
									<td>
										<input type="file">
									</td>
								</tr>
							</table>
						</div>
					</div>
					<div class="modal-footer" style="display: flex; align-items: center; justify-content: center;">
						<button type="button" class="btn btn-primary btn-block" style="width: 100px; height: 50px; margin-right: 10px;">사진 등록</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script>
		setGender();

		// ----------------------- 성별 체크해놓기 -----------------------
		function setGender(){
			if("${ loginUser.gender }" != "") {
				$("input[value=${loginUser.gender}]").attr("checked", true);
			}
		}

		// ----------------------- 회원탈퇴 버튼 클릭시 -> 회원탈퇴 모달 띄움 -----------------------
		function onclickDeleteBtn(){
			$("#deleteModal").modal("show");
		}

		// ----------------------- 사진변경 버튼 클릭시 -> 사진변경 모달 띄움 -----------------------
		function onclickImgEditBtn(){
			$("#imgModal").modal("show");
		}



	</script>
</body>
</html>