<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>UsTwo</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
	<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
	<meta name="author" content="FREEHTML5.CO" />

  <!-- 
	//////////////////////////////////////////////////////

	FREE HTML5 TEMPLATE 
	DESIGNED & DEVELOPED by FREEHTML5.CO
		
	Website: 		http://freehtml5.co/
	Email: 			info@freehtml5.co
	Twitter: 		http://twitter.com/fh5co
	Facebook: 		https://www.facebook.com/fh5co

	//////////////////////////////////////////////////////
	 -->

  	<!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">
	
	<link href="https://fonts.googleapis.com/css?family=Montez" rel="stylesheet">
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="resources/css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="resources/css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="resources/css/bootstrap.css">
	<!-- Superfish -->
	<link rel="stylesheet" href="resources/css/superfish.css">
	<!-- Magnific Popup -->
	<link rel="stylesheet" href="resources/css/magnific-popup.css">
	
	<link rel="stylesheet" href="resources/css/style.css">

	<!-- Modernizr JS -->
	<script src="resources/js/modernizr-2.6.2.min.js"></script>

	<!-- jQuery -->
	<!-- <script src="resources/dist/scripts.min.js"></script> --> <!-- 에러가 많아서 min.js 가 아닌 일반 js로 변경 - 동규 -->
	<script src="resources/dist/scripts.js"></script> 
		  <!-- 에러가 많아서 min.js 가 아닌 일반 js로 변경 - 동규 -->
</head>
<body>

	<div id="fh5co-wrapper"> <!-- footer.jsp에서 div 닫힘 -->
	<div id="fh5co-page"> <!-- footer.jsp에서 div 닫힘 -->
	
	<header id="fh5co-header-section" class="sticky-banner">
		<div class="container">
			<div class="nav-header">
				<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle dark"><i></i></a>
				<h1 id="fh5co-logo"><a href="home">UsTwo</a></h1>
				<!-- START #fh5co-menu-wrap -->
				<nav id="fh5co-menu-wrap" role="navigation">
					<ul class="sf-menu" id="fh5co-primary-menu">
						<li id="menubar_home"><a href="home">Home</a></li>
						<c:choose>
							<c:when test="${ empty loginUser }">
								<!-- case1. 로그인 전 -->
								<li id="menubar_login"><a href="loginForm">Login</a></li>
							</c:when>
							<c:otherwise>
								<!-- case2. 로그인 후 -->
								<li id="menubar_album"><a href="album">Album</a></li>
								<li id="menubar_map"><a href="map">Play</a></li>
								<li id="menubar_plan">
									<a href="calendar">Plan</a>
									<ul class="fh5co-sub-menu" style="min-width: fit-content;">
										<li id="menubar_calendar"><a href="calendar">캘린더</a></li>
										<li id="menubar_todo"><a href="todo">할일</a></li>
										<li id="menubar_bucket"><a href="bucket">버킷리스트</a></li>
									</ul>
								</li>
								<li id="menubar_budget"><a href="budget">Budget</a></li>
								<li id="menubar_fun">
									<a href="fun1" class="fh5co-sub-ddown">Fun</a>
									<ul class="fh5co-sub-menu">
										<li id="menubar_fun1"><a href="fun1">연애고사</a></li>
										<li id="menubar_fun2"><a href="fun2">오늘 뭐하지?</a></li>
										<li id="menubar_fun3"><a href="fun3">오늘의 질문</a></li>
										<li id="menubar_fun4"><a href="fun4">커플 랜덤퀴즈</a></li>
									</ul>
								</li>
								<li id="menubar_myPage"><a href="myPage">MyPage</a></li>
								<li id="menubar_adminPage"><a href="adminPage">AdminPage</a></li> <!-- 나중에 어드민일경우만 볼수 있도록 수정 할 예정 - 동규-->
								<li id="menubar_logout"><a href="logout">Logout</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</nav>
			</div>
		</div>
	</header>
	<c:if test="${not empty loginUser}">
		<jsp:include page="chatting.jsp"></jsp:include>
	</c:if>
	<!-- end:header-top -->

</body>
</html>