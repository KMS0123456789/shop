<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<c:url value='/resources/css/myorder.css' />" rel="stylesheet">
<style>
	#order3{
		background: black;
		color:white;
	}
</style>
</head>
<body>
<%@ include file="./includes/myheader.jsp" %>
	<div id="mycontents">
        <div id="myortitle">
            <h2>주문 조회</h2>
        </div>
        <div id="myordermenu">
            <ul class="myordermenu">
                <li id="ormenu">
                	<form action="<c:url value='/ask/myorder.do'/>" method="get">
                		<input type="hidden" value="${sessionScope.user.email}" name="askUser">
                 		<button type="submit" id="order"> 주문 내역 조회</button>
                	</form>
                </li>
                <li id="ormenu">
                	<form action="<c:url value='/ask/myorder_cancel.do'/>" method="post">
                		<input type="hidden" value="${sessionScope.user.email}" name="askUser">
                 		<button type="submit" id="order2"> 취소/교환 내역</button>
                	</form>
                </li>
                <li id="ormenu">
                	<form action="<c:url value='/ask/myorder_past.do'/>" method="post">
                		<input type="hidden" value="${sessionScope.user.email}" name="askUser">
                 		<button type="submit" id="order3">과거 주문 내역</button>
                	</form>
                </li>
            </ul>
        </div>
        <div id="field">
            <form>
                <fieldset id="datecase">
                    <legend>검색기간 설정</legend>
                    <div id="selectcase">
                        <select id="search_year" class="fSelect">
                            <option value="2023" selected="selected">2023</option>
                            <option value="2022">2022</option>
                            <option value="2021">2021</option>
                            <option value="2020">2020</option>
                            <option value="2019">2019</option>
                        </select>
                    </div>
                    <input alt="조회" id="order_btn" type="image" src="../resources/image/btn_search.gif">
                </fieldset>
                <ul id="order_infor">
                    <li>주문처리완료 후 36개월 이내의 최근 주문건은 주문내역조회 탭에서 확인할 수 있습니다.</li>
                    <li>상품구매금액은 주문 당시의 판매가와 옵션추가금액의 합(부가세 포함)에 수량이 반영된 값입니다.</li>
                </ul>
                <input id="mode" name="mode" value="" type="hidden">
                <input id="term" name="term" value="" type="hidden">
            </form>
        </div>
        <div id="order_contents">
            <div id="order_title"><h3>주문 상품 정보</h3></div>
            <table border="1" id="or_table">
                <colgroup>
                    <col style="width:135px;">
                    <col style="width:93px;">
                    <col style="width:auto;">
                    <col style="width:61px;">
                    <col style="width:111px;">
                    <col style="width:111px;">
                    <col style="width:111px;">
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col">주문일자<br>[주문번호]</th>
                        <th scope="col">이미지</th>
                        <th scope="col">상품정보</th>
                        <th scope="col">수량</th>
                        <th scope="col">상품구매금액</th>
                        <th scope="col">주문처리상태</th>
                        <th scope="col">취소/교환/반품</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>2024-08-05</td>
                        <td>11</td>
                        <td>컴퓨터</td>
                        <td>1</td>
                        <td>456000원</td>
                        <td>배송완료</td>
                        <td> 교환 </td>
                    </tr>
                </tbody>
            </table>
            <p class="message ">주문 내역이 없습니다.</p>
            <div id="paging">
                <ul id="page">
                    <li><a>&lt;&lt;</a></li>
                    <li><a>&lt;</a></li>
                    <li><a>1</a></li>
                    <li><a>&gt;</a></li>
                    <li><a>&gt;&gt;</a></li>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>