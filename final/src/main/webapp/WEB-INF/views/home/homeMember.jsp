<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<style>
		#fh5co-couple img{
			width: 231px;
			height: 231px;
			object-fit: cover;
		}

		.modal-body{
			display: flex;
			flex-direction: column;
			align-items: start;
		}

		.modal-body .form-group{
			width: 100%;
		}

		.modal-footer{
			display: flex;
			flex-direction: column;
			align-items: center;
		}

		.modal-footer button{
			width: 50%;
			
		}
	</style>
</head>
<body>

	<!-- 메뉴바 위 메인사진 -->
	<jsp:include page="mainPicture.jsp"/>
	
	<!-- 메뉴바 -->
	<jsp:include page="../common/menubar.jsp"/>
	<script>
		// 메뉴바에 클릭된 메뉴 하이라이트
		$(()=>{ $(".nav-header #menubar_home").addClass("active"); })
	</script>

	<!-- 내용 -->
	<div id="fh5co-couple" class="fh5co-section-gray">
		<div class="container">
			<div class="row row-bottom-padded-md animate-box">
				<div class="col-md-6 col-md-offset-3 text-center">
					<div class="col-md-5 col-sm-5 col-xs-5 nopadding">
						<img src="https://image.kmib.co.kr/online_image/2018/1106/612211110012819446_1.jpg" class="img-responsive" alt="">
						<h3>유진초이</h3>
					</div>
					<div class="col-md-2 col-sm-2 col-xs-2 nopadding"><h2 class="amp-center"><i class="icon-heart"></i></h2></div>
					<div class="col-md-5 col-sm-5 col-xs-5 nopadding">
						<img src="https://dispatch.cdnser.be/wp-content/uploads/2018/10/20181029175012_00080030081851.jpg" class="img-responsive" alt="">
						<h3>고애신</h3>
					</div>
				</div>
			</div>
			<div class="row animate-box">
				<div class="col-md-8 col-md-offset-2">
					<div class="col-md-12 text-center heading-section">
						<h2>D+1000 💕</h2>
					</div>
				</div>
			</div>
			<div class="row animate-box" style="display: flex; justify-content: center;">
				<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">⚙️커플 홈 설정</button>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
		
			<!-- Modal content-->
			<div class="modal-content" style="padding-top: 10px;">
				<form class="form-inline">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" style="font-size: 30px;">&times;</button>
						<h3 class="modal-title">⚙️ 커플 홈 설정</h3>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="bgImg">커플 배경사진</label><br>
							<input type="file" id="bgImg">
						</div>
						<div class="form-group" style="margin: 20px 0;">
							<label for="coupleSentence">커플 문장</label><br>
							<input type="text" class="form-control" id="coupleSentence" placeholder="합시다, 러브. 나랑, 나랑 같이." style="width: 100%;"><br>
						</div>
						<div class="form-group">
							<label for="name">커플 만남시작날짜</label><br>
							<input type="date" class="form-control" id="dday" value="">
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary btn-block">수정</button>
						<button type="button" class="btn btn-secondary btn-block">취소</button>
					</div>
				</form>
			</div>


		</div>
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>

	<script>
		// 모달창안에 만난 날짜지정
		window.onload = function() {
			dday = new Date(2018, 6, 8);
			dday = dday.toISOString().slice(0, 10);
			document.getElementById("dday").value = dday;
		}

		// 부트스트랩에서 모달 실행시 body에 padding-right을 추가하는데, 해당 값을 초기화함.
		// (스크롤바가 없어지면서 화면이 옆으로 움직이는것 때문에 부트스트랩에서 자동으로 추가하게끔 되어있었음)
		$('#myModal').on('hidden.bs.modal', function () {
		  $('body').css('padding-right', ''); // Reset the padding on modal close
		});
	</script>

</body>
</html>