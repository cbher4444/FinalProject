<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">

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
								<form action="findId" method="get"> 
									<div align="center">
									<lable> 이름  </lable>
									<input type="text" onkeyup="checkCapsLock(event)" id="userName" name="userName"/>
									
									<br>
									<lable>전화번호</lable>
									<input type="text" id="phone" name="phone" onkeyup="checkCapsLock(event)"/>
									
									<br>
										<br>	<br>
									</div>
									
									<div align="center">
										<a href="loginForm" class="btn btn-primary btn-lg">뒤로가기</a>
										<button type="submit" class="btn btn-primary btn-lg">아이디 찾기</button>
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

	

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>