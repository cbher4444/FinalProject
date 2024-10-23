<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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

		td {
			cursor: pointer;
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

		#cover {
			background-color: #00000080;
			width: 100%;
			height: 100%;
			position: fixed;
			top: 0;
		}

		#content {
			background-color: white;
			width: 500px;
			height: 400px;
			position: fixed;
			top: 0;
			bottom: 0;
			left: 0;
			right: 0;
			margin: auto;
			border-radius: 20px;
			display: flex;
			flex-direction: column;
		}
		
		#cancleAdd {
			margin: 20px;
			text-align: right;
		}
	</style>
</head>
<body>
	<div id="made-listBtns">
		<div id="made-selectMethod">
			<select name="methodCategory" id="made-methodCategory" class="hight">
				<option value="1">전체 통화 조회</option>
				<option value="₩">₩</option>
				<option value="$">$</option>
				<option value="€">€</option>
				<option value="￥(JPY)">￥(JPY)</option>
				<option value="¥(CNY)">¥(CNY)</option>
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
						<tr><td>${ b.budgetDate }</td><td>${ b.budgetBriefs }</td><td><fmt:formatNumber value="${b.budgetHowMuch}" type="number" groupingUsed="true" />${ b.budgetCurrency }</td><td></td><td><fmt:formatNumber value="${ b.budgetBalance }" type="number" groupingUsed="true" />${ b.budgetCurrency }</td></tr>
					</c:when>
					<c:otherwise>
						<tr><td>${ b.budgetDate }</td><td>${ b.budgetBriefs }</td><td></td><td><fmt:formatNumber value="${b.budgetHowMuch}" type="number" groupingUsed="true" />${ b.budgetCurrency }</td><td><fmt:formatNumber value="${ b.budgetBalance }" type="number" groupingUsed="true" />${ b.budgetCurrency }</td></tr>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<c:if test="${ empty list }">
				<tr>
					<td colspan="5">
						결과가 존재하지 않습니다.
					</td>
				</tr>
			</c:if>
		</tbody>
	</table>
	
	<c:if test="${ !empty list }">
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
	</c:if>

	<div id="cover"></div>
	<div id="content">
		<div id="cancleAdd" class="material-symbols-outlined">close</div>
		<div id="realContent"></div>
	</div>

	<script>
		$(() => {
			let budgetCurrency='${ bd.budgetCurrency }';
			let budgetInout='${ bd.budgetInout }';
			let startDate='${ bd.startDate }';
			let endDate='${ bd.endDate }';
			let keyword='${ bd.keyword }'.replace('%%', '');

			if (budgetCurrency !== '') {
				$('#made-methodCategory').val(budgetCurrency);
			}

			if (budgetInout === 'I') {
				$('#made-searchCategory').val('2');
			} else if (budgetInout === 'O') {
				$('#made-searchCategory').val('3');
			}

			if (startDate !== '') {
				$('#made-firstDate').val(startDate);
			}

			if (endDate !== '') {
				$('#made-secondDate').val(endDate);
			}

			$('a[id^=cpage]').removeClass("currentPage");
			$('#cpage' + Number('${ pi.currentPage }')).addClass('currentPage');

			window.addEventListener('load', function() {
				let message = {height: document.body.scrollHeight};	
				window.top.postMessage(message, "*");
			});

			$(document).on('click', 'a[id^=cpage]', function(event) {
				let $id = $(event.target).attr('id');
				let cpage = $id.substring($id.indexOf('e') + 1).replace('btn', '').trim();
				let url = 'goList?cpage=' + cpage;
				    url += '&coupleCode=${ loginUser.coupleCode }';
					url += '&budgetCurrency=' + budgetCurrency;
					url += '&budgetInout=' + budgetInout;
					url += '&startDate=' + startDate;
					url += '&endDate=' + endDate;
					url += '&keyword=' + keyword;
					console.log(url)
				$(event.target).attr('href', url);
			});

			$('#made-searchIcon').on('click', function() {
				if ($('#made-methodCategory').val() === '1') {
					budgetCurrency = '';
				} else {
					budgetCurrency = $('#made-methodCategory').val();
				}

				switch ($('#made-searchCategory').val()) {
					case '1': budgetInout = ''; break; 
					case '2': budgetInout = 'I'; break; // 입금
					case '3': budgetInout = 'O'; break; // 출금
				}
				
				startDate = $('#made-firstDate').val();
				endDate = $('#made-secondDate').val();

				if (new Date(startDate) > new Date(endDate)) {
					let dateSave = startDate;
					startDate = endDate;
					endDate = dateSave;
				}

				keyword = $('#made-search').val();

				let url = 'goList?cpage=1&coupleCode=${ loginUser.coupleCode }';
					url += '&budgetCurrency=' + budgetCurrency;
					url += '&budgetInout=' + budgetInout;
					url += '&startDate=' + startDate;
					url += '&endDate=' + endDate;
					url += '&keyword=' + keyword;

					console.log(url);

				window.location.href = url;
			});

			$('td').on('click', function(event) {
				openAdd();
				let arr = $(event.target).parent().html().split('</td>');
				for (let i in arr) {
					arr[i] = arr[i].replace('<td>', '')
				}

				let currency1 = '₩';
				let currency2 = '$';
				let currency3 = '€';
				let currency4 = '￥(JPY)';
				let currency5 = '¥(CNY)';

				let budgetDate = arr[0];
				let budgetBriefs = arr[1];
				let budgetInoutI = arr[2].replace(currency1, '').replace(currency2, '').replace(currency3, '').replace(currency4, '').replace(currency5, '');
				let budgetInoutO = arr[3].replace(currency1, '').replace(currency2, '').replace(currency3, '').replace(currency4, '').replace(currency5, '');
				let budgetBalance = arr[4];
				let budgetCurrency;

				console.log(budgetDate);
				console.log(budgetBriefs);
				console.log(budgetInoutI);
				console.log(budgetInoutO);
				console.log(budgetBalance);

				for (let i = 1; i <= 5; i++) {
					console.log(arr[2].indexOf('currency' + i))
					if (arr[2].indexOf(currency1) !== -1) {
						budgetCurrency = arr[1].substring(0, arr[2].indexOf(currency1));
					}
				}
			});

			$('#cancleAdd').on('click', function() {
				closeAdd();
			});

			$('#cover').on('click', function() {
				closeAdd();
			})

			function closeAdd() {
				$('#content').css('display', 'none');
				$('#cover').css('display', 'none');
			}

			function openAdd() {
				$('#content').css('display', '');
				$('#cover').css('display', '');
			}

			closeAdd();
		})
	</script>

	<div style="display: none;">
		<jsp:include page="../common/menubar.jsp"/>
	</div>
</body>
</html>