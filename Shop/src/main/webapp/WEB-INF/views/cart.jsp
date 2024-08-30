<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장바구니</title>
    <link href="<c:url value='/resources/css/cart.css' />" rel="stylesheet">
</head>
<body>
<%@ include file="./includes/myheader.jsp" %>
    <div class="container">
        <h1>장바구니</h1>
        <div class="cart-header">
            <div class="cart-step active">
                <i class="icon-bag"></i>
                <span>장바구니</span>
            </div>
            <div class="cart-step">
                <i class="icon-card"></i>
                <span>주문/결제</span>
            </div>
            <div class="cart-step">
                <i class="icon-check"></i>
                <span>주문완료</span>
            </div>
        </div>
        <div class="cart-content" style="width:1200px">
            <div class="cart-items">
                <table>
                    <thead>
                        <tr>
                            <th><input type="checkbox" id="selectAll"></th>
                            <th style="text-align: center">주문상품정보</th>
                            <th style="text-align: center">수량</th>
                            <th style="text-align: center">가격</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${cartItems}">
                            <tr>
                                <td><input type="checkbox" class="item-checkbox" data-price="${item.itemCategory == 1 ? item.computers[0].computerSalePrice : item.peripherals[0].peripheralSalePrice}"></td>
                                <td class="product-info">
                                    <img src="<c:url value='/resources/image/' /><c:out value='${item.itemCategory == 1 ? "computer.png" : "peripheral.png"}' />" alt="Product">
                                    <div>
                                        <h3>
                                            ${item.itemCategory == 1 ? '컴퓨터' : '주변기기'}
                                        </h3>
                                        <p>옵션: SSD ${item.optSsd}GB, HDD ${item.optHdd}GB, OS ${item.optOs == 1 ? '포함' : '미포함'}</p>
                                        <button class="btn-option">옵션변경</button>
                                    </div>
                                </td>
                                <td>
                                    <div class="quantity-control">
                                        <p>${item.itemCount}</p>
                                    </div>
                                </td>
								<td class="price">
								    <strong>
								        <fmt:formatNumber value="${item.itemCategory == 1 ? item.computers[0].computerSalePrice : item.peripherals[0].peripheralSalePrice}" type="number" pattern="#,###"/>원
								    </strong>
								</td>
                                <td><button class="btn-remove">×</button></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div class="cart-actions">
                    <button class="btn-secondary">선택상품 삭제</button>
                    <button class="btn-secondary">전체상품 삭제</button>
                </div>
            </div>
            <div class="cart-summary">
                <h3>결제금액</h3>
                <div class="summary-item">
                    <span>총 상품금액</span>
                    <span id="total-product-price">0원</span>

                </div>
                <div class="summary-item">
				    <span>배송비</span>
				    <span id="shipping-fee">0원</span>
				</div>
                <div class="summary-item total">
                    <span>결제예정금액</span>
                    <span id="total-payment-price">0원</span>
                </div>
                <button class="btn-primary" onclick="location.href='<c:url value='/cart/order.do'/>'">전체상품 주문하기</button>
                <button class="btn-secondary-outline" onclick="location.href='<c:url value='/cart/order.do'/>'">선택상품 주문하기</button>
            </div>
        </div>
    </div>
</body>
	<script>
	//결제금액 계산
	document.addEventListener('DOMContentLoaded', function() {
	    const selectAllCheckbox = document.getElementById('selectAll');
	    const itemCheckboxes = document.querySelectorAll('.item-checkbox');
	    const totalProductPriceElement = document.getElementById('total-product-price');
	    const totalPaymentPriceElement = document.getElementById('total-payment-price');
	    const shippingFeeElement = document.getElementById('shipping-fee');
	    
	    const SHIPPING_FEE_THRESHOLD = 50000; // 배송비 무료 기준금액
	    const SHIPPING_FEE = 3000; // 기본 배송비
	    
	    // 전체 선택 체크박스 이벤트
	    selectAllCheckbox.addEventListener('change', function() {
	        itemCheckboxes.forEach(checkbox => checkbox.checked = selectAllCheckbox.checked);
	        updateTotalPrice();
	    });

	    // 개별 체크박스 이벤트
	    itemCheckboxes.forEach(checkbox => {
	        checkbox.addEventListener('change', updateTotalPrice);
	    });

	    function updateTotalPrice() {
	        let totalProductPrice = 0;
	        
	        itemCheckboxes.forEach(checkbox => {
	            if (checkbox.checked) {
	                const itemPrice = parseInt(checkbox.getAttribute('data-price'));
	                const quantityElement = checkbox.closest('tr').querySelector('.quantity-control p');
	                const quantity = parseInt(quantityElement.textContent);
	                totalProductPrice += itemPrice * quantity;
	            }
	        });
	        
	        // 배송비 계산
	        const shippingFee = totalProductPrice >= SHIPPING_FEE_THRESHOLD ? 0 : SHIPPING_FEE;
	        
	        // 총 결제금액 계산
	        const totalPaymentPrice = totalProductPrice + shippingFee;
	        
	        // 화면에 표시
	        totalProductPriceElement.textContent = totalProductPrice.toLocaleString() + "원";
	        shippingFeeElement.textContent = shippingFee.toLocaleString() + "원";
	        totalPaymentPriceElement.textContent = totalPaymentPrice.toLocaleString() + "원";
	        
	        // 전체 선택 체크박스 상태 업데이트
	        selectAllCheckbox.checked = itemCheckboxes.length > 0 && 
	                                    Array.from(itemCheckboxes).every(checkbox => checkbox.checked);
	    }
	    
	    // 페이지 로드 시 모든 상품 선택 및 초기 계산
	    selectAllCheckbox.checked = true;
	    itemCheckboxes.forEach(checkbox => checkbox.checked = true);
	    updateTotalPrice();
	});
	</script>
</html>
