<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="java.util.Calendar" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>

	<!-- 계정삭제 -->
	<div id="fh5co-couple" class="fh5co-section-gray">
		<div class="container">
			<div class="row animate-box">
				<div class="col-md-12 text-center heading-section" style="margin-bottom: 0;">
					<h2>😥 계정삭제 대기중입니다.</h2>
					<p>탈퇴신청 후 30일 내에는 계정을 복구 할 수 있습니다.<br>30일 이후에는 계정이 완전히 삭제됩니다.</p>
				</div>
			</div>
			<div class="row animate-box">
				<div class="col-md-12 text-center heading-section" style="margin-bottom: 0;">
					<h3>계정삭제 신청일: ${ loginUser.modifyDate }</h3>
					<h3>계정삭제 예정일: ${ loginUser.deleteDate }</h3>
					<p>아래 버튼으로 계정을 복구할 수 있습니다.</p>
					<form class="form-inline" action="revert.me" method="post" onsubmit="return confirm('계정을 복구하시겠습니까?')" style="display: flex; flex-direction: column; align-items: center;">
						<div class="col-md-12 col-sm-12">
							<div class="form-group">
								<button type="submit"class="btn btn-primary btn-block">계정복구</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>