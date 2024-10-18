<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UsTwo</title>
<style>
	ul.row{
		padding: 0; 
		
	}
	ul.row li{
		margin: 3px;
	}
	ul.row li a{
		margin-bottom: 0;
	}

	ul.row li img{
		width: 300px;
		height: 350px;
		transition: .6s;
	}
	
	ul.row li{
		overflow: hidden;
	}
	
	ul.row li img:hover{
		transform: scale(1.1);
		transition: all .3s;
		
	}
	
	.album_img{
		overflow:hidden;
	}
		/* The Modal (background) */
	.modal {
	  display: none; /* Hidden by default */
	  position: fixed; /* Stay in place */
	  z-index: 1; /* Sit on top */
	  left: 0;
	  top: 0;
	  width: 100%; /* Full width */
	  height: 100%; /* Full height */
	  overflow: auto; /* Enable scroll if needed */
	  background-color: rgb(0,0,0); /* Fallback color */
	  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
	}
	
	/* Modal Content/Box */
	.modal-content {
	  background-color: #fefefe;
	  margin: 100px auto; /* 15% from the top and centered */
	  padding: 20px;
	  border: 1px solid #888;
	  width: 1200px; /* Could be more or less, depending on screen size */
	  height:800px;
	}
	
	.modal-content img{
		width:100%;
		height:750px;
		line-height: 750px;
	}
	

	
	.wrap{
		display:flex;
	}
	/* 사진 */
	.photo{
		width:55%;
		height:auto;
	}
	
	/* 사진 정보 */
	.replys .boardInfo{
		position:inherit;
		right:-27px;	
	}
	
	.replys .boardInfo::after{
		content:"";
		width:106%;
		height:1px;
		display:block;
		background:#eee;
		
	}
	
	/* 댓글 */
	
	.reply-wrap{
		height:600px;
	}
	
	/*
	.reply-wrap::after{
		content:"";
		width:100%;
		height:1px;
		display:block;
		background:#eee;
	}
	*/
	
	.replys{
		width:42%;
		position:relative;
	}
	
	.replys table th{
		text-align:center;
	}
	
	.replys table th img{
		width:32px;
		height:32px;
		border-radius:50px;
	}
	
	.material-icons{
		position:relative;
		color:#F69D9D;
	}
	
	.gallery.animate-box .img-responsive .title{
		 background: rgba(0,0,0,0.5);
	    position: absolute;
	    border-radius: 5px;
	    margin: auto;
	    width: 140px;
	    height: 130px;
	    color: #fff;
	    padding: 20px;
	    box-sizing: border-box;
	    opacity: 0;
	    transition: 0.5s;
	}
	
	.insertReply{
		position:absolute;
		right:33px;
		bottom:22px;
	}
	
	.insertReply input{
		width:400px;
		padding:10px;
		font-size:18px;
		outline:none;
	}
	
	.foot{
		width:100%;
		height:90px;
		position:inherit;
		right:-17px;
	}
	
	.foot::before{
		content:"";
		display:block;
		width:106%;
		height:1px;
		background:#eee;
	}
	
	/* The Close Button */
	.close {
	  color: #aaa;
	  float: right;
	  font-size: 28px;
	  font-weight: bold;
	}
	
	.close:hover,
	.close:focus {
	  color: black;
	  text-decoration: none;
	  cursor: pointer;
	}
	
	#back{
		display:none;
	}
	
	#addMedia{
		display:none;
	}
	
	#create-form{
		text-align:center;
	}
	
	#create-form input[type=file]{
		margin-left:434px;
	}
	</style>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="../common/menubar.jsp"/>
	<script>
		// 메뉴바에 클릭된 메뉴 하이라이트
		$(()=>{ $(".nav-header #menubar_story").addClass("active"); })
		$(()=>{ $(".nav-header #menubar_album").addClass("active"); })
	</script>

	<!-- 내용 -->
	<div id="fh5co-gallery">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
					<h2 class="album_title">스토리 만들기</h2>
				</div>
			</div>
			    <form id="create-form" action="insertStory" method="post" enctype="multipart/form-data">
			        <label for="title">스토리 제목:</label>
			        <input type="text" id="title" name="title" required >
			        <img id="contentImg" style="width:400px;height:400px;border:1px solid #eee; margin:auto;display:block;" onclick="chooseFile()">
			        <input type="file" id="file" name="file" onchange="loadImg(this)" required style="display:none;">
			        <br>
			        <input type="submit" value="스토리 생성">
			    </form>
		</div>
	</div>
	
	 <script>
         function chooseFile(){
             $("#file").click();	
         }
         
         
         function loadImg(inputFile){
             // inputFile : 현재 변화가 생긴 input type="file" 요소객체
             // num : 몇번째 input 요소인지 확인 후 해당 영역에 미리보기 하기 위해 전달받는 숫자

             // 선택된 파일이 있다면 inputFile.files[0]에 선택된 파일이 담겨있음
             //                  => inputFile.files.length 또한 1이 될 것임
             if(inputFile.files.length == 1){ // 파일 선택된 경우 => 파일을 읽어들여서 미리보기
                 
                 // 파일을 읽어들일 FileReader 객체 생성
                 const reader = new FileReader();

                 // 파일을 읽어들이는 메소드
                 reader.readAsDataURL(inputFile.files[0]);
                 // 해당 파일을 읽어들이는 순간 해당 이 파일만을 고유한 url 부여

                 // 파일 읽어들이기가 완료됐을 때 실행할 함수를 정의해두기
                 reader.onload = function(e){
                     // e.target.result => 읽어들인 파일의 고유한 url
                     $("#contentImg").attr("src", e.target.result);
             }
         }
     }
                </script>
	
	
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>