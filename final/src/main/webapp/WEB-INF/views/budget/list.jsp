<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<style>
		body {
			background-color: #F6FAF7 !important;
		}

		tr {
			border-bottom: 1px solid #00000030;
			height: 45px;
		}

		tr, th {
			text-align: center !important;
		}

		input, progress {
			accent-color: #F69D9D;
		}

		input:focus {
			outline: none;
		}

		p {
			margin-bottom: 0 !important;
		}

		* {
			box-sizing: border-box;
		}

		#made-listBtns {
			display: flex;
			justify-content: start;
			margin: 10px 0 25px 0;
			position: relative;
		}

		#made-listBtns > div:not(:last-child) {
			margin-right: 10px;
		}

		.hight {
			height: 24px;
		}

		#made-search {
			position: absolute;
			top: 0;
			right: 24px;
			border: none;
			border-bottom: 1px solid #00000030;
			background-color: #F6FAF7;
		}

		#made-searchIcon {
			position: absolute;
			top: 0;
			right: 0;
			cursor: pointer;
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
			text-align: center;
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

		.btnDiv a:focus {
			color: #F69D9D !important;
			text-decoration: none;
		}

		.btnDiv a:not(.currentPage) {
			color: #00000080;
		}
	</style>
</head>
<body>
	<div id="made-listBtns">
		<div id="made-selectMethod">
			<select name="methodCategory" id="made-methodCategory" class="hight">
				<option value="1">전체 조회</option>
				<option value="2">토스뱅크</option>
				<option value="3">국민은행</option>
				<option value="4">삼성카드</option>
			</select>
		</div>
		<div id="made-selectCategory">
			<select name="searchCategory" id="made-searchCategory" class="hight">
				<option value="1">입·출금 내역 조회</option>
				<option value="2">입금 내역 조회</option>
				<option value="3">출금 내역 조회</option>
			</select>
		</div>
		<div id="made-howLong">
			<input type="date" id="made-firstDate" name="firstDate" class="hight">&nbsp; ~ &nbsp;<input type="date" id="made-secondDate" name="secondDate" class="hight">
		</div>
		<div id="made-searchBar" class="hight">
			<input type="text" id="made-search" name="keyword" class="hight">
			<div id="made-searchIcon" class="material-symbols-outlined">search</div>
		</div>
	</div>
	
	<!-- 그 아래 어떤 통장(은행(계좌번호))에 변화가 생겼는지, 날짜, 입금?출금?, 상세 설명, 금액, 총액 -->
	<table style="width: 100%;">
		<thead>
			<tr>	
				<th>일시</th>
				<th>적요</th>
				<th>입금액</th>
				<th>출금액</th>
				<th>잔액</th>
			</tr>
		</thead>

		<tbody>									
			<c:forEach var="b" items="${ list }">
				<c:choose>
					<c:when test="${ b.budgetInout eq 'I'}">
						<tr>
							<td>${ b.budgetDate }</td>
							<td>${ b.budgetBriefs }</td>
							<td>${ b.budgetHowMuch }${ b.budgetCurrency }</td>
							<td></td>
							<td>${ b.budgetBalance }${ b.budgetCurrency }</td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<td>${ b.budgetDate }</td>
							<td>${ b.budgetBriefs }</td>
							<td></td>
							<td>${ b.budgetHowMuch }${ b.budgetCurrency }</td>
							<td>${ b.budgetBalance }${ b.budgetCurrency }</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</tbody>
	</table>
	
	<div id="pageBar">
		<c:choose>
			<c:when test="${ pi.currentPage eq 1 }">
				<div class="btnDiv"></div>
			</c:when>
			<c:otherwise>
				<div class="btnDiv"><a id="cpage${ pi.currentPage - 1 }btn" class="page-link material-symbols-outlined" href="javascript:void(0)">arrow_back_ios</a></div>
			</c:otherwise>
		</c:choose>
		
		<c:forEach var="p" begin="${ pi.startPage }" end ="${ pi.endPage }">
			<div class="btnDiv"><a id="cpage${ p }" class="page-link" href="javascript:void(0)">${ p }</a></div>
		</c:forEach>
		
		<c:choose>
			<c:when test="${ pi.currentPage eq pi.maxPage }">
				<div class="btnDiv"></div>
			</c:when>
			<c:otherwise>
				<div class="btnDiv"><a id="cpage${ pi.currentPage + 1 }btn" class="page-link material-symbols-outlined" href="javascript:void(0)">arrow_forward_ios</a></div>
			</c:otherwise>
		</c:choose>
	</div>

	<script>
		$(() => {
			$('a[id^=cpage]').removeClass("currentPage");
			$('#cpage' + Number('${ pi.currentPage }')).addClass('currentPage');

			window.addEventListener('load', function() {
				let message = {height: document.body.scrollHeight};	
				window.top.postMessage(message, "*");
			});

			$(document).on('click', 'a[id^=cpage]', function(event) {
				let $id = $(event.target).attr('id');
				let cpage = $id.substring($id.indexOf('e') + 1).replace('btn', '').trim();
				$(event.target).attr('href', 'goList?cpage=' + cpage + '&coupleCode=${ loginUser.coupleCode }');
			});
		})
	</script>

	<div style="display: none;">
		<jsp:include page="../common/menubar.jsp"/>
	</div>
</body>
</html>