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
					<a href="javascript:void(0)" class="btn btn-primary btn-lg" id="default-btn">고사 시작</a>
					<a href="javascript:void(0)" class="btn btn-primary btn-lg" id="made-btn">지난 시험 조회</a>

					<script>
						let questionSave;
						let optionSave;

						function selectLastTest() {
							$.ajax({
								url: "selectQtest.test",
								data: {
									"email": '${ loginUser.email }', // 고사 응시자 email
									"coupleCode": '${ loginUser.coupleCode }',
								}, success: function(question) {
									questionSave = question;
									$.ajax({
										url: "selectOptionTest.test",
										data: {"testNo": question[0].testNo},
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
																value += '<input type="radio" name="made-testQ' + question[i].qtestNo + 'A" id="' + option[j].optionNo + 'made-testQ' + question[i].qtestNo + 'A' + (Number(j) + 1) + '">';
																value += '<label for="' + option[j].optionNo + 'made-testQ' + question[i].qtestNo + 'A' + (Number(j) + 1) + '">&nbsp;&nbsp;' + option[j].optionContent + '</label> <br>'; // 반복(4)
															
																countFirst = 1;
															}
														}
														if (!countFirst) {
															value += '<input type="text" name="made-testQ' + question[i].qtestNo + 'A" id="made-testQ' + question[i].qtestNo + 'Ainput' + question[i].qtestNo
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
																value += '<input type="radio" name="made-testQ' + question[i].qtestNo + 'A" id="' + option[j].optionNo + 'made-testQ' + question[i].qtestNo + 'A' + (Number(j) + 1) + '">';
																value += '<label for="' + option[j].optionNo + 'made-testQ' + question[i].qtestNo + 'A' + (Number(j) + 1) + '">&nbsp;&nbsp;' + option[j].optionContent + '</label> <br>'; // 반복(4)
															
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

											$.ajax({
												url: 'selectAtest.test',
												data: {
													'testNo': question[0].testNo,
													'email': '${ loginUser.email }',
													'coupleCode': '${ loginUser.coupleCode }'
												},
												success: function(atest) {
													if (atest.length !== 0) { // 선택했던 값이 존재할 때
														for (let i in atest) {
															for (let j in optionSave) {
																if (atest[i].atestContent === optionSave[j].optionContent) {
																	$('input[id^=' + optionSave[j].optionNo +'made-testQ]').attr('checked', true);
																}
															}
														}

														if (atest.length === 10) {
															$('input[type=radio]').attr('disabled', true);
														}
													}
												}
											});
										}, error: function() {
											console.log('ajax 통신 에러 : 보기 조회');
										}
									});
								}, error: function() {
									console.log('ajax 통신 에러 : 질문 조회');
								}
							});	
						}

						function callGemini() {
							$.ajax({
								url: "geminiTest",
								data: {
									"email": '${ loginUser.partnerEmail }', // 상대방 email(상대방 설문조사 결과 조회)
									"coupleCode": '${ loginUser.coupleCode }',
									"myEmail": '${ loginUser.email}',
								}, success: function(testNo) {
									selectLastTest();
								}, error: function() {
									console.log("Error insertTest")
								},
							});
						}
						
						$(() => {
							$('#default-btn').on('click', () => {
								$.ajax({
									url: 'countAtest.test',
									data: {
										"email": '${ loginUser.email }',
										"coupleCode": '${ loginUser.coupleCode }',
									},
									success: function(num) {
										if (num === 10) {
											callGemini();
										} else {
											if(confirm('기존에 풀던 고사가 아직 완료되지 않았습니다. 이어서 푸시겠습니까?')) {
												selectLastTest();
											} else {
												callGemini();
											}
										}
									}, error: function() {
										console.log('ajax : countAtest');
									}
								});							
							});
						
							$('#made-btn').on('click', () => {
								selectLastTest();
							});

							$(document).on('click', 'input[type=radio]', function() {
								let id = $(this).attr('id');

								let optionNo = Number(id.substring(0, id.indexOf('m')));
								let qtestNo = Number(id.substring(id.indexOf('Q') + 1, id.indexOf('A')));

								for (let i in optionSave) {
									if (optionNo === optionSave[i].optionNo) {
										let myOption = optionSave[i];
										$.ajax({
											url: 'selectAtest.test',
											data: {
												'testNo': myOption.testNo,
												'email': '${ loginUser.email }',
												'coupleCode': '${ loginUser.coupleCode }'
											},
											success: function(atest) {
												if (atest.length === 0) {
													// 답변한 질문이 없다면
													$.ajax({
														url: 'insertAtest.test',
														data: {
															'atestContent': myOption.optionContent,
															'atestTrue': myOption.optionTrue,
															'qtestNo': qtestNo,
															'testNo': myOption.testNo,
															'email': '${ loginUser.email }',
															'coupleCode': '${ loginUser.coupleCode }'
														},
														success: function(result) {
															console.log(result)
														}, error: function() {
															console.log('ajax : insertAtest');
														},
													});
												} else {
													let flag = 0;

													for (let i in atest) {
														if (qtestNo === atest[i].qtestNo) {
															flag = 1;
														}
													}

													if (flag) {
														// 답변한 질문 중에 있다면
														$.ajax({
															url: 'updateAtest.test',
															data: {
																'atestContent': myOption.optionContent,
																'atestTrue': myOption.optionTrue,
																'qtestNo': qtestNo,
																'testNo': myOption.testNo,
																'email': '${ loginUser.email }',
																'coupleCode': '${ loginUser.coupleCode }'
															},
															success: function(result) {
																console.log(result)
															}, error: function() {
																console.log('ajax : updateAtest')
															},
														});
													} else {
														// 답변한 질문 중에 없다면
														$.ajax({
															url: 'insertAtest.test',
															data: {
																'atestContent': myOption.optionContent,
																'atestTrue': myOption.optionTrue,
																'qtestNo': qtestNo,
																'testNo': myOption.testNo,
																'email': '${ loginUser.email }',
																'coupleCode': '${ loginUser.coupleCode }'
															},
															success: function(result) {
																console.log(result)
															}, error: function() {
																console.log('ajax : insertAtest');
															},
														});
													}
												}
											}, error: function() {
												console.log('ajax : selectAtest');
											}
										});
									}
								};
							});
						});

						function checkDone() {
							let count = 0;

							for (let i in optionSave) {
								for (let j = 0; j < 4; j++) {
									let checkedOption = $('input[name^=made-testQ' + optionSave[i].optionNo +'A]')[j];
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

							for (let i in optionSave) {
								for (let j = 0; j < 4; j++) {
									let checkedOption = $('input[name^=made-testQ' + optionSave[i].optionNo +'A]')[j];
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

							$.ajax({
								url: 'updateTest.test',
								data: {
									'testScore': count,
									'testNo': optionSave[0].testNo,
									'email': '${ loginUser.email }',
									'coupleCode': '${ loginUser.coupleCode }'
								},
								success: function() {
									console.log('업데이트 성공')
								}, error: function() {
									console.log('ajax : updateTest')
								}
							})

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