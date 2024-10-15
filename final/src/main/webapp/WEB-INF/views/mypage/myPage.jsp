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
	
	<c:choose>
		<c:when test="${ loginUser.status eq 'W' }">
			<!-- 커플등록 -->
			<jsp:include page="../mypage/coupleRegister.jsp"/>
		</c:when>
		<c:when test="${ loginUser.status eq 'N' }">
			<!-- 탈퇴대기 -->
			<jsp:include page="../mypage/deleteAccount.jsp"/>
		</c:when>
	</c:choose>


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
						<c:if test="${ loginUser.status ne 'N' }">
							<!-- 회원탈퇴 대기중이 아닌경우 -->
							<button type="button" class="btn btn-primary btn-block" style="position:absolute; bottom:10px; right:10px; width: fit-content; background-color: rgb(125, 125, 125);"  onclick="onclickImgEditBtn()">사진변경</button>
						</c:if>
					</div>
					<div class="col-md-6 nopadding animate-box">
						<div class="couple-desc" style="padding: 20px 0 0;">
							<form id="mypage-form" action="update.me" method="post">
								<table id="personal-info" align="center">
									<tr>
										<td>* 이메일</td>
										<td><input type="email" name="email" value="${ loginUser.email }" required disabled></td>
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
											<c:choose>
												<c:when test="${ loginUser.status eq 'N' }">
													<!-- 탈퇴대기중 -->
													<br>
													<span>- 탈퇴대기 중에는 회원정보를 수정할 수 없습니다. -</span>
												</c:when>
												<c:otherwise>
													<!-- 그외 -->
													<button type="submit" class="btn btn-primary btn-block" style="margin: 0;">수정</button>
													<button type="button" class="btn btn-primary btn-block" style="margin: 10px 0; background-color: rgb(125, 125, 125);">비밀번호 변경</button>
													<button type="button" class="btn btn-secondary btn-block" style="margin: 0;" onclick="onclickDeleteBtn()">회원탈퇴</button>													
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
								</table>
								<c:if test="${ loginUser.status eq 'N' }">
									<!-- 탈퇴대기중 -> 회원정보 수정불가  -->
									<script>
										$('#personal-info input').attr('disabled', true);
									</script>
								</c:if>
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
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" style="font-size: 30px;">&times;</button>
						<h3 class="modal-title">회원탈퇴</h3>
					</div>
					<div class="modal-body">
						<div class="form-group" style="width: 100%;">
							<table style="width: 95%;">
								<tr>
									<td colspan="2" style="text-align: center;">
										<c:if test="${ not empty partner }">
											회원탈퇴시, 상대방 계정도 같이 탈퇴처리 됩니다.<br><br>
										</c:if>
										탈퇴신청후 30일동안만 복구 가능합니다.<br><br>정말로 탈퇴 하시겠습니까?
									</td>
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