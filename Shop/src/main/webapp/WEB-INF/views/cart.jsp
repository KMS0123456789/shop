<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                            <th><input type="checkbox" id="select-all"></th>
                            <th style="text-align: center">주문상품정보</th>
                            <th style="text-align: center">수량</th>
                            <th style="text-align: center">가격</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td class="product-info">
                                <img src="../resources/image/product1.png" alt="Product1">
                                <div>
                                    <h3>마인 러블리 퍼프 더블버튼 블라우스(BL)</h3>
                                    <p>아이보리 / ONE SIZE</p>
                                    <button class="btn-option">옵션변경</button>
                                </div>
                            </td>
                            <td>
                                <div class="quantity-control">
                                    <input type="text" value="1">
                                    <div>
                                        <button class="quantity-up">▲</button>
                                        <button class="quantity-down">▼</button>
                                    </div>
                                </div>
                            </td>
                            <td class="price" style="width:100px">
                                <strong>20,000원</strong>
                            </td>
                            <td><button class="btn-remove">×</button></td>
                        </tr>
                        
                        <tr>
                            <td><input type="checkbox"></td>
                            <td class="product-info">
                                <img src="../resources/image/product2.png" alt="Product2">
                                <div>
                                    <h3>시원한 여름원단 핀턱 스판 뒷밴딩 와이드 반바지 슬랙스[P]</h3>
                                    <p>블랙 / S(숏)</p>
                                    <button class="btn-option">옵션변경</button>
                                </div>
                            </td>
                            <td>
                                <div class="quantity-control">
                                    <input type="text" value="1">
                                    <div>
                                        <button class="quantity-up">▲</button>
                                        <button class="quantity-down">▼</button>
                                    </div>
                                </div>
                            </td>
                            <td class="price" style="width:100px">
                                <strong>20,000원</strong>
                            </td>
                            <td><button class="btn-remove">×</button></td>
                        </tr>
                      
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
                    <span>40,000원</span>
                </div>
                <div class="summary-item">
                    <span>배송비</span>
                    <span>3,000원</span>
                </div>
                <div class="summary-item total">
                    <span>결제예정금액</span>
                    <span>43,000원</span>
                </div>
                <button class="btn-primary" onclick="location.href='<c:url value='/cart/order.do'/>'">전체상품 주문하기</button>
                <button class="btn-secondary-outline" onclick="location.href='<c:url value='/cart/order.do'/>'">선택상품 주문하기</button>
            </div>
        </div>
    </div>
</body>
</html>