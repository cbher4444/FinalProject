<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <style>
        .copyright *{
            font-size: 16px;
        }
    </style>
</head>
<body>

    <footer>
        <div id="footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 text-center">
                    	<c:choose>
							<c:when test="${ empty loginUser or loginUser.status ne 'Y'}">
								<!-- case1. 로그인 전 or 커플등록이 안됨 or 탈퇴대기 중 -->
								<h2>UsTwo</h2>
							</c:when>
							<c:otherwise>
								<!-- case2. 로그인 후 and 커플등록완료 -->
								<h2>
									<c:choose>
										<c:when test="${ empty loginUser.nickName }">
											${ loginUser.userName }
										</c:when>
										<c:otherwise>
											${ loginUser.nickName }
										</c:otherwise>
									</c:choose>
									&amp;
									<c:choose>
										<c:when test="${ empty partner.nickName }">
											${ partner.userName }
										</c:when>
										<c:otherwise>
											${ partner.nickName }
										</c:otherwise>
									</c:choose>
								</h2>
							</c:otherwise>
						</c:choose>
                    </div>
                    <div class="col-md-6 col-md-offset-3 text-center copyright">
                        <p>Copyright 2024 <a href="https://github.com/cbher4444/final" target="_blank">4랑해조❤️</a>. All Rights Reserved. <br>
                        Template supported by <a href="http://freehtml5.co/" target="_blank">Freehtml5.co</a> / Demo Images: <a href="https://unsplash.com/" target="_blank">Unsplash</a></p>
                    </div>
                </div>
            </div>
        </div>
    </footer>

<!-- Google Map -->
<!-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCefOgb1ZWqYtj7raVSmN4PL2WkTrc-KyA&sensor=false"></script> -->

</body>
</html>