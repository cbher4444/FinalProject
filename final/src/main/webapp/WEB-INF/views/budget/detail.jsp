<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <style>
            table {
                width: 80%;
                height: 100%;
                margin: 5% 10%;
                font-size: 16px;
            }

            .head {
                width: 130px;
                height: 50px;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <c:if test="${ !empty bd }">
            
            <table>
                <tr>
                    <td class="head">일시</td>
                    <td>${ bd.budgetDate }</td>
                </tr>
                <tr>
                    <td class="head">적요</td>
                    <td>${ bd.budgetBriefs }</td>
                </tr>
                <tr>
                    <td class="head">금액</td>
                    <td>${ bd.budgetHowMuch }${ bd.budgetCurrency }</td>	
                </tr>
                <c:if test="${ bd.budgetInout eq 'O' }">
                    <tr>
                        <td class="head">입/출금</td>
                        <td>출금</td>
                    </tr>
                    <tr>
                        <td class="head">결제수단</td>
                        <c:choose>
                            <c:when test="${ bd.budgetMethod eq 'C' }">
                                <td>현금</td>
                            </c:when>
                            <c:when test="${ bd.budgetMethod eq 'K' }">
                                <td>카드</td>
                            </c:when>
                            <c:otherwise>
                                <td>계좌 이체</td>
                            </c:otherwise>
                        </c:choose>
                    </tr>
                    <tr>
                        <td class="head">카테고리</td>
                        <c:choose>
                            <c:when test="${ bd.budgetCate eq 1 }">
                                <td>외식</td>
                            </c:when>
                            <c:otherwise>
                                <td>데이트</td>
                            </c:otherwise>
                        </c:choose>
                    </tr>
                </c:if>
                <tr>
                    <td class="head">메모</td>
                    <c:choose>
                        <c:when test="${ !empty bd.budgetComm }">
                            <td>${ bd.budgetComm }</td>
                        </c:when>
                        <c:otherwise>
                            <td></td>
                        </c:otherwise>
                    </c:choose>
                </tr>
            </table>
        </c:if>

        <div style="display: none;">
            <jsp:include page="../common/menubar.jsp"/>
        </div>
    </body>
</html>