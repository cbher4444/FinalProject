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

	.material-icons{
		position:relative;
		color:#F69D9D;

	}
	
	.material-icons:hover{
		cursor:pointer;
	}
	
	#back{
		display:none;
	}
	
	#addMedia{
		display:none;
	}
	</style>
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
					<h2 class="album_title">Couple Album</h2>
					<input type="hidden" class="albumId" value="">
				</div>
				<form id="addMedia" action="add-photo-to-album" method="post" enctype="multipart/form-data">
				    <input type="hidden" name="albumId" placeholder="앨범 ID" required>
				    <input type="file" name="file" required>
				    <button type="submit">사진 추가</button>
				</form>
			</div>
				<ul class="row" align="center" style="display:flex; list-style: none; flex-wrap: wrap; justify-content: start; padding-left:133px">
					<c:choose>
						<c:when test="${ not empty albums }">
							<c:forEach var="item" items="${ albums }">
								<li class="gallery animate-box album">
									<div class="album_img"><img src="${item.coverPhotoBaseUrl}" class="img-responsive" alt="Free HTML5 Bootstrap Template by FreeHTML5.co"></div>
				                   	<p class="title" style="margin:0;">${item.title}</p>
				                   	<p class="mediaItemsCount" style="margin:0;">사진 수 : ${item.mediaItemsCount}</p>
		                   			<input class="albumId" type="hidden" value="${ item.id }" />
								</li>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<h3 align="center" style="padding:50px;margin-left:338px;">앨범이 없습니다.</h3>
						</c:otherwise>
					</c:choose>
				</ul>
				<a href="authorize" class="btn btn-primary btn-lg" id="btn" style="position:relative;top:45%;left:38%;">앨범 가져오기</a>
				<a href="create" class="btn btn-primary btn-lg" id="create" style="position:relative;top:45%;left:38%;">앨범 생성하기</a>
				<a href="albums" class="btn btn-primary btn-lg" id="back" style="position:relative;top:45%;left:45%;">뒤로가기</a>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
    	console.log(${albums})
    	$(function(){
    		$(".album").click(function(){
    			var data = {'albumId':$(this).children().eq(3).val()};
    			var accessToken = '${accessToken}';
    			var title = $(this).children().eq(1).text();
    			var id = $(this).children().eq(3).val();
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
    					$(".album_title+.albumId").val(id);
    					var value = "";
    					for(var i = 0; i<result.mediaItems.length;i++){
    						var item = result.mediaItems[i];
    						
    						value += "<li>"
    								+ "<div class='material-icons' id='delete'>delete</div>"
	    							+ "<a href='"+ item.baseUrl +"' target='blank'><div class='album_img'><img src='"+ item.baseUrl +"' class='img-responsive' alt='Free HTML5 Bootstrap Template by FreeHTML5.co'/></div></a>"
    								+ "<input type='hidden' value='"+ item.id +"'>"
	    							+ "</li>";
    					}
    					$("ul.row").html(value);
    					$("#btn").hide();
    					$("#create").hide();
    					$("#back").show();
    					$("#addMedia").show();
    					$("input[name=albumId]").val(id);
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
    	
    	$(document).on("click","#delete",function(){
    		if(confirm("해당 사진을 앨범에서 삭제하시겠습니까?")){
    			$.ajax({
    				url:"deleteMediaItem",
    				data:{
    					albumId : $(".album_title+.albumId").val(),
    					mediaItemId : $(this).siblings("input").val(),
    				},success:function(){
    					alert("삭제가 완료되었습니다.");
    					location.href = "albums";
    				}
    				
    			})
    			
	    		
    		}
    	})
    	
    	
    	
    </script>

</body>
</html>