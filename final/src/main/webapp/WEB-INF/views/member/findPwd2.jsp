<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
<!-- content에 자신의 OAuth2.0 클라이언트ID를 넣습니다. -->
<meta name ="google-signin-client_id" content="1080403735968-t0p6cq58l96r8sf5ff6jh0vb736a0b5h.apps.googleusercontent.com">

<!--  구글 api 사용을 위한 스크립트 -->
	<script defer src="https://apis.google.com/js/platform.js?onload=init" async ></script>
	
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.2/kakao.min.js"
  integrity="sha384-TiCUE00h649CAMonG018J2ujOgDKW/kVWlChEuu4jK2vxfAAD0eZxzCKakxg55G4" crossorigin="anonymous"></script>

<!-- modal용 스크립트  -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous"></head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>

	
</head>
<body>


	<!-- 메뉴바 -->
	<jsp:include page="../common/menubar.jsp"/>
	<script>
		// 메뉴바에 클릭된 메뉴 하이라이트
		$(()=>{ $(".nav-header #menubar_login").addClass("active"); })
	</script>
	
	<!-- 내용 -->
	<div id="fh5co-blog-section" class="fh5co-section-gray">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center heading-section">
					<h2>Login</h2>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row row-bottom-padded-md">
				<div class="col-lg-4 col-md-4 col-sm-6" style="left:33%;" >
					<div class="fh5co-blog animate-box">
					 	<a href="#"><img class="img-responsive" src="template/images/cover_bg_1.jpg" alt="윗배경"></a>
						<div class="blog-text">
							<div class="prod-title">
								<form action="updatePwd" method="post"> 
								<input type="hidden" value="${checkUser}" name="email">
									<div align="center">
									<div style="padding: 4px;">(필수)비밀번호</div>
										<div>
											<input class="form-control" type="password" name="userPwd" id="userPwd" required placeholder="8~20자" onkeyDown="check(), matching()" />
											<div style="font-size:10px" id="text-area"></div>
										</div>

										<div style="padding: 4px;">(필수)비밀번호 확인</div>
										<div>
											<input class="form-control" type="password" id="checkPwd" onkeyDown=" matching()" />
											<div style="font-size:11px" id="eqPwd"></div>
										</div>
									</div>
									<br><br><br>
									<div align="center">
										<a href="loginForm" class="btn btn-primary btn-lg">뒤로가기</a>
										<button type="submit" class="btn btn-primary btn-lg">변경하기</button>
									</div>
								</form>
							</div>
						</div> 
					</div>
				</div>
			</div>
		</div>
	</div>
<script>
		$("#userPwd").on('input', function(){
  			const password = $("#userPwd").val();
  			const regPwd = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,20}$/;
  			var message = $('#text-area');
  			if(!regPwd.test(password)){
  				message.text("비밀번호는 영문자와 숫자를 포함한 8~20자로 입력해야 합니다.").css("color", "red");
  				$("#create").hide();
  			}else{
  				message.text("");
  				$("#create").show();
  			}
  			
  		});
  		</script>
  		
  		<script>
  		$(document).ready(function() {
  		    $("#checkPwd").on('input', function() {
  		        const userPwd = $("#userPwd").val();
  		        const checkPwd = $("#checkPwd").val();
  		        var message = $('#eqPwd');

  		        if (userPwd !== checkPwd) {
  		            message.text("일치하지 않습니다.").css("color", "red");
  		            $("#create").hide(); // 이 버튼의 ID가 "create"가 맞는지 확인
  		        } else {
  		            message.text("일치합니다.").css("color", "green");
  		            $("#create").show();
  		        }
  		    });
  		});
  		</script>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>