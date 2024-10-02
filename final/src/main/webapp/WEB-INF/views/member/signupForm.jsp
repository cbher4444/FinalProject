<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>

</head>

<body onload="init();">


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
									<form action="" method="post" align="left" name="form" id="form">
										<div style="width:300px">


										<div style="padding: 4px;">이메일</div>
										<input type="email" name="email" id="id" required placeholder="이메일 적어주세요" />
										<div width="50px"><button onclick="">확인</button></div>


										<div style="padding: 4px;">비밀번호</div>
										<div><input type="password" name="userPwd" id="pwd" placeholder="8~20자" /></div>
										<div></div>

										<div style="padding: 4px;">비밀번호 확인</div>
										<div>
											<input type="password" name="checkPwd"id="checkPwd" />
										</div>
										<div id="eqPwd"></div>

										<div style="padding: 4px;">성별</div>
										<div>
											<input type="radio" name="gender"value="M" />남 
											<input type="radio" name="gender" value="F" />여
										</div>


										<div style="padding: 4px;">생년월일</div>
										<div><input type="text" name="birthday" /></div>


										<div style="padding: 4px;">전화번호</div>
										<div><input type="text" name="phone" /></div>


										<div style="padding: 4px;">주소</div>
										<div>
											<input type="text" id="sample4_postcode" placeholder="우편번호">
											<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
											<input type="text" id="sample4_roadAddress" placeholder="도로명주소">
											<span id="guide" style="color:#999;display:none"></span>
											<input type="text" id="sample4_detailAddress" placeholder="상세주소">

										</div>
											
										<br><br>
										
										<div style="padding: 4px;">초대코드입력</div>
										<div><input type="text" name="code" placeholder="초대코드입력해주세요" /></div>

								
										<div>
											<a href="signupForm" class="btn btn-primary btn-lg">초기화</a>
											<a href="reEnrollFrom.me" id="create" class="btn btn-primary btn-lg">계정 생성</a>
										</div>
										</div>
									</form>
								</div>
							</div> 
						</div>
					</div>
					
			</div>

		</div>
	</div>
	
	<script type="text/javascript">
		$(function(){
			if($("#pwd").val() === $("#checkPwd").val()){
				$("#eqPwd").html().text('비밀번호 일치');
			}else{
				$("#eqPwd").html().text('비밀번호 불일치. 다시 확인해주세요');
			}
			
		})
	</script>
	
	

	<!-- fh5co-blog-section -->
	
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>