<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	
		<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.2/kakao.min.js"
  integrity="sha384-TiCUE00h649CAMonG018J2ujOgDKW/kVWlChEuu4jK2vxfAAD0eZxzCKakxg55G4" crossorigin="anonymous"></script>
<script>
  Kakao.init('da79f43821733191257079798f45c6e4'); // 사용하려는 앱의 JavaScript 키 입력
</script>
	
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
						<a href="#"><img class="img-responsive" src="template/images/cover_bg_1.jpg" alt=""></a>
						<div class="blog-text">
							<div class="prod-title">
								<form action="" method=""> 
									<table>
										<thead>
											<tr>
												<td style="padding:4px;"> 아이디  </td>
												<td><input type="text" /></td>
											</tr>
											<tr>
												<td style="padding:4px;">비밀번호 </td>
												<td><input type="password" /></td>
											</tr>
										</thead>
										<tbody>
											<tr width=250px style="padding:10px;">
												<td >
												<a id="kakao-login-btn" href="javascript:loginWithKakao()">
												  <img src="kakao_login_small.png" width="222"
												    alt="카카오 로그인 버튼" />
												</a>
												<p id="token-result"></p>
												</td>
												 <td> 
												 	<a id="google-login-btn" href="#">
												 		<img alt="구글 로그인 버튼" src="web_light_rd_SI@1x.png">
												 	</a>
												 </td>
											</tr>
											<tr style="padding:10px;">
												<td colspan="2"><a href="#">아이디 찾기</a> | <a href="#">비밀번호 찾기</a></td>
											</tr>							
										</tbody>
									</table>
									<div>
										<a href="signupForm" class="btn btn-primary btn-lg">회원가입</a>
										<a href="login" class="btn btn-primary btn-lg">로그인</a>
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
  function loginWithKakao() {
    Kakao.Auth.authorize({
      redirectUri: 'http://localhost:8444/final/home',
    });
  }

  // 아래는 데모를 위한 UI 코드입니다.
  displayToken()
  function displayToken() {
    var token = getCookie('authorize-access-token');

    if(token) {
      Kakao.Auth.setAccessToken(token);
      Kakao.Auth.getStatusInfo()
        .then(function(res) {
          if (res.status === 'connected') {
            document.getElementById('token-result').innerText
              = 'login success, token: ' + Kakao.Auth.getAccessToken();
          }
        })
        .catch(function(err) {
          Kakao.Auth.setAccessToken(null);
        });
    }
  }

  function getCookie(name) {
    var parts = document.cookie.split(name + '=');
    if (parts.length === 2) { return parts[1].split(';')[0]; }
  }
</script>
	
	<!-- fh5co-blog-section -->

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>