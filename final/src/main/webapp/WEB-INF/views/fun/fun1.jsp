<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
		<style>
			#defaultContainerRowDiv2 {
				width: 70%;
				margin: 0 15%;
			}
	
			#made-testBody, #made-serveyBody {
				width: 100%;
				border: 1px solid #000;
			}
	
			#made-testHead, #made-serveyHead {
				width: 100%;
				height: 100px;
				border-bottom: 1px solid #000;
				font-size: 30px;
				padding-top: 35px;
			}
	
			#made-testContent, #made-serveyContent {
				display: flex;
			}
	
			#made-testContent > div,
			#made-serveyContent > div {
				width: 50%;
				padding: 20px;
			}
	
			#made-testContent > div > div,
			#made-serveyContent > div > div {
				margin-bottom: 20px;
			}
	
			#made-testContentFirst, #made-serveyContentFirst {
				border-right: 1px solid #000;
			}
	
			.testQtitle, .serveyQtitle {
				font-size: 20px;
			}

			.serveyQ {
				min-height: 150px;
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
			
			table {
				width: 100%;
			}

			table td {
				height: 40px;
			}
			
			table > thead > tr > td {
				font-weight: bold;
			}

			table, thead, tbody, tr, td {
				border: 1px solid #00000080;
  				border-collapse: collapse;
			}

			button {
				background-color: #F69D9D;
				color: white !important;
				border: none;
				border-radius: 5px;
			}

			#pageBar {
				display: flex;
				justify-content: center;
			}

			.btnDiv {
				width: 40px;
				height: 20px;
				margin-top: 5px;
			}

			.btnDiv a:hover {
				color: #F69D9D !important;
			}

			.btnDiv a {
				font-size: 18px !important;
				text-align: center;
				padding: 5px;
			}

			.btnDiv a:not(.currentPage) {
				color: #00000080 !important;
			}

			.wrong, .right {
				position: absolute;
				width: 90px;
				height: 90px;
				display: none;
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
					</div>
				</div>
			</div>
		</div>
	
		<script>
			let questionSave;
			let optionSave;
			let randomSave = [];
			let qserveySave = [];
			let value = '';
			let changeNum = 0;
			let firstPage = '';
			let secondPage = '';
			let thirdPage = '';
			let inputValues = {
				firstPage: [],
				secondPage: [],
				thirdPage: [],
			};
			let insertAserveyResult = 0;
	
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
								value = `
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
	
											<a href="javascript:void(0)" class="btn btn-primary btn-lg" id="made-count" onclick="checkDone()">채점하기</a>
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
				$('#defaultContainerRowDiv2').html(`
					<img src="https://www.dujon.co.kr/img/main/loading.gif" alt="로딩" style="width: 100px; height: 100px;">
					<br />
					<br />
					<div id="loadingText" style="font-size: 20px">로딩 중</div>
				`);
				
				function startLoading() {
					let count = 0;
					const texts = ['로딩 중.', '로딩 중..', '로딩 중...', '로딩 중'];
					
					setInterval(() => {
						$('#loadingText').text(texts[count % texts.length]);
						count++;
					}, 1000);
				}

				setTimeout(startLoading, 1000);

				$.ajax({
					url: "geminiTest",
					data: {
						"email": '${ partner.email }', // 상대방 email(상대방 설문조사 결과 조회)
						"coupleCode": '${ loginUser.coupleCode }',
						"nickName": '${ partner.nickName }',
						"myEmail": '${ loginUser.email}',
						"myName": '${ loginUser.nickName}',
					}, success: function(testNo) {
						selectLastTest();
					}, error: function() {
						console.log("Error insertTest")
					},
				});
			}

			function checkDone() {
				let count = 0;
	
				for (let i in optionSave) {
					for (let j = 0; j < 4; j++) {
						checkedOption = $('input[name^=made-testQ' + optionSave[i].qtestNo +'A]')[j];
						if ($(checkedOption).prop('checked')) {
							console.log(checkedOption)
							count = count + 1;
						}
					}
				}
	
				if ((count / 4) !== 10) {
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
						let checkedOption = $('input[name^=made-testQ' + optionSave[i].qtestNo +'A]')[j];
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
	
				count = count / 4;
	
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
				});
	
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

			function madeContent(num) {
				value += `<div id="made-serveyQ` + (Number(num) + 1) + `" class="serveyQ">
							<div id="made-serveyQ` + (Number(num) + 1) + `Title" class="serveyQtitle">
								Q` + (Number(num) + 1) + `. ` + qserveySave[num].qserveyContent + `
							</div>
							<div id="made-serveyQ` + (Number(num) + 1) + `Content" class="serveyQcontent">
								<input type="text" id="made-serveyQ` + (Number(num) + 1) + `Input" class="serveyQinput"
								style="width: 87%; margin: 30px 3% 0 10%; background-color: #00000000; border: none; border-bottom: 1px solid #000;">
							</div>
						</div>`
			}

			function pageMove() {
				if (changeNum <= 20) {
					value = '';
					changeNum = changeNum + 5;
					for (let i = changeNum; i < (changeNum + 5); i++) {
						madeContent(i);
					}
					
					$('#made-serveyContentFirst').html(value);
				
					value = '';
					changeNum = changeNum + 5;
					for (let i = changeNum; i < (changeNum + 5); i++) {
						madeContent(i);
					}
					
					$('#made-serveyContentSecond').html(value);
				}
			}

			function checkForm(str) {
				const regex = /^\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])$/;
				return regex.test(str);
			}

			function check1and11(one_11) {
				if (randomSave.includes(one_11)) {
					for (let i in qserveySave) {
						if (qserveySave[i].qserveyNo === one_11) {
							if (i < 10) {
								if (!checkForm(inputValues['firstPage'][i])) {
									alert('YYYY-MM-DD 형식에 맞춰 답변을 다시 입력해주세요.');
									$("#defaultContainerRowDiv2 input").each(function(index) {
										inputValues['thirdPage'][index] = $(this).val();
									});
									$("#defaultContainerRowDiv2").html(firstPage);
									$("#defaultContainerRowDiv2 input").each(function(index) {
										$(this).val(inputValues['firstPage'][index] || '');
									});
									changeNum = 15;
									$('#made-serveyQ' + (Number(i) + 1) + 'Title').css('color', '#F69D9D');
									$('#made-serveyQ' + (Number(i) + 1) + 'Input').css({
										'border-bottom': '1px solid #F69D9D',
										'color': '#F69D9D'
									});
									return 0;
								} 
							} else if (i < 20) {
								if (!checkForm(inputValues['secondPage'][i - 10])) {
									alert('YYYY-MM-DD 형식에 맞춰 답변을 다시 입력해주세요.');
									$("#defaultContainerRowDiv2 input").each(function(index) {
										inputValues['thirdPage'][index] = $(this).val();
									});
									$("#defaultContainerRowDiv2").html(secondPage);
									$("#defaultContainerRowDiv2 input").each(function(index) {
										$(this).val(inputValues['secondPage'][index] || '');
									});
									changeNum = 15;
									$('#made-serveyQ' + (Number(i) + 1) + 'Title').css('color', '#F69D9D');
									$('#made-serveyQ' + (Number(i) + 1) + 'Input').css({
										'border-bottom': '1px solid #F69D9D',
										'color': '#F69D9D'
									});
									return 0;
								} 
							} else if (i < 30) {
								if (!checkForm(inputValues['thirdPage'][i - 20])) {
									alert('YYYY-MM-DD 형식에 맞춰 답변을 다시 입력해주세요.');
									$('#made-serveyQ' + (Number(i) + 1) + 'Title').css('color', '#F69D9D');
									$('#made-serveyQ' + (Number(i) + 1) + 'Input').css({
										'border-bottom': '1px solid #F69D9D',
										'color': '#F69D9D'
									});
									return 0;
								} 
							}
						}
					}
				}
				return 1;
			}

			function insertAservey(str, index, originIndex) {
				$.ajax({
					url: 'insertAservey.servey',
					data: {
						'aserveyContent': inputValues[str][index],
						'qserveyNo': randomSave[originIndex],
						'email': '${ loginUser.email }',
						'coupleCode': '${ loginUser.coupleCode }'
					}, success: function(num) {
						insertAserveyResult += num;

						if (insertAserveyResult === 30) {
							// 모두 정상적으로 들어감
							location.reload(true);
						}
					}, error: function() {
						console.log('ajax : insertAservey');
					}
				});
			}

			function urgeKakao() {
				Kakao.init('4e64c4845db0e20f347c71d3c7d9983f');
				Kakao.Link.sendCustom({
					templateId: 113039
				});
			}

			function ajaxPage(cpage) {
				let url = 'selectTest.test';
				if (cpage) {
					url += '?cpage=' + cpage;
				}
				$.ajax({
					url: url,
					data: {'coupleCode': '${ loginUser.coupleCode }'},
					success: function(data) {
						let innerStr = `<table>
											<thead>
												<tr>
													<td>응시일</td>
													<td>응시자</td>
													<td>점수</td>
													<td></td>
												</tr>
											</thead>
										<tbody>`;
						for (let i in data.list) {
							let name = '';
							if (data.list[i].email === '${ loginUser.email }') {
								name = '${ loginUser.nickName }';
							} else {
								name = '${ partner.nickName }';
							}

							let testDate = data.list[i].testDate;
							let editDate = testDate.substring(testDate.indexOf(',') + 1).trim()
											+ '-'
											+ testDate.substring(0, testDate.indexOf('월')).trim()
											+ '-'
											+ testDate.substring(testDate.indexOf('월') + 1, testDate.indexOf(',')).trim()

							innerStr += '<tr>'
								innerStr += '<td>' + editDate + '</td>'
								innerStr += '<td>' + name + '</td>'
								innerStr += '<td>' + data.list[i].testScore + '</td>'
								innerStr += '<td>'
									innerStr += '<button type="button" class="btnbtnbtn" id="btnbtnbtn' + data.list[i].testNo + '">자세히 보기</button>'	
								innerStr += '</td>'
							innerStr += '</tr>'
						}
						innerStr += '</tbody></table>';
						innerStr += '<div id="pageBar">';
						if (data.pi.currentPage === 1) {
							innerStr += '<div class="btnDiv"></div>';
						} else {
							innerStr += '<div class="btnDiv"><a id="cpage' + (data.pi.currentPage - 1) + 'btn" class="page-link material-symbols-outlined" href="javascript:void(0)">arrow_back_ios</a></div>';
						}

						for (let i = 1; i <= data.pi.maxPage; i++) {
							innerStr += '<div class="btnDiv"><a id="cpage' + i + '" class="page-link" href="javascript:void(0)">' + i + '</a></div>';
						}

						if (data.pi.currentPage === data.pi.maxPage) {
							innerStr += '<div class="btnDiv"></div>';
						} else {
							innerStr += '<div class="btnDiv"><a id="cpage' + (data.pi.currentPage + 1) + 'btn" class="page-link material-symbols-outlined" href="javascript:void(0)">arrow_forward_ios</a></div>';
						}

						$('#defaultContainerRowDiv2').html(innerStr);
						
						if (cpage) {
							$('#cpage' + cpage).addClass('currentPage');
						} else {
							$('#cpage1').addClass('currentPage');
						}
					}
				});
			}
			
			$(() => {
				let exist = '${ count }'.split('/');
				if (Number(exist[0])) {
					// 마지막 고사 존재 -> 고사 시작, 지난 시험 조회 버튼
					$('#defaultContainerRowDiv2').html(
						`
							<a href="javascript:void(0)" class="btn btn-primary btn-lg" id="default-btn">고사 시작</a>
							<a href="javascript:void(0)" class="btn btn-primary btn-lg" id="made-btn">지난 시험 조회</a>
						`
					)
				} else {
					if ((exist[1] === '30') && (exist[2] === '30')) {
						// 둘 다 존재 -> 고사 시작 버튼
						$('#defaultContainerRowDiv2').html('<a href="javascript:void(0)" class="btn btn-primary btn-lg" id="made-newBtn" onClick="callGemini();">고사 시작</a>');
					} else if (exist[1] === '30') {
						// 나만 존재 -> 재촉하기 버튼
						$('#defaultContainerRowDiv2').html('<a href="javascript:void(0)" class="btn btn-primary btn-lg" onClick="urgeKakao();" id="made-btn-alarm">재촉하기</a>');
					} else if (exist[2] === '30' || (exist[1] === '0' && exist[2] === '0')) {
						// 상대방만 존재 or 둘 다 존재 X -> 설문조사 창 띄우기
						$.ajax({
							url: "selectQservey.test",
							success: function(qservey) {
								while (randomSave.length < 30) {
									let random = Math.floor(Math.random() * 30) + 1;

									if (!randomSave.includes(random)) {
										randomSave.push(random);
									}
								}

								for (let i in randomSave) {
									for (let j in randomSave) {
										if (randomSave[i] === qservey[j].qserveyNo) {
											qserveySave.push(qservey[j]);
										}
									}
								}
								value = `
									<div id="made-serveyBody">
										<div id="made-serveyHead">
											<div id="made-serveyTitle" align="center">유진 ❤️ 애신</div>
										</div>

										<div id="made-serveyContent">
											<div id="made-serveyContentFirst" class="serveyContent" align="left">`
										for (let i = changeNum; i < (changeNum + 5); i++) {
											madeContent(i);
										}
									value += '</div>'
									
									changeNum = changeNum + 5

									value += `<div id="made-serveyContentSecond" class="serveyContent" align="left">`
										for (let i = changeNum; i < (changeNum + 5); i++) {
											madeContent(i);
										}
									value += `</div>
										</div>
									</div>

									<br><br>

									<a href="javascript:void(0)" class="btn btn-primary btn-lg" id="made-next1">다음 페이지</a>
								`;
								
								$('#defaultContainerRowDiv2').html(value);
							}, error: function() {
								console.log('ajax 통신 에러 : 질문 조회');
							}
						});	
					} else {
						console.log('error');
					}
				}

				$(document).on('click', '#made-next1', () => {
					// 1 -> 2
					$("#defaultContainerRowDiv2 input").each(function(index) {
						inputValues['firstPage'][index] = $(this).val();
					});

					if (secondPage !== '') {
						// 기존 페이지 있음
						$("#defaultContainerRowDiv2").html(secondPage);
						$("#defaultContainerRowDiv2 input").each(function(index) {
							$(this).val(inputValues['secondPage'][index] || '');
						});
						changeNum = 15;
					} else {
						firstPage = $("#defaultContainerRowDiv2").html();
						pageMove();
						$('#made-next1').attr('id', 'made-pre1').text('이전 페이지');
						$("#defaultContainerRowDiv2").append('<a href="javascript:void(0)" class="btn btn-primary btn-lg" id="made-next2">다음 페이지</a>');
						secondPage = $("#defaultContainerRowDiv2").html();
					}
				});

				$(document).on('click', '#made-next2', function() {
					// 2 -> 3
					$("#defaultContainerRowDiv2 input").each(function(index) {
						inputValues['secondPage'][index] = $(this).val();
					});
					if (thirdPage !== '') {
						$("#defaultContainerRowDiv2").html(thirdPage);
						$("#defaultContainerRowDiv2 input").each(function(index) {
							$(this).val(inputValues['thirdPage'][index] || '');
						});
						changeNum = 25;
					} else {
						pageMove();
						$('#made-pre1').attr('id', 'made-pre2').text('이전 페이지');
						$('#made-next2').attr('id', 'made-done').text('제출하기');
						thirdPage = $("#defaultContainerRowDiv2").html();
					}
				});

				$(document).on('click', '#made-pre1', function() {
					// 2 -> 1
					$("#defaultContainerRowDiv2 input").each(function(index) {
						inputValues['secondPage'][index] = $(this).val();
					});
					$("#defaultContainerRowDiv2").html(firstPage);
					$("#defaultContainerRowDiv2 input").each(function(index) {
						$(this).val(inputValues['firstPage'][index] || '');
					});
					changeNum = 5;
				});

				$(document).on('click', '#made-pre2', function() {
					// 3 -> 2
					$("#defaultContainerRowDiv2 input").each(function(index) {
						inputValues['thirdPage'][index] = $(this).val();
					});
					$("#defaultContainerRowDiv2").html(secondPage);
					$("#defaultContainerRowDiv2 input").each(function(index) {
						$(this).val(inputValues['secondPage'][index] || '');
					});
					changeNum = 15;
				});

				$(document).on('click', '#made-done', function() {
					$("#defaultContainerRowDiv2 input").each(function(index) {
						inputValues['thirdPage'][index] = $(this).val();
					});
 
					let one;
					let eleven;

					for (let i in qserveySave) {
						if (qserveySave[i].qserveyNo === 1) {
							one = i;
						}
						if (qserveySave[i].qserveyNo === 11) {
							eleven = i;
						}
					}
					if (one < eleven) {
						if (check1and11(1)) {
							$(".serveyQtitle").css('color', '#848484');
							$('.serveyQinput').css({
								'color': '#848484',
								'border-bottom': '1px solid #848484'
							});
							if (check1and11(11)) {
								if (confirm('제출 후에는 답변을 수정할 수 없습니다. 정말 제출하시겠습니까?')) {
									for (let i in randomSave) {
										if (i < 10) {
											insertAservey('firstPage', i, i);
										} else if (i < 20) {
											insertAservey('secondPage', (i - 10), i);
										} else {
											insertAservey('thirdPage', (i - 20), i);
										}
									}
								}
							}
						}
					} else {
						if (check1and11(11)) {
							$(".serveyQtitle").css('color', '#848484');
							$('.serveyQinput').css({
								'color': '#848484',
								'border-bottom': '1px solid #848484'
							});
							if (check1and11(1)) {
								if (confirm('제출 후에는 답변을 수정할 수 없습니다. 정말 제출하시겠습니까?')) {
									for (let i in randomSave) {
										if (i < 10) {
											insertAservey('firstPage', i, i);
										} else if (i < 20) {
											insertAservey('secondPage', (i - 10), i);
										} else {
											insertAservey('thirdPage', (i - 20), i);
										}
									}
								}
							}
						}
					}
				});
				
				$(document).on('click', '#default-btn', () => {
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

				$(document).on('click', '#made-btn', () => {
					// selectLastTest();
					ajaxPage();
				});

				$(document).on('click', 'a[id^=cpage]', function(event) {
					let $id = $(event.target).attr('id');
					let cpage = $id.substring($id.indexOf('e') + 1).replace('btn', '').trim();
					ajaxPage(cpage);
				});
	
				$(document).on('click', '.btnbtnbtn', function(event) {
					let pagepage = Number($('.currentPage').text())
					$.ajax({
						url: "selectQtestSpecific.test",
						data: {
							testNo: $(event.target).attr('id').replace('btnbtnbtn', '').trim(),
						}, success: function(question) {
							questionSave = question;
							$.ajax({
								url: "selectOptionTest.test",
								data: {"testNo": question[0].testNo},
								success: function(option) {
									optionSave = option;
									value = `
											<div id="made-testBody">
												<div id="made-testHead">
													<div id="made-testTitle" align="center">유진 ❤️ 애신</div>
												</div>
		
												<div id="made-testContent">
													<div id="made-testContentFirst" class="testContent" align="left">
										`;
									for (let i = 0; i < 5; i++) {
										value += '<div id="made-testQ' + (Number(i) + 1) + '" class="testQ">';
											value += '<image class="wrong" src="https://www.sky72.com/kr/event/2013/08/30/images/incorrect_answer_img.png">'
											value += '<image class="right" src="https://www.sky72.com/kr/event/2013/08/30/images/correct_answer_img.png">'
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
											value += '<image class="wrong" src="https://www.sky72.com/kr/event/2013/08/30/images/incorrect_answer_img.png">'
											value += '<image class="right" src="https://www.sky72.com/kr/event/2013/08/30/images/correct_answer_img.png">'
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
		
												<a href="javascript:void(0)" class="btn btn-primary btn-lg" id="made-back" onclick="ajaxPage(` + pagepage + `)">목록으로</a>
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
															if (atest[i].atestTrue === 'N') {
																$('input[id^=' + optionSave[j].optionNo +'made-testQ]').closest('.testQ').children('.wrong').css('display', 'block');
															} else {
																$('input[id^=' + optionSave[j].optionNo +'made-testQ]').closest('.testQ').children('.right').css('display', 'block');
															}
														}
													}
												}
											}

											$('input[type=radio]').attr('disabled', true);
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
				})

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
		</script>
		
		<jsp:include page="../common/footer.jsp"/>
	</body>
</html>