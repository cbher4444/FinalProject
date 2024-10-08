<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<style>
		#personal-info *{
			margin: 10px;
		}

		.form-inline > div{
			margin: 10px 0;
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
	<div id="fh5co-couple" class="fh5co-section-gray">
		<div class="container">
			<div class="row animate-box">
				<div class="col-md-8 col-md-offset-2">
					<div class="col-md-12 text-center heading-section" style="margin-bottom: 0;">
						<h1>😅</h1>
						<h2>커플 등록을 완료하여 주세요.</h2>
						<p>아래 코드를 상대방에 전송하세요.<br>상대방이 요청을 수락하면 서비스를 이용하실 수 있습니다.</p>
						<form class="form-inline" style="display: flex; flex-direction: column; align-items: center;">
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
									<label for="email">상대방 Email</label>
									<input type="email" class="form-control" id="email" placeholder="Email" style="width: 100%;">
								</div>
							</div>
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
									<label for="name">랜덤코드</label>
									<input type="name" class="form-control" id="name" placeholder="3ELEPQ4AIM" readonly  style="width: 100%;">
								</div>
							</div>
							<div class="col-md-4 col-sm-4">
								<label for="" >요청보내기</label>
								<button type="submit" class="btn btn-primary btn-block">이메일 전송</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 화면분할용 사진 -->
	<div id="fh5co-started" style="background-image:url(resources/images/cover_bg_2.jpg);" data-stellar-background-ratio="0.5">
		<div class="overlay">
			<div class="container">
				
			</div>
		</div>
	</div>

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
					<div class="col-md-6 nopadding animate-box">
						<img src="resources/images/groom.jpg" class="img-responsive" alt="Free HTML5 Bootstrap Template by FreeHTML5.co">
					</div>
					<div class="col-md-6 nopadding animate-box">
						<div class="couple-desc">
							<form id="mypage-form" action="" method="post">
								<table id="personal-info" align="center">
									<!-- <tr>
										<td>* 아이디</td>
										<td><input type="text" name="userId" maxlength="12" value="userId" readonly></td>
									</tr> -->
									<tr>
										<td>* 이메일</td>
										<td><input type="email" name="email" value="email" readonly required></td>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;이름</td>
										<td><input type="text" name="userName" maxlength="6" value="userName"></td>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;성별</td>
										<td>
											<input type="radio" name="gender" id="male" value="male" style="margin-right: 3px;" checked>
											<label for="male" style="margin-left: 0;">남</label>
											<input type="radio" name="gender" id="female" value="female" style="margin-right: 3px;">
											<label for="female" style="margin-left: 0;">여</label>
										</td>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;생년월일</td>
										<td><input type="date" name="brithday" ></td>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;전화번호</td>
										<td><input type="text" name="phone" placeholder="- 포함해서 입력" value="phone"></td>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;주소</td>
										<td><input type="text" name="address" value="address"></td>
									</tr>
									<tr>
										<td colspan="2" style="padding: 10px;">
											<button type="submit" class="btn btn-primary btn-block" style="margin: 0;">정보변경</button>
											<button type="button" class="btn btn-primary btn-block" style="margin: 10px 0; background-color: rgb(125, 125, 125);">비밀번호 변경</button>
											<button type="button" class="btn btn-primary btn-block" style="margin: 0; background-color: rgb(125, 125, 125);">회원탈퇴</button>
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
</body>
</html>