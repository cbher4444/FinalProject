<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>


	<!-- 메뉴바 -->
	<jsp:include page="../common/menubar.jsp"/>
	
	<!-- 내용 -->
	<div id="fh5co-blog-section" class="fh5co-section-gray">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center heading-section">
					<h2>회원가입</h2>
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
													<td style="padding:4px;"> 이메일  </td>
													<td><input type="email" required placeholder="이메일 적어주세요" /></td>
													
												</tr>
												<tr>
													<td style="padding:4px;">비밀번호 </td>
													<td><input type="password" placeholder="8~20자"  /></td>
												</tr>
												<tr>
													<td style="padding:4px;"> 비밀번호 확인  </td>
													<td><input type="text" /></td>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td style="padding:4px;"> 성별  </td>
													<td>
														<input type="radio" name="gender" value="M" />남
														<input type="radio" name="gender" value="F" />여
													</td>
												</tr>
												<tr>
													<td style="padding:4px;"> 생년월일  </td>
													<td><input type="text" /></td>	
												</tr>
												<tr>
													<td style="padding:4px;"> 전화번호  </td>
													<td><input type="text" /></td>
												</tr>
												<tr>
													<td style="padding:4px;"> 주소 </td>
													<td><input type="text" /></td>
												</tr>
																			
											</tbody>
										</table>
										<div style="margin-left:10px;">
											<a href="signupForm" class="btn btn-primary btn-lg">초기화</a>
											<a href="reEnrollFrom.me" class="btn btn-primary btn-lg">게정 생성</a>
										</div>
									</form>
								</div>
							</div> 
						</div>
					</div>
					
			</div>

		</div>
	</div>
	<!-- fh5co-blog-section -->
	
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>