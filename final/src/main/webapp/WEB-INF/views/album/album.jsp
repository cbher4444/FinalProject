<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
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
		top:17px;
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
	</style>
	<script src="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="../common/menubar.jsp"/>
	<script>
		// 메뉴바에 클릭된 메뉴 하이라이트
		$(()=>{ $(".nav-header #menubar_album").addClass("active"); })
	</script>

	<!-- 내용 -->
	<div id="fh5co-gallery">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
					<h2>Couple Album</h2>
				</div>
			</div>
			<ul class="row" align="center" style="display:flex; list-style: none; flex-wrap: wrap; justify-content: start; padding-left:133px">
					<li class="gallery animate-box">
						<img id="myBtn" src="resources/images/gallery-1.jpg" class="img-responsive" alt="Free HTML5 Bootstrap Template by FreeHTML5.co">
					</li>
					<li class="gallery animate-box">
						<a class="gallery-img image-popup" href="resources/images/gallery-7.jpg"><img src="resources/images/gallery-7.jpg" class="img-responsive" alt="Free HTML5 Bootstrap Template by FreeHTML5.co"></a>
					</li>
					<li class="gallery animate-box">
						<a class="gallery-img image-popup" href="resources/images/gallery-6.jpg"><img src="resources/images/gallery-6.jpg" class="img-responsive" alt="Free HTML5 Bootstrap Template by FreeHTML5.co"></a>
					</li>
					<li class="gallery animate-box">
						<a class="gallery-img image-popup" href="resources/images/gallery-2.jpg"><img src="resources/images/gallery-2.jpg" class="img-responsive" alt="Free HTML5 Bootstrap Template by FreeHTML5.co"></a>
					</li>
					<li class="gallery animate-box">
						<a class="gallery-img image-popup" href="resources/images/gallery-5.jpg"><img src="resources/images/gallery-5.jpg" class="img-responsive" alt="Free HTML5 Bootstrap Template by FreeHTML5.co"></a>
					</li>
					<li class="gallery animate-box">
						<a class="gallery-img image-popup" href="resources/images/gallery-3.jpg"><img src="resources/images/gallery-3.jpg" class="img-responsive" alt="Free HTML5 Bootstrap Template by FreeHTML5.co"></a>
					</li>
					<li class="gallery animate-box">
						<a class="gallery-img image-popup" href="resources/images/gallery-4.jpg"><img src="resources/images/gallery-4.jpg" class="img-responsive" alt="Free HTML5 Bootstrap Template by FreeHTML5.co"></a>
					</li>
					<li class="gallery animate-box">
						<a class="gallery-img image-popup" href="resources/images/gallery-4.jpg"><img src="resources/images/gallery-4.jpg" class="img-responsive" alt="Free HTML5 Bootstrap Template by FreeHTML5.co"></a>
					</li>
					<li class="gallery animate-box">
						<a class="gallery-img image-popup" href="resources/images/gallery-4.jpg"><img src="resources/images/gallery-4.jpg" class="img-responsive" alt="Free HTML5 Bootstrap Template by FreeHTML5.co"></a>
					</li>
					<li class="gallery animate-box">
						<a class="gallery-img image-popup" href="resources/images/gallery-4.jpg"><img src="resources/images/gallery-4.jpg" class="img-responsive" alt="Free HTML5 Bootstrap Template by FreeHTML5.co"></a>
					</li>
					
			</ul>
		</div>
	</div>
	
	<!-- The Modal -->
	<div id="myModal" class="modal">

	  <!-- Modal content -->
	  <div class="modal-content">
	    <span class="close">&times;</span>
	    <div class="wrap">
	    	<div class="photo">
	    		<img align='center' id="myBtn" src="resources/images/gallery-1.jpg" class="img-responsive" alt="Free HTML5 Bootstrap Template by FreeHTML5.co">
	  		</div>
	  		<div class="replys" >
	  			<div class="boardInfo">
		  			<table align="center">
		  					<tr>
		  						<th width="50px"><img src="resources/images/gallery-2.jpg" /></th>
		  						<th rowspan="2" width="200px">우리는 언제 결혼할까?</th>
		  					</tr>
		  					<tr>
		  						<th width="100px">애신</th>
		  					</tr>
		  			</table>
	  			</div>
	  			<br>
	  			<div class="reply-wrap">
		  			<div class="reply">
		  				<div>
			  				<table>
			  					<tr>
			  						<th width="50px"><img src="resources/images/gallery-3.jpg" /></th>
			  						<th rowspan="2" width="370px" >내년에 할까?</th>
			  						<th><div class="material-icons">favorite</div></th>
			  					</tr>
			  					<tr>
			  						<th width="100px">유진 초이</th>
			  					</tr>
			  			</table>
		  				</div>
		  			</div>
		  			<div class="reply">
		  				<div>
			  				<table>
			  					<tr>
			  						<th width="50px"><img src="resources/images/gallery-3.jpg" /></th>
			  						<th rowspan="2" width="370px">내년에 할까?</th>
			  						<th><div class="material-icons">favorite</div></th>
			  					</tr>
			  					<tr>
			  						<th width="100px">유진초이</th>
			  					</tr>
			  			</table>
		  				</div>
		  			</div>
		  			<div class="reply">
		  				<div>
			  				<table>
			  					<tr>
			  						<th width="50px"><img src="resources/images/gallery-3.jpg" /></th>
			  						<th rowspan="2" width="370px">aaaaaaaaaaaaaaaaㅁㅁㅁㅁㅁㅁ</th>
			  						<th><div class="material-icons">favorite</div></th>
			  					</tr>
			  					<tr>
			  						<th width="100px">유진초이</th>
			  					</tr>
			  			</table>
		  				</div>
		  			</div>
	  			</div>
	  			<div class="foot">
	  				<div class="insertReply">
	  					<input>
		  			</div>
		  			<button type="submit" style="position:absolute;right:-42px;top:27px; background-color:#F69D9D;color:white;border:0;padding:5px;border-radius:5px;">댓글달기</button>
	  			</div>
	  		</div>
	  	</div>
	  </div>
		
	</div>
	
	<script>
	
	
	// Get the modal
	var modal = document.getElementById("myModal");

	// Get the button that opens the modal
	var btn = document.getElementById("myBtn");

	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];

	// When the user clicks on the button, open the modal
	btn.onclick = function() {
	  modal.style.display = "block";
	}

	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {
	  modal.style.display = "none";
	}

	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
	  if (event.target == modal) {
	    modal.style.display = "none";
	  }
	}
	
	
	
	</script>
	
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>