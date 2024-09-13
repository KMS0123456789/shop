<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link href="<c:url value='/resources/css/mypage.css' />" rel="stylesheet">
</head>
<body>
<%@ include file="./includes/myheader.jsp" %>
	<section>
        <div id="mymain">
            <div id="mytitle"><h3>MY PAGE</h3></div>
            <div id="mymenu">
                <ul class="mymenu">
                    <li>
                    	<form action="<c:url value='/user/mypage.do'/>" method="post">
	                		<input type="hidden" value="${sessionScope.user.email}" name="email">
	                 		<button type="submit" id="first"><h5> MY ACCOUNT</h5> <h4>내 계정</h4></button>
                		</form>
                	</li>
                    <li>
                    	<form action="<c:url value='/ask/myorder.do'/>" method="get">
	                		<input type="hidden" value="${sessionScope.user.email}" name="askUser">
	                 		<button type="submit"> <h5> ORDER </h5> <h4>주문내역 조회</h4> </button>
                		</form>
                	</li>
                    <li>
	                    <form action="<c:url value='/addr/myaddrlist.do'/>" method="get">
	                    	<input type="hidden" name="addrUserEmail" value="${sessionScope.user.email}">
	                    	<button type="submit"> <h5> ADDRESS </h5> <h4>배송 주소록 관리</h4> </button>
	                    </form>
                    </li>
                    <li>
                    	<form action="<c:url value='/user/myboard.do'/>" method="get">
	                		<input type="hidden" value="${sessionScope.user.email}" name="email">
	                 		<button type="submit" ><h5> BOARD </h5> <h4>내가 쓴 게시물</h4></button>
                		</form>
                    </li>
                </ul>
            </div>
	            <div id="main_content">
					<div id="mywish">
	                   <h5> <a href="<c:url value="/keep/myKeep.do"/>">나의 위시리스트 ></a> </h5>
	                   <h4> ${my.keepCount}</h4>
	               	</div>
	                <div id="mycart">
	                    <h5> <a href="<c:url value="/cart/view.do"/>"> 장바구니 > </a> </h5>
	                    <h4> ${my.cartCount} </h4>
	                </div>
	            </div>
	            <div id="order_case">
	                <div id="title"><h3> 나의 주문 현황</h3></div>
	                <div id="state">
	                    <ul>
	                        <li id="d_state"><strong>결제 완료</strong><a href="<c:url value='/ask/myorder.do'/>"><span>${my.payCount}</span></a></li>
	                        <li id="d_state"><strong>배송 준비중</strong><a href="<c:url value='/ask/myorder.do'/>"><span>${my.dReadyCount}</span></a></li>
	                        <li id="d_state"><strong>배송 완료</strong><a href="<c:url value='/ask/myorder.do'/>"><span>${my.clearCount}</span></a></li>
	                        <li id="d_state"><strong>구매 확정</strong><a href="<c:url value='/ask/myorder.do'/>"><span>${my.buyCount}</span></a></li>
	                    </ul>
	                    <ul id="re">
	                        <li><strong>취소 : </strong><a href="<c:url value='/ask/myorder_cancel.do'/>"><span>${my.orcancelCount}</span></a></li>
	                        <li><strong>교환 : </strong><a href="<c:url value='/ask/myorder_cancel.do'/>"><span>${my.orchangeCount}</span></a></li>
	                    </ul>
	                </div>
	            </div>
	        </div>
    </section>
</body>
</html>