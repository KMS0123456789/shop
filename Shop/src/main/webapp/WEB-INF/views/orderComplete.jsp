<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <h3>주문 번호: ${askDetails[0].askNo}</h3>
        <h2>주문 정보</h2>
        <table class="order-summary">
            <thead>
                <tr>
                    <th>주문 상품정보</th>
                    <th>수량</th>
                    <th>가격</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="askDetail" items="${askDetails}" varStatus="status">
                    <tr>
                        <td class="product-info">
                            <!-- 상품 이미지 -->
                            <img src="<c:url value='${askDetail.filePath}' />" alt="Product" class="product">
                            <div>
                                <h3>
                                    <c:choose>
                                        <c:when test="${not empty askDetail.computerTitle}">
                                            ${askDetail.computerTitle}
                                        </c:when>
                                        <c:otherwise>
                                            ${askDetail.peripheralTitle}
                                        </c:otherwise>
                                    </c:choose>
                                </h3>
                                <!-- 옵션 정보 출력 -->
                                <c:if test="${not empty askDetail.computerTitle}">
                                    <p style = "text-align: left;">옵션:<br>
                                       SSD : ${not empty askDetail.ssdName ? askDetail.ssdName : '-'},<br> 
                                       HDD : ${not empty askDetail.hddName ? askDetail.hddName : '-'},<br>
                                       OS : ${not empty askDetail.osName ? askDetail.osName : '-'}
                                    </p>
                                </c:if>
                            </div>
                        </td>
                        <td>
                            <div class="quantity-control">
                                <p>1</p>
                            </div>
                        </td>
                        <td class="price" style="text-align: center">
                            <strong>
                                <c:choose>
                                    <c:when test="${not empty askDetail.computerTitle}">
                                        <fmt:formatNumber value="${askDetail.computerSalePrice + 
                                                                   (empty askDetail.ssdPrice ? 0 : askDetail.ssdPrice) + 
                                                                   (empty askDetail.hddPrice ? 0 : askDetail.hddPrice) + 
                                                                   (empty askDetail.osPrice ? 0 : askDetail.osPrice)}" 
                                                          type="number" pattern="#,###"/>원
                                    </c:when>
                                    <c:otherwise>
                                        <fmt:formatNumber value="${askDetail.peripheralSalePrice}" 
                                                          type="number" pattern="#,###"/>원
                                    </c:otherwise>
                                </c:choose>
                            </strong>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <p>총 결제 금액: 
            <span id="totalPrice">0원</span>
            + 배송비 : <span id="deliveryFee">0원</span> = 합계 : 
            <strong><span id="totalPayment">0원</span></strong>
        </p>
        <div style="display: flex; justify-content: center;">
            <a href="<c:url value='/'/>" class="back-to-shop">쇼핑 계속하기</a>
        </div>
    </div>
</body>
<script type="text/javascript">
    $(document).ready(function() {
        var items = [
            <c:forEach var="askDetail" items="${askDetails}" varStatus="status">
                {
                    itemCategory: ${not empty askDetail.computerTitle ? 1 : 2},
                    computerSalePrice: ${not empty askDetail.computerSalePrice ? askDetail.computerSalePrice : 0},
                    peripheralSalePrice: ${not empty askDetail.peripheralSalePrice ? askDetail.peripheralSalePrice : 0},
                    ssdPrice: ${not empty askDetail.ssdPrice ? askDetail.ssdPrice : 0},
                    hddPrice: ${not empty askDetail.hddPrice ? askDetail.hddPrice : 0},
                    osPrice: ${not empty askDetail.osPrice ? askDetail.osPrice : 0}
                }<c:if test="${!status.last}">,</c:if>
            </c:forEach>
        ];

        var totalPrice = 0;
        var deliveryFee = 3000;

        items.forEach(function(item) {
            var itemPrice = 0;
            if (item.itemCategory === 1) {
                itemPrice = item.computerSalePrice + item.ssdPrice + item.hddPrice + item.osPrice;
            } else {
                itemPrice = item.peripheralSalePrice;
            }
            totalPrice += itemPrice;
        });

        if (totalPrice >= 50000) {
            deliveryFee = 0;
        }

        var totalPayment = totalPrice + deliveryFee;

        $("#totalPrice").text(totalPrice.toLocaleString() + "원");
        $("#deliveryFee").text(deliveryFee.toLocaleString() + "원");
        $("#totalPayment").text(totalPayment.toLocaleString() + "원");
    });
</script>
</html>