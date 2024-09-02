<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문 완료</title>
    <link href="<c:url value='/resources/css/ordercomplete.css' />" rel="stylesheet">
	<script type="text/javascript">
        var useremail = "${sessionScope.user.email}";
        var username = "${sessionScope.user.name}";
        var userEmail = useremail;
    </script>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
    <%@ include file="./includes/myheader.jsp" %>
    <div class="order-complete-page">
        <h1>주문 완료</h1>
        <div class="cart-header">
            <div class="cart-step">
                <i class="icon-bag"></i>
                <span>장바구니</span>
            </div>
            <div class="cart-step">
                <i class="icon-card"></i>
                <span>주문/결제</span>
            </div>
            <div class="cart-step active">
                <i class="icon-check"></i>
                <span>주문완료</span>
            </div>
        </div>
        <p>고객님의 주문이 성공적으로 완료되었습니다.</p>
        <p>주문 번호: <strong>${requestScope.orderNumber}</strong></p>
        
        <h2>주문 정보</h2>
        <table class="order-summary">
            <thead>
                <tr>
                    <th>상품명</th>
                    <th>수량</th>
                    <th>가격</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${cartItems}">
                    <tr>
                        <td>${item.itemCategory == 0 ? '컴퓨터' : '주변기기'}</td>
                        <td>${item.itemCount}</td>
                        <td>${item.computers[0].computerSalePrice}원</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div class="total-amount">
            <p>총 결제 금액: ${requestScope.totalAmount} 원 + 배송비 : ${requestScope.shippingCost} 원 = 합계 :  <strong>${requestScope.totalAmountWithShipping}원</strong></p>
        </div>
        <div style="display: flex; justify-content: center;">
            <a href="<c:url value='/shop' />" class="back-to-shop">쇼핑 계속하기</a>
        </div>
    </div>
</body>
</html>
