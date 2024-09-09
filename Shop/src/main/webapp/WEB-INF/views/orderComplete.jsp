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
        <h3>주문 번호: ${ask.askNo}</h3>
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
<c:forEach var="item" items="${askDetails}">
    <tr>
        <td class="product-info">
            <img src="<c:url value='/resources/image/' /><c:out value='${item.itemCategory == 0 ? "computer.png" : "peripheral.png"}' />" alt="Product">
            <div>
                <h3>
                    <c:choose>
                        <c:when test="${item.itemCategory == 0}">
                            ${item.computers[0].computerTitle}
                        </c:when>
                        <c:otherwise>
                            ${item.peripherals[0].peripheralTitle}
                        </c:otherwise>
                    </c:choose>
                </h3>
                <c:if test="${item.itemCategory == 0}">
                    <p>옵션: SSD ${item.ssdName} ${item.optSsd}GB, 
                       HDD ${item.hddName} ${item.optHdd}GB, 
                       OS ${item.optOs == 0 ? '미포함' : item.osName}</p>
                </c:if>
            </div>
        </td>
        <td>
            <div class="quantity-control">
                <p>${item.itemCount}</p>
            </div>
        </td>
        <td class="price" style="text-align: center">
            <strong>
                <c:choose>
                    <c:when test="${item.itemCategory == 0}">
                        <fmt:formatNumber value="${item.computers[0].computerSalePrice + 
                                                   (empty item.ssdPrice ? 0 : item.ssdPrice) + 
                                                   (empty item.hddPrice ? 0 : item.hddPrice) + 
                                                   (empty item.osPrice ? 0 : item.osPrice)}" 
                                          type="number" pattern="#,###"/>원
                    </c:when>
                    <c:otherwise>
                        <fmt:formatNumber value="${item.peripherals[0].peripheralSalePrice}" 
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
        // 상품 데이터 배열 생성
        var items = [
            <c:forEach var="item" items="${askDetails}" varStatus="status">
                {
                    itemCategory: ${item.itemCategory},
                    itemCount: ${item.itemCount},
                    <c:choose>
                        <c:when test="${item.itemCategory == 0}">
                            computerSalePrice: ${item.computers[0].computerSalePrice},
                            ssdPrice: ${item.ssdPrice},
                            hddPrice: ${item.hddPrice},
                            osPrice: ${item.osPrice}
                        </c:when>
                        <c:otherwise>
                            peripheralSalePrice: ${item.peripherals[0].peripheralSalePrice}
                        </c:otherwise>
                    </c:choose>
                }<c:if test="${!status.last}">,</c:if>
            </c:forEach>
        ];

        // 총 가격과 배송비 계산
        var totalPrice = 0;
        var deliveryFee = 3000;

        // 각 항목의 가격을 계산하여 totalPrice에 추가
        items.forEach(function(item) {
            var itemPrice = 0;
            if (item.itemCategory === 0) { // 컴퓨터 카테고리일 경우
                itemPrice = item.computerSalePrice + item.ssdPrice + item.hddPrice + item.osPrice;
            } else { // 주변기기 카테고리일 경우
                itemPrice = item.peripheralSalePrice;
            }

            totalPrice += itemPrice * item.itemCount; // 수량만큼 가격을 더함
        });

        // 50,000원 이상이면 배송비 무료 처리
        if (totalPrice >= 50000) {
            deliveryFee = 0;
        }

        // 총 결제 금액 계산
        var totalPayment = totalPrice + deliveryFee;

        // 페이지에 계산된 금액 출력
        $("#totalPrice").text(totalPrice.toLocaleString() + "원");
        $("#deliveryFee").text(deliveryFee.toLocaleString() + "원");
        $("#totalPayment").text(totalPayment.toLocaleString() + "원");
    });
</script>
</html>