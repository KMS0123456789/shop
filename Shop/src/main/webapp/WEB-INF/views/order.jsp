<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문</title>
    <link href="<c:url value='/resources/css/order.css' />" rel="stylesheet">
    <!-- 포트원 결제 -->
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript">
        var useremail = "${sessionScope.user.email}";
        var username = "${sessionScope.user.name}";
    </script>
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
            	<tr>
                	<td>
                        <img src="../resources/image/product1.png" alt="product1.png" class="product-image">
                        <div class="product-info">
                            <p>마인 러블리 퍼프 더블버튼 블라우스(BL)</p>
                            <p>아이보리 / ONE SIZE</p>
                            <button class="option-change">옵션변경</button>
                        </div>
                    </td>
                    <td>
                        <div class="quantity-control">
                            <input type="text" value="1">
                        </div>
                    </td>
                    <td>
                        <p class="original-price" style="text-align: center">20,000원</p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <img src="../resources/image/product2.png" alt="product2" class="product-image">
                        <div class="product-info">
                            <p>시원한 여름원단 핀턱 스판 뒷밴딩 와이드 반바지 슬랙스[P]</p>
                            <p>블랙 / S(숏)</p>
                            <button class="option-change">옵션변경</button>
                        </div>
                    </td>
                    <td>
                        <div class="quantity-control">
                            <input type="text" value="1">
                        </div>
                    </td>
                    <td>
                        <p class="original-price" style="text-align: center">20,000원</p>
                    </td>
                </tr>
                
            </tbody>
        </table>
        <div class="total-price">
        	총상품가격 : 40,000 원 + 배송비 : 3,000 원 = 합계 : <span>43,000원</span>
        </div>
        <h2>주문정보</h2>
        <div class="order-info-summary">
            <div class="order-info">
                <h3>01. 주문자 정보</h3>
                <form>
                    <div class="form-group">
                        <label for="name">이름</label>
                        <input type="text" id="name">
                    </div>
                    <div class="form-group">
                        <label for="email">이메일</label>
                        <input type="email" id="email">
                    </div>
                    <div class="form-group">
					    <label for="phone">휴대전화</label>
					    <div>
					        <input type="tel" id="phone">-
					        <input type="tel">-
					        <input type="tel">
					    </div>
					</div><br>
                </form>
                <h3>02. 받는사람 정보</h3>
                <form>
                    <div class="shipping-options">
                        <label><input type="radio" name="shipping" checked> 주문자 정보와 동일</label>
                        <label><input type="radio" name="shipping"> 직접입력</label>
                        <input type="button" class="option-change" value="배송지 목록">
                    </div>
                    <div class="form-group">
                        <label for="recipient-name">이름</label>
                        <input type="text" id="recipient-name">
                    </div>
                    <div class="form-group">
                        <label>주소</label>
                        <div class="address-inputs">
					        <input Id="postal-code" placeholder="우편번호">
					        <input type="button" class="postcode" onclick="DaumPostcode()" value="우편번호"><br>
					        <input type="text" Id="address-basic" placeholder="기본주소"><br>
					        <input type="text" Id="address-detail" placeholder="상세주소">
					        <input type="text" Id="address-extra" placeholder="추가입력">
					    </div>
                    </div>
                    <div class="form-group">
                        <label for="phone">휴대전화</label>
                        <div>
	                        <input type="tel" id="phone">-
	                        <input type="tel">-
	                        <input type="tel">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="delivery-msg">배송메모</label>
                        <input type="text" id="delivery-msg">
                    </div>
                </form><br>
                <h3>03. 결제 수단</h3>
                <div class="payment-methods">
                    <h4><span class="highlight">카카오페이 결제하기</span></h4>
                    <button class=kakaoPay><img height="40px" src="../resources/image/kakaoPay.png" alt="카카오페이"></button>
                </div>
            </div><br><br>
            <div class="payment-summary">
                <h3>결제정보</h3>
                <p class="total">43,000원</p>
                <p>총 상품가격 40,000원</p>
                <p>+ 배송비 3,000원</p>
                <button class="order-button" id="payment">주문하기</button>
            </div>
        </div>
    </div>
</body>
	 <script>
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

	     IMP.request_pay({
	         pg: 'kakaopay.TC0ONETIME',
	         pay_method: 'card',
	         merchant_uid: newMerchantUid,
	         name: '마인 러블리 퍼프 더블버튼 블라우스(BL)',
	         	/* document.getElementById('title').innerText, */
	         amount: 43000, //제품가격
	         buyer_email: useremail,
	         buyer_name: username,
	     }, function (rsp) {
	         if (rsp.success) {
	             console.log("결제 성공:", rsp);
	             alert('결제가 완료되었습니다!');
	             // 서버 연결 전이므로 바로 페이지 이동
	             window.location.href = 'orderComplete.jsp';
	         } else {
	             console.log("결제 실패:", rsp);
	             alert(`결제 실패: ${rsp.error_msg}`);
	         }
	     });
	 }

	 /* function sendPaymentInfoToServer(paymentResult) {
	     $.ajax({
	         url: '/payment/complete',
	         method: 'POST',
	         contentType: 'application/json',
	         data: JSON.stringify(paymentResult),
	         success: function(response) {
	        	 alert('결제 완료!');
	        	 window.location.href = '/orderComplete.jsp';
	        	 
	        	 if (response.status == 200) {
	                 alert('결제 완료!');
	                 window.location.reload();
	             } else {
	                 alert(`에러: [${response.status}] 결제요청이 승인된 경우 관리자에게 문의바랍니다.`);
	             }
	         },
	         error: function() {
	             alert('서버 오류가 발생했습니다. 관리자에게 문의바랍니다.');
	         }
	     });
	 } */

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