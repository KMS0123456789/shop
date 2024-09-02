<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<c:url value='/resources/css/table.css' />" rel="stylesheet">
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<%@ include file="./includes/myheader.jsp" %>
			<h2>주문 상품 목록</h2>
				<table>
					<thead>
						<tr>
							<th>주문 번호</th>
							<th>처리 상태</th>
							<th>주문 일자</th>
							<th>상품 이미지</th>
							<th>상품 명</th>
							<th>옵션 명</th>
							<th>판매가</th>
						</tr>
					</thead>
					<c:forEach items="${ask}" var="ask">
						<tbody>
							<tr>
								<td>${ask.askNo}</td>
								<c:choose>
									<c:when test="${ask.askStateFlag == 0 }">
										<td>결제완료</td>
									</c:when>
									<c:when test="${ask.askStateFlag ==  1}">
										<td>배송 준비중</td>
									</c:when>
									<c:when test="${ask.askStateFlag== 2 }">
										<td>배송완료</td>
									</c:when>
								</c:choose>								
	                           	<td>${ask.askDate}</td>
	                            <td><div class="mainImg">
											<img class="mainImg2" src="${file.computerFilePath}">
										</div></td>
	                            <td>${computer.computerTitle}</td>
	                            <td>${option.optionName}</td>
	                            <td class="price">
					                    <f:formatNumber value="${item.itemCategory == 0 ? item.computers[0].computerSalePrice : item.peripherals[0].peripheralSalePrice}" type="number" pattern="#,###"/>원
					                                <div class="cart-summary">
                <h3>결제금액</h3>
                <div class="summary-item">
                    <span>총 상품금액</span>
                    <span id="total-product-price">0원</span>

                </div>
	                            </td>                                                        
							</tr>
						</tbody>
					</c:forEach>
				</table>
				
				<div class="paging">
	           <f:parseNumber integerOnly="true" var="pageGroup" value="${(currentPage - 1) / 10}" />
				<c:set var="startPage" value="${(pageGroup * 10 + 1)}"></c:set>
				<c:set var="endPage" value="${(startPage + (10 - 1))}"></c:set>
			<c:if test="${currentPage > 1}">
					<a class="first" href="<c:url value="/ask/managerAsk.do?page=1" />">&lt;&lt;</a>
					<a class="prev" href="<c:url value="/ask/managerAsk.do?page=${currentPage-1}" />">&lt;</a>
			</c:if>
			<c:forEach begin="${startPage}" end="${endPage > totalPage ? totalPage : endPage}" var="pageNum">
				<c:choose>
					<c:when test="${currentPage == pageNum}">
						<a>${pageNum}</a>
					</c:when>
					<c:otherwise>
						<a href="<c:url value="/ask/managerAsk.do?page=${pageNum}" />">${pageNum}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${currentPage < totalPage}">
				<a class="next" href="<c:url value="/ask/managerAsk.do?page=${currentPage+1}" />">&gt;</a>
				<a class="last" href="<c:url value="/ask/managerAsk.do?page=${totalPage}" />">&gt;&gt;</a>
			</c:if>
		</div>
</body>
<script type="text/javascript">
/* 결제금액 계산 */
document.addEventListener('DOMContentLoaded', function() {
    const itemRows = document.querySelectorAll('.order-items tbody tr');
    const totalProductPriceElement = document.getElementById('total-product-price');
    const totalPaymentPriceElement = document.querySelector('.payment-summary .total');
    const shippingFeeElement = document.getElementById('shipping-fee');
    
    const SHIPPING_FEE_THRESHOLD = 50000; // 배송비 무료 기준금액
    const SHIPPING_FEE = 3000; // 기본 배송비

    function updateTotalPrice() {
        let totalProductPrice = 0;
        
        itemRows.forEach(row => {
            const priceElement = row.querySelector('.price strong');
            const quantityElement = row.querySelector('.quantity-control p');
            
            if (priceElement && quantityElement) {
                const price = parseInt(priceElement.textContent.replace(/[^0-9]/g, ''));
                const quantity = parseInt(quantityElement.textContent);
                totalProductPrice += price * quantity;
            }
        });
        // 총 결제금액 계산
        const totalPaymentPrice = totalProductPrice + shippingFee;
        // 화면에 표시
        totalProductPriceElement.textContent = totalProductPrice.toLocaleString() + "원";
        shippingFeeElement.textContent = shippingFee.toLocaleString() + "원";
        totalPaymentPriceElement.textContent = totalPaymentPrice.toLocaleString() + "원";
</script>
</html>