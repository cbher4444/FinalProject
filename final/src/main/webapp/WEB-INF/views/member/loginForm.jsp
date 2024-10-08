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
								<form action="login" method="post"> 
									<div align="center">
									<lable> 아이디  </lable>
									<input type="text" onkeyup="checkCapsLock(event)" id="email" name="email"/>
									
									<br>
									<lable>비밀번호</lable>
									<input type="password" id="userPwd" name="userPwd"/>
									<span id="message" style="font-size:12px; color:red;"></span> 
									<br>
									
									<a href="findIdForm" class="btn btn-light btn-sm">아이디 찾기</a> | 
									<a href="findPwdForm" class="btn btn-light btn-sm">비밀번호 찾기</a>
									<br>
									<span style="width:120px;" id="kakaoLogin" align="left">
										<a id="kakao-login-btn" href="javascript:loginWithKakao()">
											 <img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="111"
											    alt="카카오 로그인 버튼"  />
											</a>
										<p id="token-result"></p>
									</span>
									<span style="width:120px;" id="googloLogin" align="right" >
										<a id="GgCustomLogin" href="javascript:void(0)" class="g-signin2" data-onsuccess="onSignIn">
											 <img alt="구글 로그인 버튼" src="web_light_rd_SI@1x.png">
										</a>
									</span>
									</div>
									<div align="center">
										<a href="signupForm" class="btn btn-primary btn-lg">회원가입</a>
										<button class="btn btn-primary btn-lg">로그인</button>
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
function checkCapsLock(event)  {
	  if (event.getModifierState("CapsLock")) {
	    document.getElementById("message").innerText 
	      = "Caps Lock이 켜져 있습니다."
	  }else {
	    document.getElementById("message").innerText 
	      = ""
	  }
	}
</script>

	
<script>
  Kakao.init('da79f43821733191257079798f45c6e4'); // 사용하려는 앱의 JavaScript 키 입력
  Kakao.isInitialized();
 </script>

<script>
  function loginWithKakao() {
    Kakao.Auth.authorize({
      redirectUri: 'http://localhost:8444/final/login',
    });
  }

  // 아래는 데모를 위한 UI 코드입니다.
  displayToken()
  function displayToken() {
	  Kakao.Auth.login({
	      success: function (response) {
	        Kakao.API.request({
	          url: '/v2/user/me',
	          success: function (response) {
	        	  console.log(response)
	          },
	          fail: function (error) {
	            console.log(error)
	          },
	        })
	      },
	      fail: function (error) {
	        console.log(error)
	      },
	    })
	  }

  function getCookie(name) {
    var parts = document.cookie.split(name + '=');
    if (parts.length === 2) { return parts[1].split(';')[0]; }
  }
</script>


	
	<script>
	function init() {
		gapi.load('auth2', function() {
			gapi.auth2.init();
			options = new gapi.auth2.SigninOptionsBuilder();
			options.setPrompt('select_account');
	        // 추가는 Oauth 승인 권한 추가 후 띄어쓰기 기준으로 추가
			options.setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read');
	        // 인스턴스의 함수 호출 - element에 로그인 기능 추가
	        // GgCustomLogin은 li태그안에 있는 ID, 위에 설정한 options와 아래 성공,실패시 실행하는 함수들
			gapi.auth2.getAuthInstance().attachClickHandler('GgCustomLogin', options, onSignIn, onSignInFailure);
		})
	}
	
	function onSignIn(googleUser) {
		var access_token = googleUser.getAuthResponse().access_token
		$.ajax({
	    	// people api를 이용하여 프로필 및 생년월일에 대한 선택동의후 가져온다.
			url: 'https://people.googleapis.com/v1/people/me'
	        // key에 자신의 API 키를 넣습니다.
			, data: {personFields:'birthdays', key:'AIzaSyDZX2EWCEidZW8m0cXUpv3m_8kH82YKqUI', 'access_token': access_token}
			, method:'GET'
		})
		.done(function(e){
	        //프로필을 가져온다.
			var profile = googleUser.getBasicProfile();
			console.log(profile)
		})
		.fail(function(e){
			console.log(e);
		})
	}
	function onSignInFailure(t){		
		console.log(t);
	}
	</script>
	<script>
function onSignIn(googleUser) {
	  var profile = googleUser.getBasicProfile();
	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	  console.log('Name: ' + profile.getName());
	  console.log('Image URL: ' + profile.getImageUrl());
	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
	}
 <!-- [출처] [JAVASCRIPT] 구글 로그인 API 연동 넣기(JS, JavaScript)|작성자 Ohsanrim -->
</script>



	
	
	<!-- fh5co-blog-section -->

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>