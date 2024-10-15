<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	</style>
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
					<h2 class="album_title">Couple Album</h2>
				</div>
				<form id="addMedia" action="add-photo-to-album" method="post" enctype="multipart/form-data">
				    <input type="hidden" name="albumId" placeholder="앨범 ID" required>
				    <input type="file" name="file" required>
				    <button type="submit">사진 추가</button>
				</form>
			</div>
				<ul class="row" align="center" style="display:flex; list-style: none; flex-wrap: wrap; justify-content: start; padding-left:133px">
					<c:if test="${ not empty albums }">
						<c:forEach var="item" items="${ albums }">
							<li class="gallery animate-box album">
								<div class="album_img"><img src="${item.coverPhotoBaseUrl}" class="img-responsive" alt="Free HTML5 Bootstrap Template by FreeHTML5.co"></div>
			                   	<p class="title">${item.title}</p>
	                   			<input class="albumId" type="hidden" value="${ item.id }" />
							</li>
						</c:forEach>
					</c:if>
				</ul>
				<a href="authorize" class="btn btn-primary btn-lg" id="btn" style="position:relative;top:45%;left:45%;">앨범 가져오기</a>
				<a href="albums" class="btn btn-primary btn-lg" id="back" style="position:relative;top:45%;left:45%;">뒤로가기</a>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
    	
    	$(function(){
    		$(".album").click(function(){
    			var data = {'albumId':$(this).children().eq(2).val()};
    			var accessToken = '${accessToken}';
    			var title = $(this).children().eq(1).text();
    			var id = $(this).children().eq(2).val();
    			$.ajax({
    				type:"post",
    				url:"https://photoslibrary.googleapis.com/v1/mediaItems:search",
    				headers : {
    					'Authorization' : "Bearer " + accessToken,
    					},
    				data: data,
    				dataType : 'JSON',
    				success:function(result){
    					$(".album_title").text(title);
    					var value = "";
    					for(var i = 0; i<result.mediaItems.length;i++){
    						var item = result.mediaItems[i];
    						
    						value += "<li>"
	    							+ "<a href='"+ item.baseUrl +"' target='blank'><img src='"+ item.baseUrl +"' class='img-responsive' alt='Free HTML5 Bootstrap Template by FreeHTML5.co'/></a>"
    								+ "</li>";
    					}
    					$("ul.row").html(value);
    					$("#btn").hide();
    					$("#back").show();
    					$("#addMedia").show();
    					$("input[name=albumId]").val(id);
    					console.log(data);
    				},error:function(xhr, status, error){
    					console.log("Error:", error);
    	                console.log("Status:", status);
    	                console.log("Response:", xhr.responseText);
    	                console.log("Album ID:", data.albumId);
    	                console.log("Data sent:", data);
    				}
    			})
    			
    		})
    	})
    	
    </script>

</body>
</html>