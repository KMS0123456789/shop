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

        <!-- 주문 진행 단계 표시 -->
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
        <p>주문 번호: <strong>${detail.askNo}</strong></p>

        <!-- 주문 정보 표시 -->
        <h2>주문 정보</h2>
        <table class="order-summary">
            <thead>
                <tr>
                	<th>상품 이미지</th>
                    <th>상품명</th>
                    <th>수량</th>
                    <th>가격</th>
                </tr>
            </thead>
            <tbody>
				<tr>
				    <!-- 상품명을 itemCategory를 기준으로 구분 -->
				    <td><img src="<c:url value='${detail.filePath}'/>" style="width: 100px"></td>
				    <td>
				    	${detail.computerTitle}
				    	<p>옵션: SSD ${detail.ssdName != null ? detail.ssdName : '미포함'}, HDD ${detail.hddName != null ? detail.hddName : '미포함'}, OS ${detail.osName != null ? detail.osName : '미포함'}</p>
				    </td>
				    <td>1</td>
				    <td><fmt:formatNumber value="${detail.computerSalePrice + detail.ssdPrice + detail.hddPrice + detail.osPrice }" type="number" pattern="#,###"/>원</td>
				</tr>
            </tbody>
        </table>

        <!-- 총 결제 금액 및 배송비 표시 -->
        <div class="total-amount">
        	<c:choose>
        		<c:when test="${detail.computerSalePrice + detail.ssdPrice + detail.hddPrice + detail.osPrice < 50000}">
        			 <p>총 결제 금액:<fmt:formatNumber value="${detail.computerSalePrice + detail.ssdPrice + detail.hddPrice + detail.osPrice}" type="number" pattern="#,###"/>원 + 배송비 : 3,000원  = 합계 : <strong><fmt:formatNumber value="${detail.computerSalePrice + detail.ssdPrice + detail.hddPrice + detail.osPrice + 3000}" type="number" pattern="#,###"/>원</strong></p>
        		</c:when>
        		<c:when test="${detail.computerSalePrice + detail.ssdPrice + detail.hddPrice + detail.osPrice > 50000}">
        			 <p>총 결제 금액:<fmt:formatNumber value="${detail.computerSalePrice + detail.ssdPrice + detail.hddPrice + detail.osPrice}" type="number" pattern="#,###"/>원 + 배송비 : 0원  = 합계 : <strong><fmt:formatNumber value="${detail.computerSalePrice + detail.ssdPrice + detail.hddPrice + detail.osPrice}" type="number" pattern="#,###"/>원</strong></p>
        		</c:when>
        	</c:choose>
        </div>

        <!-- 쇼핑 계속하기 버튼 -->
        <div style="display: flex; justify-content: center;">
            <a href="<c:url value='/' />" class="back-to-shop">쇼핑 계속하기</a>
        </div>
    </div>
</body>
</html>
