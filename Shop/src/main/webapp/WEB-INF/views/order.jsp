<%@page import="com.project.shop.user.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문</title>
    <link href="<c:url value='/resources/css/order.css' />" rel="stylesheet">
    <!-- 포트원 결제 -->
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
        var useremail = "${sessionScope.user.email}";
        var username = "${sessionScope.user.name}";
        var userEmail = useremail;
    </script>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
    <%@ include file="./includes/myheader.jsp" %>
    <div class="order-page">
        <h1>주문/결제</h1>
        <div class="cart-header">
            <div class="cart-step">
                <i class="icon-bag"></i>
                <span>장바구니</span>
            </div>
            <div class="cart-step active">
                <i class="icon-card"></i>
                <span>주문/결제</span>
            </div>
            <div class="cart-step">
                <i class="icon-check"></i>
                <span>주문완료</span>
            </div>
        </div>
        <h2>커스텀PC Shop 상품</h2>
        <table class="order-items">
            <thead>
                <tr>
                    <th>주문상품정보</th>
                    <th>수량</th>
                    <th>가격</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${cartItems}">
                <tr>
                    <td>
                        <img src="<c:url value='/resources/image/${item.itemCategory == 0 ? "computer.png" : "peripheral.png"}' />" alt="Product" class="product-image">
                        <div class="product-info">
                            <h3>
                                ${item.itemCategory == 0 ? '컴퓨터' : '주변기기'}
                            </h3>
                            <p>옵션: SSD ${item.optSsd}GB, HDD ${item.optHdd}GB, OS ${item.optOs == 0 ? '포함' : '미포함'}</p>
                        </div>
                    </td>
                    <td>
                        <div class="quantity-control">
                            <p>${item.itemCount}</p>
                        </div>
                    </td>
                    <td class="price" style="text-align: center">
					    <strong>
					        <fmt:formatNumber value="${item.itemCategory == 0 ? item.computers[0].computerSalePrice : item.peripherals[0].peripheralSalePrice}" type="number" pattern="#,###"/>원
					    </strong>
					</td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
        <h2>주문정보</h2>
        <div class="order-info-summary">
            <div class="order-info">
                <h3>01. 주문자 정보</h3>
                <form>
                    <div class="form-group">
                        <label for="name">이름</label>
                        <input type="text" id="name" value="${sessionScope.user.name}">
                    </div>
                    <div class="form-group">
                        <label for="email">이메일</label>
                        <input type="email" id="email" value="${sessionScope.user.email}">
                    </div>
                    <div class="form-group">
                        <label for="phone">휴대전화</label>
                        <div>
						    <c:if test="${not empty sessionScope.user}">
							    <c:set var="phoneNum" value="${sessionScope.user.phoneNum}" />
							    
							    <c:if test="${not empty phoneNum}">
							        <c:choose>
							            <c:when test="${fn:startsWith(phoneNum, '+82 ')}">
							                <c:set var="phoneNum" value="0${fn:substring(phoneNum, 4, fn:length(phoneNum))}" />
							            </c:when>
							        </c:choose>
							        
							        <c:set var="phoneParts" value="${fn:split(phoneNum, '-')}" />
							    </c:if>
							</c:if>
							<c:if test="${empty phoneParts}">
							    <c:set var="phoneParts" value="${fn:split('--', '-')}" />
							</c:if>
						    <input type="tel" id="phone" name="phone1" value="${phoneParts[0]}">-
						    <input type="tel" name="phone2" value="${phoneParts[1]}">-
						    <input type="tel" name="phone3" value="${phoneParts[2]}">
						</div>
                    </div><br>
                </form>
                <h3>02. 받는사람 정보</h3>
				<form>
				    <div class="shipping-options">
				        <label><input type="radio" name="shipping" value="same"> 주문자 정보와 동일</label>
				        <label><input type="radio" name="shipping" value="new"> 직접입력</label>
				        <button type="button" id="address-list-btn" class="option-change">배송지 목록</button>
				    </div>
				    <div class="form-group">
				        <label for="recipient-name">이름</label>
				        <input type="text" id="recipient-name" value="">
				    </div>
				    <div class="form-group">
				        <label>주소</label>
				        <div class="address-inputs">
				            <input id="postal-code" placeholder="우편번호" value="">
				            <input type="button" class="postcode" onclick="DaumPostcode()" value="우편번호"><br>
				            <input type="text" id="address-basic" placeholder="기본주소" value=""><br>
				            <input type="text" id="address-detail" placeholder="상세주소" value="">
				            <input type="text" id="address-extra" placeholder="추가입력" value="">
				        </div>
				    </div>
				    <div class="form-group">
				        <label for="recipient-phone">휴대전화</label>
				        <div>
				            <input type="tel" id="recipient-phone" name="recipient-phone1" value="">-
				            <input type="tel" name="recipient-phone2" value="">-
				            <input type="tel" name="recipient-phone3" value="">
				        </div>
				    </div>
				    <div class="form-group">
				        <label for="delivery-msg">배송메모</label>
				        <input type="text" id="delivery-msg" value="">
				    </div>
				</form><br>
				
				<!-- 배송지 목록 모달 -->
				<div id="address-modal" class="modal" style="display: none;">
				    <div class="modal-content">
				        <span class="close">&times;</span>
				        <h2>배송지 목록</h2>
				        <ul id="address-list"></ul>
				    </div>
				</div>
				
                <h3>03. 결제 수단</h3>
                <div class="payment-methods">
                    <h4><span class="highlight">카카오페이 결제하기</span></h4>
                    <button class="kakaoPay"><img height="40px" src="<c:url value='/resources/image/kakaoPay.png'/>" alt="카카오페이"></button>
                </div>
            </div><br><br>
            <div class="payment-summary">
                <h3>결제정보</h3>
                <p class="total">0원</p>
                <span>총 상품가격</span>
                <span id="total-product-price">0원</span> + 
                <span>배송비</span>
                <span id="shipping-fee">0원</span>
                <button class="order-button" id="payment">결제하기</button>
            </div>
        </div>
    </div>
</body>
	<script>
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
	        
	        itemRows.forEach(function(row) {
	            const priceElement = row.querySelector('.price strong');
	            const quantityElement = row.querySelector('.quantity-control p');
	            
	            if (priceElement && quantityElement) {
	                const price = parseInt(priceElement.textContent.replace(/[^0-9]/g, ''));
	                const quantity = parseInt(quantityElement.textContent);
	                totalProductPrice += price * quantity;
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
	    }
	    
	    // 페이지 로드 시 초기 계산
	    updateTotalPrice();
	});
	
	
	/* 주소록 불러오기*/
	$('#address-list-btn').click(function() {
	    $.ajax({
	        url: "<c:url value='/cart/addr.do'/>",
	        type: 'GET',
	        dataType: 'json',
	        success: function(data) {
	            if (Array.isArray(data)) {
	                showAddressModal(data);
	            } else {
	                showAddressModal([data]); // 단일 객체인 경우 배열로 감싸서 처리
	            }
	        },
	        error: function(xhr, status, error) {
	            console.error('Error fetching addresses:', xhr.responseText);
	            alert('주소 목록을 불러오는데 실패했습니다. 오류: ' + xhr.status + ' ' + error);
	        }
	    });
	});

    $(document).on('click', '.close', function() {
        $('#address-modal').hide();
    });

    $(document).on('click', '#address-list li', function() {
        const selectedAddress = $(this).data('address');
        fillAddressForm(selectedAddress);
        $('#address-modal').hide();
    });
	
    function showAddressModal(addresses) {
        const addressList = $('#address-list');
        addressList.empty();

        if (Array.isArray(addresses)) {
            if (addresses.length > 0) {
                addresses.forEach(function(address) {
                    const li = $('<li>')
                        .text(address.addrUserName + ' - ' + address.address)
                        .data('address', address);
                    addressList.append(li);
                });
            } else {
                addressList.append('<li>저장된 주소가 없습니다.</li>');
            }
        } else {
            console.error('주소 데이터가 배열이 아닙니다:', addresses);
            addressList.append('<li>주소 데이터 오류</li>');
        }

        $('#address-modal').show();
    }
	
    function fillAddressForm(address) {
        $('#recipient-name').val(address.addrUserName);  // 사용자 이름
        $('#postal-code').val(address.addressCode);     // 우편번호
        $('#address-basic').val(address.address);        // 기본 주소
        $('#address-detail').val(address.addressDetail); // 상세 주소
        $('#address-extra').val(address.addressPlus);    // 추가 주소

        // 전화번호를 3개로 나눠서 입력
        var phoneParts = address.addrUserPhoneNum.split('-'); // 전화번호를 '-'로 분리
        $('input[name="recipient-phone1"]').val(phoneParts[0]); // 첫 번째 부분
        $('input[name="recipient-phone2"]').val(phoneParts[1]); // 두 번째 부분
        $('input[name="recipient-phone3"]').val(phoneParts[2]); // 세 번째 부분
    }

    
 	/* 주소 선택 입력 */
    document.addEventListener('DOMContentLoaded', function() {
   	    var shippingOptions = document.querySelectorAll('input[name="shipping"]');
   	    var addressInputs = document.querySelectorAll('#postal-code, #address-basic, #address-detail, #address-extra');
   	    var phoneInputs = document.querySelectorAll('input[name^="recipient-phone"]');
   	    var recipientNameInput = document.getElementById('recipient-name');

   	    // 주문자 정보
   	    var orderName = document.getElementById('name').value;
   	    var orderPhone = [
   	        document.querySelector('input[name="phone1"]').value,
   	        document.querySelector('input[name="phone2"]').value,
   	        document.querySelector('input[name="phone3"]').value
   	    ];

   	    // 저장된 주소 정보
   	    var savedAddress = {
   	        postalCode: '${addr.addressCode}',
   	        basicAddress: '${addr.address}',
   	        detailAddress: '${addr.addressDetail}',
   	        extraAddress: '${addr.addressPlus}'
   	    };
   	    
   	    function clearFields() {
   	        recipientNameInput.value = '';
   	        addressInputs.forEach(function(input) {
   	            input.value = '';
   	        });
   	        phoneInputs.forEach(function(input) {
   	            input.value = '';
   	        });
   	    }

   	    function fillFields() {
   	        recipientNameInput.value = orderName;
   	        addressInputs[0].value = savedAddress.postalCode;
   	        addressInputs[1].value = savedAddress.basicAddress;
   	        addressInputs[2].value = savedAddress.detailAddress;
   	        addressInputs[3].value = savedAddress.extraAddress;
   	        phoneInputs.forEach(function(input, index) {
   	            input.value = orderPhone[index];
   	        });
   	    }

   	    shippingOptions.forEach(function(option) {
   	        option.addEventListener('change', function() {
   	            if (this.checked && this.value === 'same') {
   	                fillFields();
   	            } else if (this.checked && this.value === 'new') {
   	                clearFields();
   	            }
   	        });
   	    });

   	    // 초기 상태 설정: 모든 입력 필드를 비움
   	    clearFields();
	});
 	
 	
	/* 카카오페이 구현 */
	document.getElementById('payment').addEventListener('click', function() {
	     kakaoPay(username, useremail);
	});
	 
	let lastUsedMerchantUid = null;
	
	function generateMerchantUid() {
	    var today = new Date();
	    var randomStr = Math.random().toString(36).substring(2, 15);
	    return "IMP" + today.getTime() + randomStr;
	}
	
	function kakaoPay(username, useremail) {
	    if (!useremail || useremail.trim() === "") {
	        alert('로그인이 필요합니다!');
	        return;
	    }

	    if (!confirm("구매 하시겠습니까?")) {
	        return;
	    }

	    var IMP = window.IMP;
	    IMP.init("imp41762117");
	 	// 새로운 merchant_uid 생성
	    var newMerchantUid = generateMerchantUid();
	 	
	 	// 이전에 사용한 merchant_uid와 다른지 확인
	 	while (newMerchantUid === lastUsedMerchantUid) {
	        newMerchantUid = generateMerchantUid();
	    }
	    lastUsedMerchantUid = newMerchantUid;
		
	 	// 동적으로 주문 이름 생성
	    var orderName = "커스텀PC Shop 주문";
	    var firstItemName = document.querySelector('.order-items tbody tr .product-info h3').textContent.trim();
	    if (firstItemName) {
	        orderName = firstItemName;
	        var itemCount = document.querySelectorAll('.order-items tbody tr').length;
	        if (itemCount > 1) {
	            orderName += "외 " +  (itemCount - 1) + "건";
	        }
	    }
		
	 	// 총 결제 금액 가져오기
	    var totalAmount = parseInt(document.querySelector('.payment-summary .total').textContent.replace(/[^0-9]/g, ''));

	    IMP.request_pay({
	        pg: 'kakaopay.TC0ONETIME',
	        pay_method: 'card',
	        merchant_uid: lastUsedMerchantUid,
	        name: orderName,
	        amount: totalAmount,
	        buyer_email: useremail,
	        buyer_name: username,
	    }, function (rsp) {
	        if (rsp.success) {
	            // 결제 성공 시 서버로 결제 및 주문 정보 전송
	            sendPaymentInfoToServer({
	                askUser: useremail,
	                askDetails: getCartItemsForServer(useremail)
	                /* items: getCartItemsForServer() // 장바구니 아이템 정보를 서버로 전송 */
	            });
	        } else {
	        	console.error('카카오페이 결제 실패:', rsp);
	            alert("결제 실패: " + rsp.error_msg); // 여기서 오류가 발생하지 않도록 공백 추가
	        }
	    });
	}

	function getCartItemsForServer(useremail) {
	    const items = [];
	    document.querySelectorAll('.order-items tbody tr').forEach(function(row) {
	        const itemCategory = row.querySelector('.product-info h3').textContent.trim() === '컴퓨터' ? 0 : 1;
	        const item = {
	            askDetailUser: useremail,  // 이메일을 askDetailUser 필드에 추가
	            itemCategory: itemCategory,
	            itemCount: parseInt(row.querySelector('.quantity-control p').textContent),
	            optNo: 0, // 필요 시 옵션 번호 추가
	            computerNo: itemCategory === 0 ? row.dataset.computerNo : null,
	            peripheralNo: itemCategory === 1 ? row.dataset.peripheralNo : null
	        };
	        items.push(item);
	    });
	    return items;
	}
	    
	function sendPaymentInfoToServer(paymentResult) {
	    $.ajax({
	        url: '<c:url value="/ask/completePay.do"/>',
	        method: 'POST',
	        contentType: 'application/json',
	        data: JSON.stringify(paymentResult),
	        success: function(response) {
	            console.log('서버 응답:', response);
	            
	            if (response.status === 200) {
	                alert(response.message);
	                window.location.href = '<c:url value="/ask/orderComplete.do"/>';
	            } else {
	                console.error('서버 응답 상세:', response);
	                alert(`오류 발생: [${response.status}] ${response.message}`);
	            }
	        },
	        error: function(xhr, status, error) {
	            console.error("서버 요청 실패:", xhr.responseText);
	            console.error("상태:", status);
	            console.error("오류:", error);
	            
	            let errorMessage = '서버 오류가 발생했습니다. 관리자에게 문의 바랍니다.';
	            try {
	                const errorResponse = JSON.parse(xhr.responseText);
	                if (errorResponse && errorResponse.message) {
	                    errorMessage = errorResponse.message;
	                }
	            } catch (e) {
	                console.error('응답 파싱 실패:', e);
	            }
	            
	            alert(errorMessage);
	        }
	    });
	}
	
	
	/* 다음주소 검색 입력 구현 */
	function DaumPostcode() {
	       new daum.Postcode({
	           oncomplete: function(data) {
	
	               var addr = '';
	               var extraAddr = '';
	
	               if (data.userSelectedType === 'R') {
	                   addr = data.roadAddress;
	               } else {
	                   addr = data.jibunAddress;
	               }
	               
	               if(data.userSelectedType === 'R'){
	                 
	                   if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                       extraAddr += data.bname;
	                   }
	                   
	                   if(data.buildingName !== '' && data.apartment === 'Y'){
	                       extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                   }
	                   
	                   if(extraAddr !== ''){
	                       extraAddr = ' (' + extraAddr + ')';
	                   }
	                   
	                   document.getElementById("address-extra").value = extraAddr;
	               } else {
	                   document.getElementById("address-extra").value = '';
	               }
	               
	               document.getElementById('postal-code').value = data.zonecode;
	               document.getElementById("address-basic").value = addr;
	              
	               document.getElementById("address-detail").focus();
	           }
	       }).open();
	}
	
	</script>
</html>