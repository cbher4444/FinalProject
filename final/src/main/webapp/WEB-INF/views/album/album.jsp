<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/dist/scripts.js"></script>
</head>
<body>

	<h1>My Albums</h1>
    
    <c:if test="${not empty albums}">
        <ul>
            <c:forEach var="item" items="${albums}">
                <li class="album">
                   	<img src="${item.coverPhotoBaseUrl}" alt="Media Item" />
                   	<p>${item.title}</p>
                   	<input type="hidden" value="${ item.id }" />
                </li>
            </c:forEach>
        </ul>
    </c:if>
    
    
    <c:if test="${ empty albums }">
    	<h1>앨범이 없습니다.</h1>
    </c:if>
    <a href="authorize">Google로 로그인</a>
    <a href="${pageContext.request.contextPath}/albums">앨범 가져오기</a>
    
    <script>
    	console.log(${albums})
    	
    	$(function(){
    		$(".album").click(function(){
    			var data = {'albumId':$(this).children().eq(2).val()};
    			$.ajax({
    				type:"post",
    				url:"https://photoslibrary.googleapis.com/v1/mediaItems:search",
    				headers : {
    					'Authorization' : "Bearer ya29.a0AcM612wsX5d39p4z3lvC9qocybS8fp5-jmUhDadP8Dk-4vwCZ5W8cN66zsAtU3pm_Dsu9U-FB2JSHu1lpMoEOFveY9UxcMRQfE_CfMtKKrq_Y0L1yNFjtQqsZXL5T2UxQMiZM5JPcK2CMNeQGqeXgKXBroBgJJC1VigaCgYKAZoSARMSFQHGX2MiqHxxy0WHZC5Hq8BT0ReNoA0170",
    					},
    				data: JSON.stringify(data),
    				dataType : 'JSON',
    				success:function(result){
    					console.log(result);
    				},error:function(){
		    			console.log($(this).children().eq(2).val());
    					console.log("ajax 실패");
    					console.log(data);
    				}
    			})
    			
    		})
    	})

    	
    </script>

</body>
</html>