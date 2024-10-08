<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<style>
		#defaultContainerRowDiv2 {
			width: 70%;
			margin: 0 15%;
		}

		#made-testBody {
			width: 100%;
			border: 1px solid #000;
		}

		#made-testHead {
			width: 100%;
			height: 100px;
			border-bottom: 1px solid #000;
			font-size: 30px;
			padding-top: 35px;
		}

		#made-testContent {
			display: flex;
		}

		#made-testContent > div {
			width: 50%;
			padding: 20px;
		}

		#made-testContent > div > div {
			margin-bottom: 20px;
		}

		#made-testContentFirst {
			border-right: 1px solid #000;
		}

		.testQtitle {
			font-size: 20px;
		}

		input:focus {
			outline: none;
		}

		input[type='radio'] {
			-webkit-appearance: none;
			-moz-appearance: none;
			appearance: none;
			width: 13px;
			height: 13px;
			border: 1px solid #ccc;
			border-radius: 50%;
			cursor: pointer;
			outline: none;
		}
		
		input[type='radio']:checked {
			background-color: #111;
			border: 3px solid #fff;
			box-shadow: 0 0 0 1px #111;
		}
	</style>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="../common/menubar.jsp"/>
	<script>
		// 메뉴바에 클릭된 메뉴 하이라이트
		$(()=>{ $(".nav-header #menubar_fun").addClass("active"); })
		$(()=>{ $(".nav-header #menubar_fun1").addClass("active"); })
	</script>

	<!-- 내용 -->
	<div id="fh5co-blog-section" class="fh5co-section-gray">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center heading-section">
					<h2>연애고사</h2>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-md-offset-4 text-center animate-box" id="defaultContainerRowDiv2">
					<a href="javascript:void(0)" class="btn btn-primary btn-lg" id="default-btn">시험 치러 가기</a>

					<script>
						let questionSave;
						let optionSave;
						
						$(() => {
							$('#default-btn').on('click', () => {
								let content = '';
								let testNo = 1;
								$.ajax({
									url: "selectQuestion.test",
									data: {
										"coupleCode": 'DFGDFG5623SAD12',
										"email": 'user01@email.com',
									}, success: function(question) {
										questionSave = question;
										$.ajax({
											url: "selectOption.test",
											data: {"testNo": testNo},
											success: function(option) {
												optionSave = option;
												let value = `
														<div id="made-testBody">
															<div id="made-testHead">
																<div id="made-testTitle" align="center">유진 ❤️ 애신</div>
															</div>

															<div id="made-testContent">
																<div id="made-testContentFirst" class="testContent" align="left">
													`;
												for (let i = 0; i < 5; i++) {
													value += '<div id="made-testQ' + (Number(i) + 1) + '" class="testQ">';
														value += '<div id="made-testQ' + (Number(i) + 1) + 'Title" class="testQtitle">';
															value += 'Q' + (Number(i) + 1) + '. ' + question[i].qtestContent;
														value += '</div>';
														value += '<div id="made-testQ' + (Number(i) + 1) + 'Content" class="testQcontent">';
															let countFirst = 0;
															for (let j in option) {
																if (question[i].qtestNo === option[j].qtestNo) {
																	value += '<input type="radio" name="made-testQ' + (Number(i) + 1) + 'A" id="made-testQ' + (Number(i) + 1) + 'A' + (Number(j) + 1) + '">';
																	value += '<label for="made-testQ' + (Number(i) + 1) + 'A' + (Number(j) + 1) + '">&nbsp;&nbsp;' + option[j].optionContent + '</label> <br>'; // 반복(4)
																
																	countFirst = 1;
																}
															}
															if (!countFirst) {
																value += '<input type="text" name="made-testQ' + (Number(i) + 1) + 'A" id="made-testQ' + (Number(i) + 1) + 'Ainput' + (Number(i) + 1)
																			+ '" style="width: 87%; margin: 0 3% 0 10%; background-color: #00000000; border: none; border-bottom: 1px solid #000;">';
															}
														value += '</div>';
													value += '</div>';
												};
												value += '</div>';
												value += '<div id="made-testContentSecond" class="testContent" align="left">';
													for (let i = 5; i < 10; i++) {
													value += '<div id="made-testQ' + (Number(i) + 1) + '" class="testQ">';
														value += '<div id="made-testQ' + (Number(i) + 1) + 'Title" class="testQtitle">';
															value += 'Q' + (Number(i) + 1) + '. ' + question[i].qtestContent;
														value += '</div>';
														value += '<div id="made-testQ' + (Number(i) + 1) + 'Content" class="testQcontent">';
															let countSecond = 0;
															for (let j in option) {
																if (question[i].qtestNo === option[j].qtestNo) {
																	value += '<input type="radio" name="made-testQ' + (Number(i) + 1) + 'A" id="made-testQ' + (Number(i) + 1) + 'A' + (Number(j) + 1) + '">';
																	value += '<label for="made-testQ' + (Number(i) + 1) + 'A' + (Number(j) + 1) + '">&nbsp;&nbsp;' + option[j].optionContent + '</label> <br>'; // 반복(4)
																
																	countSecond = 1;
																}
															}

															if (!countSecond) {
																value += '<input type="text" name="made-testQ' + (Number(i) + 1) + 'A" id="made-testQ' + (Number(i) + 1) + 'Ainput' + (Number(i) + 1)
																			+ '" style="width: 87%; margin: 0 3% 0 10%; background-color: #00000000; border: none; border-bottom: 1px solid #000;">';
															}
														value += '</div>';
													value += '</div>';
												};
												value += `
																</div>
															</div>
															</div>

															<br><br>

															<a href="javascript:void(0)" class="btn btn-primary btn-lg" id="default-btn" onclick="checkDone()">채점하기</a>
														`;

												$('#defaultContainerRowDiv2').html(value);
											}, error: function() {
												console.log('ajax 통신 에러 : 보기 조회');
											}
										});
									}, error: function() {
										console.log('ajax 통신 에러 : 질문 조회');
									}
								});								
							});
						});

						function checkDone() {
							let count = 0;

							for (let i = 1; i < 11; i++) {
								for (let j = 0; j < 4; j++) {
									let checkedOption = $('input[name^=made-testQ' + i +'A]')[j];
									if ($(checkedOption).prop('checked')) {
										count = count + 1;
									}
								}
							}

							if (count !== 10) {
								if (confirm('아직 문제를 다 풀지 않았습니다. 그래도 제출하시겠습니까?')) {
									grading();
								}
							} else {
								grading();
							}
						}

						function grading() {
							let count = 0;

							for (let i = 1; i < 11; i++) {
								for (let j = 0; j < 4; j++) {
									let checkedOption = $('input[name^=made-testQ' + i +'A]')[j];
									if ($(checkedOption).prop('checked')) {
										let optionContent = $(checkedOption).next('label').text().trim();
										let qtestContent = cutStringAfterChar($(checkedOption).closest('.testQ').children('.testQtitle').text(), '.').trim();

										// 같은 문제의 선택지 중 선택한 것과 일치하는 선택지의 optionTrue 확인 -> Y면 +10
										for (let k in optionSave) {
											if (optionContent === optionSave[k].optionContent) {
												if ('Y' === optionSave[k].optionTrue) {
													count += 10;
												}
											}
										}
									}
								}
							}

							let comment = "";

							if (count <= 20) {
								comment = 'OTL...';
							} else if (count <= 40) {
								comment = 'OMG...'
							} else if (count <= 60) {
								comment = 'Not Bad'
							} else if (count <= 80) {
								comment = 'GOOD!'
							} else {
								comment = 'Perfect!';
							}

							$('#defaultContainerRowDiv2').html(comment + '<br />' + count + "점").css('fontSize', '40px');
						}

						function cutStringAfterChar(str, char) {
							const index = str.indexOf(char);
							if (index !== -1) {
								return str.substring(index + 1);
							}
							return '';
						}
					</script>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>