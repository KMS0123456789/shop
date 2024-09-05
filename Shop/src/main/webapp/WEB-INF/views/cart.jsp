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
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<%@ include file="./includes/myheader.jsp" %>
<div class="container">
    <h1>장바구니</h1>
    <div class="cart-content" style="display: flex; justify-content: space-between;">
        <div class="cart-items" style="width: 70%;">
            <form id="cartForm" action="<c:url value='/cart/order.do'/>" method="post">
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
                            <tr data-cart-no="${item.cartNo}">
                                <td>
                                    <input type="checkbox" class="item-checkbox" name="checkedItem" 
                                           value="${item.cartNo}" 
                                           data-price="${item.itemCategory == 0 ? item.computers[0].computerSalePrice : item.peripherals[0].peripheralSalePrice}">
                                </td>
                                <td class="product-info">
                                    <img src="<c:url value='/resources/image/' /><c:out value='${item.itemCategory == 0 ? "computer.png" : "peripheral.png"}' />" alt="Product">
                                    <div>
                                        <h3>${item.itemCategory == 0 ? '컴퓨터' : '주변기기'}</h3>
                                        <p>옵션: SSD ${item.optSsd}GB, HDD ${item.optHdd}GB, OS ${item.optOs == 0 ? '미포함' : '포함'}</p>
                                    </div>
                                </td>
                                <td>
                                    <div class="quantity-control">
                                        <p>${item.itemCount}</p>
                                    </div>
                                </td>
                                <td class="price">
                                    <strong>
                                        <fmt:formatNumber value="${item.itemCategory == 0 ? item.computers[0].computerSalePrice : item.peripherals[0].peripheralSalePrice}" type="number" pattern="#,###"/>원
                                    </strong>
                                </td>
                                <td><button type="button" class="btn-remove">×</button></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
	            <div class="cart-actions">
			        <button type="button" class="btn-delete-selected">선택상품 삭제</button>
			        <button type="button" class="btn-delete-all">전체상품 삭제</button>
			    </div>
            </form>
        </div>
        <div class="cart-summary" style="width: 25%;">
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
            <!-- 전체상품 주문하기 버튼 -->
            <button type="button" class="btn-primary" onclick="submitForm(false)">전체상품 주문하기</button>
            <!-- 선택상품 주문하기 버튼 -->
            <button type="button" class="btn-secondary-outline" onclick="submitForm(true)">선택상품 주문하기</button>
        </div>
    </div>
</div>
</body>
	<script>
    // form 제출을 위한  함수
    function submitForm(isSelected) {
        var form = document.getElementById('cartForm');
        
        if (isSelected) {
            // 선택상품만 전송하는 경우: 체크된 상품만 남김
            var checkedItems = document.querySelectorAll('.item-checkbox:checked');
            if (checkedItems.length === 0) {
                alert("선택된 상품이 없습니다.");
                return;
            }
        } else {
            // 전체상품을 전송하는 경우: 모든 checkbox 선택
            var checkboxes = document.querySelectorAll('.item-checkbox');
            checkboxes.forEach(function(checkbox) {
                checkbox.checked = true;
            });
        }

        form.submit();
    }
	
	//결제금액 계산
	document.addEventListener('DOMContentLoaded', function() {
	    const selectAllCheckbox = document.getElementById('selectAll');
	    const itemCheckboxes = document.querySelectorAll('.item-checkbox');
	    const totalProductPriceElement = document.getElementById('total-product-price');
	    const totalPaymentPriceElement = document.getElementById('total-payment-price');
	    const shippingFeeElement = document.getElementById('shipping-fee');
	    const removeButtons = document.querySelectorAll('.btn-remove');
	    const deleteSelectedButton = document.querySelector('.btn-delete-selected');
	    const deleteAllButton = document.querySelector('.btn-delete-all');
	    const btnSubmitSelected = document.querySelector('.btn-secondary-outline');
	    const btnSubmitAll = document.querySelector('.btn-primary');
	    
	    const SHIPPING_FEE_THRESHOLD = 50000; // 배송비 무료 기준금액
	    const SHIPPING_FEE = 3000; // 기본 배송비
	    
	 	// 선택상품 주문하기 버튼 클릭 시
	    btnSubmitSelected.addEventListener('click', function(event) {
	        // 체크된 항목이 하나라도 있는지 확인
	        const checkedItems = Array.from(itemCheckboxes).some(checkbox => checkbox.checked);
	        
	        if (!checkedItems) {
	            event.preventDefault(); // 폼 제출을 막음
	            alert('상품을 선택해 주세요.');
	        } else {
	            form.submit(); // 폼 제출
	        }
	    });

	    // 전체상품 주문하기 버튼 클릭 시
	    btnSubmitAll.addEventListener('click', function(event) {
	        // 모든 체크박스 선택
	        itemCheckboxes.forEach(checkbox => checkbox.checked = true);
	        form.submit(); // 폼 제출
	    });
	    
	    // 전체 선택 체크박스 이벤트
	    selectAllCheckbox.addEventListener('change', function() {
	        itemCheckboxes.forEach(checkbox => checkbox.checked = selectAllCheckbox.checked);
	        updateTotalPrice();
	    });
	
	    // 개별 체크박스 이벤트
	    itemCheckboxes.forEach(checkbox => {
	        checkbox.addEventListener('change', updateTotalPrice);
	    });
	
	    // 개별 삭제 x 버튼 이벤트
	    removeButtons.forEach(button => {
	        button.addEventListener('click', function() {
	            const row = button.closest('tr');
	            const cartNo = row.getAttribute('data-cart-no');
	            
	            // AJAX 요청으로 서버에 삭제 요청
	            $.ajax({
	                url: "${pageContext.request.contextPath}/cart/deleteItem.do",
	                method: 'POST',
	                contentType: 'application/json',  // JSON 형식을 명시
	                data: JSON.stringify({ cartNo: cartNo }), // JSON으로 데이터 변환
	                success: function(response) {
	                    row.remove();
	                    updateTotalPrice();
	                    alert('상품이 삭제되었습니다.');
	                },
	                error: function(error) {
	                    console.error('Error:', error);
	                    alert('삭제 중 오류가 발생했습니다.');
	                }
	            });
	        });
	    });
	
	    // 선택된 상품 삭제 버튼 이벤트
		deleteSelectedButton.addEventListener('click', function() {
		    const selectedNos = [];
		    const selectedRows = [];
		    
		    itemCheckboxes.forEach(checkbox => {
		        if (checkbox.checked) {
		            const row = checkbox.closest('tr');
		            const cartNo = row.getAttribute('data-cart-no');
		            if (cartNo && cartNo.trim() !== '') {
		                selectedNos.push(cartNo);
		                selectedRows.push(row);
		            }
		        }
		    });
		    
		    if (selectedNos.length > 0) {
		        console.log('Attempting to delete:', selectedNos);
		        $.ajax({
		            url: "${pageContext.request.contextPath}/cart/deleteSelected.do",
		            method: 'POST',
		            contentType: 'application/json',
		            data: JSON.stringify({ cartNos: selectedNos }),
		            success: function(response) {
		                console.log('Server response:', response);
		                console.log('Selected Nos:', selectedNos);
		                alert('선택한 상품이 삭제되었습니다.');
		                
		                selectedRows.forEach((row, index) => {
		                    const cartNo = selectedNos[index];
		                    console.log(`Removing row for cartNo: ${cartNo}`);
		                    if (row && row.parentNode) {
		                        row.parentNode.removeChild(row);
		                        console.log(`Successfully removed row for cartNo: ${cartNo}`);
		                    } else {
		                        console.warn(`Failed to remove row for cartNo: ${cartNo}`);
		                    }
		                });
		                
		                updateTotalPrice();
		                
		                // 체크박스 상태 초기화
		                selectAllCheckbox.checked = false;
		                itemCheckboxes.forEach(cb => cb.checked = false);
		            },
		            error: function(error) {
		                console.error('Error:', error);
		                alert('선택된 상품 삭제 중 오류가 발생했습니다.');
		            }
		        });
		    } else {
		        alert('선택된 상품이 없습니다.');
		    }
		});
	
	    
	    // 전체 삭제 버튼 이벤트
	    deleteAllButton.addEventListener('click', function() {
	        const userEmail = "${user.email}";
	        
	        console.log("Attempting to delete all items for user:", userEmail);
	        
	        $.ajax({
	            url: "${pageContext.request.contextPath}/cart/deleteAll.do",
	            method: 'POST',
	            contentType: 'application/json',
	            data: JSON.stringify({ cartUser: userEmail }),
	            success: function(response) {
	                console.log("Server response:", response);
	                if (response === "모든 상품이 삭제되었습니다.") {
	                    // 테이블 본문의 모든 행을 제거합니다
	                    const tbody = document.querySelector('.cart-items tbody');
	                    console.log("tbody before removal:", tbody.innerHTML);
	                    tbody.innerHTML = '';
	                    console.log("tbody after removal:", tbody.innerHTML);

	                    // 체크박스 배열을 비웁니다
	                    itemCheckboxes.forEach(checkbox => checkbox.checked = false);

	                    // 전체 선택 체크박스의 상태를 업데이트합니다
	                    selectAllCheckbox.checked = false;

	                    // 가격을 업데이트합니다
	                    updateTotalPrice();

	                    console.log("All items should be removed now");
	                }
	                alert("모든 상품이 삭제되었습니다.");  // 여기서 알림 메시지를 한국어로 변경했습니다
	            },
	            error: function(error) {
	                console.error('Error:', error);
	                alert('전체 상품 삭제 중 오류가 발생했습니다.');
	            }
	        });
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
