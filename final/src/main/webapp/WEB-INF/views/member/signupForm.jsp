<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
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
									<form action="insert.me" method="post" >
										<div style="width:300px">


										<div class="form-group email-form">
											 <label for="email">이메일</label>
											 <div class="input-group">
											<input type="text" class="form-control" name="userEmail1" id="userEmail1" placeholder="이메일" onchange="combineEmail()" >
											<select class="form-control" name="userEmail2" id="userEmail2" onchange="combineEmail()" >
												<option value="@naver.com">@naver.com</option>
												<option value="@daum.net">@daum.net</option>
												<option value="@gmail.com">@gmail.com</option>
												<option value="@hanmail.com">@hanmail.com</option>
												<option value="@yahoo.co.kr">@yahoo.co.kr</option>
											</select>
											<input type="hidden" name="email" id="email"> 
											</div>   
											  <div class="check-area" style="display:none; color:green;">사용 가능한 이메일입니다.</div> 
										<div class="input-group-addon">
											<button type="button" class="btn btn-primary" id="mail-Check-Btn">본인인증</button>
											 <button type="button" class="btn btn-primary" id="email-Check-Btn" onclick="checkEmail()">중복체크</button>
										</div>
											<div class="mail-check-box">
										<input class="form-control mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
										</div>
											<span id="mail-check-warn"></span>
										</div>
										<div style="padding: 4px;">(필수)비밀번호</div>
										<div>
											<input class="form-control" type="password" name="userPwd" id="userPwd" required placeholder="8~20자" onkeyDown="check(), matching()" />
											<div style="font-size:10px" id="text-area"></div>
										</div>


										<div style="padding: 4px;">(필수)비밀번호 확인</div>
										<div>
											<input class="form-control" type="password" name="checkPwd" id="checkPwd" onkeyDown=" matching()" />
											<div style="font-size:11px" id="eqPwd"></div>
										</div>
										
										<div style="padding: 4px;">(필수)이름</div>
										<div><input class="form-control" type="text" name="userName" id="userName" required /></div>

										<div style="padding: 4px;">(필수)성별</div>
									    <div>
									        <input type="radio" name="gender" value="M" id="genderM" />남
									        <input type="radio" name="gender" value="F" id="genderF" />여
									        <span id="genderError" style="color:red; display:none;">성별을 선택해주세요.</span>
									    </div>


										<div style="padding: 4px;">생년월일</div>
										<div><input class="form-control" type="date" name="brithday" id="brithday" /></div>


										<div style="padding: 4px;">전화번호</div>
										<div><input class="form-control" type="text" name="phone" id="phone" placeholder="-없이" /></div>


										<div style="padding: 4px;">주소</div>
										<div >
											<input type="text"   id="sample4_postcode" class="form-control" placeholder="우편번호">
											<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
											<input type="text"  id="sample4_roadAddress" class="form-control" name="address" placeholder="도로명주소">
											<span id="guide" style="color:#999;display:none"></span>
											<input type="text"  id="sample4_detailAddress" class="form-control" name="address" placeholder="상세주소">
										</div>
										
										<!-- 초대코드 입력할 수 있게 수정 - by 동규 (2024.10.15) -->
										<div style="padding: 4px;">초대코드</div>
										<div><input type="text" id="checkCode" name="checkCode" value="${ checkCode }" class="form-control" maxlength="15" placeholder="초대코드"></div><br>
										<div>
											<button type="reset" class="btn btn-primary btn-lg">초기화</button>
											<button type="submit" id="create" class="btn btn-primary btn-lg">계정 생성</button>
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
	
	<script>
		$("#userPwd").on('input', function(){
  			const password = $("#userPwd").val();
  			const regPwd = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,20}$/;
  			var message = $('#text-area');
  			if(!regPwd.test(password)){
  				message.text("비밀번호는 영문자와 숫자를 포함한 8~20자로 입력해야 합니다.").css("color", "red");
  				$("#create").hide();
  			}else{
  				message.text("");
  				$("#create").show();
  			}
  			
  		});
		</script>
  		
  		<script>
  		$(document).ready(function() {
  		    $("#checkPwd").on('input', function() {
  		        const userPwd = $("#userPwd").val();
  		        const checkPwd = $("#checkPwd").val();
  		        var message = $('#eqPwd');

  		        if (userPwd !== checkPwd) {
  		            message.text("일치하지 않습니다.").css("color", "red");
  		            $("#create").hide(); // 이 버튼의 ID가 "create"가 맞는지 확인
  		        } else {
  		            message.text("일치합니다.").css("color", "green");
  		            $("#create").show();
  		        }
  		    });
  		});
  		</script>
  		
  		<script>
  		$('#mail-Check-Btn').click(function() {
  			const eamil = $('#userEmail1').val() + $('#userEmail2').val(); // 이메일 주소값 얻어오기!
  			console.log('완성된 이메일 : ' + eamil); // 이메일 오는지 확인
  			const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
  			
  			$.ajax({
  				type : 'get',
  				url : '/final/mailCheck?email='+eamil, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
  				success : function (data) {
  					console.log("data : " +  data);
  					checkInput.attr('disabled',false);
  					code =data;
  					alert('인증번호가 전송되었습니다.')
  				}			
  			}); // end ajax
  		}); // end send eamil
  		
  		// 인증번호 비교 
  		// blur -> focus가 벗어나는 경우 발생
  		$('.mail-check-input').blur(function () {
  			const inputCode = $(this).val();
  			const $resultMsg = $('#mail-check-warn');
  			
  			if(inputCode === code){
  				$resultMsg.html('인증번호가 일치합니다.');
  				$resultMsg.css('color','green');
  				$('#mail-Check-Btn').attr('disabled',true);
  				$('#userEamil1').attr('readonly',true);
  				$('#userEamil2').attr('readonly',true);
  				$('#userEmail2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
  		        $('#userEmail2').attr('onChange', 'this.selectedIndex = this.initialSelect');
  		        $("#create").show();
  			}else{
  				$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
  				$resultMsg.css('color','red');
  				$("#create").hide();
  			}
  		});
  		
  		</script>
  		
  		<script>
			function combineEmail() {
			    const emailInput = document.getElementById("userEmail1").value;
			    const emailDomain = document.getElementById("userEmail2").value;
			    const fullEmail = emailInput + emailDomain;
			    
			    console.log(fullEmail);
			    
			    document.getElementById("email").value = fullEmail;
			}
		</script>
  		
  		<script>
		    function validateForm() {
		        const genderM = document.getElementById("genderM").checked;
		        const genderF = document.getElementById("genderF").checked;
		
		        if (!genderM && !genderF) {
		            document.getElementById("genderError").style.display = "inline"; // 성별 오류 메시지 표시
		            return false; // 폼 제출 중지
		        }
		
		        document.getElementById("genderError").style.display = "none"; // 오류 메시지 숨기기
		        return true; // 폼 제출 허용
		    }
		</script>
		


   
  <script type="text/javascript">
    function combineEmail() {
        const emailInput = document.getElementById("userEmail1").value;
        const emailDomain = document.getElementById("userEmail2").value;
        const fullEmail = emailInput + emailDomain;
        
        document.getElementById("email").value = fullEmail;
    }

    function checkEmail() {
    	const email = document.getElementById("email").value;

        $.ajax({
            url: 'idcheck',  // Controller의 이메일 중복 체크를 위한 URL
            type: 'POST',
            data: { email: email },
            success: function(response) {
                const checkArea = document.querySelector('.check-area');

                if (response === '이미 존재하는 이메일입니다.') {
                    checkArea.style.display = 'block';
                    checkArea.style.color = 'red';
                    checkArea.textContent = '이미 존재하는 이메일입니다.';
                } else {
                    checkArea.style.display = 'block';
                    checkArea.style.color = 'green';
                    checkArea.textContent = '사용 가능한 이메일입니다.';
                }
            },
            error: function() {
                alert('서버 통신 오류입니다.');
            }
        });
    }
</script>

  		
 <!--   	-->	
  		 <script>
  				 
		/*	
    // 비밀번호 정규식 (8~14자, 영문자와 숫자 필수)
      function check() {
    	var password = document.getElementById("userPwd").value;
        var regex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,20}$/;
        var message1 = document.getElementById("text-area");
        if (!regex.test(password)) {
            message1.textContent = "비밀번호는 영문자와 숫자를 포함한 8~20자로 입력해야 합니다.";
        } else {
            message1.textContent = ""; // 조건에 맞으면 메시지 숨김
        }
    }

    // 비밀번호 일치 확인
   function matching() {
	    	 var password = document.getElementById("userPwd").value;
	         var checkPwd = document.getElementById("checkPwd").value;
	         var message2 = document.getElementById("eqPwd");
	    	 
	       	if (password !== checkPwd) {
	            message2.textContent = "비밀번호가 일치하지 않습니다.";
	            message2.style.color = "red";
	        } else {
	            message2.textContent = "비밀번호가 일치합니다.";
	            message2.style.color = "green"; // 일치하면 메시지 녹색
	      	}
   		 }
  		
    */  

   
</script>
	
	
	 
   

 
	
	

	<!-- fh5co-blog-section -->
	
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>