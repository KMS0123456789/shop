<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<c:url value='/resources/css/myorder.css' />" rel="stylesheet">
<style>
	#order2{
		background: black;
		color:white;
	}
</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
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
                    <span id="date">
                        <a href="#none" class="btnNormal" days="00"><img src="../resources/image/btn_date1.gif" alt="오늘"></a>
                        <a href="#none" class="btnNormal" days="07"><img src="../resources/image/btn_date2.gif" alt="1주일"></a>
                        <a href="#none" class="btnNormal" days="30"><img src="../resources/image/btn_date3.gif" alt="1개월"></a>
                        <a href="#none" class="btnNormal" days="90"><img src="../resources/image/btn_date4.gif" alt="3개월"></a>
                        <a href="#none" class="btnNormal" days="180"><img src="../resources/image/btn_date5.gif" alt="6개월"></a>
                    </span>
                </fieldset>
                <ul id="order_infor">
                    <li class=" ">기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 주문처리완료 후 36개월 이내의 주문내역을 조회하실 수 있습니다.</li>
                    <li class=" ">완료 후 36개월 이상 경과한 주문은 <a href="javascript:OrderHistory.searchPast(false)">[과거주문내역]</a>에서 확인할 수 있습니다.</li>
                    <li>주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.</li>
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
    <script type="text/javascript">
    	/* 설정 */
    	$(function(){
    		/* 캘린더 */
	    	  $('#start_date').datepicker({
	    			dateFormat: 'yy-mm-dd',
	  	    		prevText: '이전 달',
	  	   		    nextText: '다음 달',
	  	   		    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	  	   		    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	  	   		    dayNames: ['일','월','화','수','목','금','토'],
	  	   		    dayNamesShort: ['일','월','화','수','목','금','토'],
	  	   		    dayNamesMin: ['일','월','화','수','목','금','토'],
	  	   		    yearSuffix: '년',
	  		    	changeMonth: true,
	  		        changeYear: true,
	  		      	maxDate: '0',
	  		        showOn: "button",
	  		      	buttonImage: '../resources/image/ico_cal.gif',
	  		      	buttonImageOnly: true
	    	  });
	    	  $('#start_date').datepicker('setDate', '-3m');
	    	  
	    	  $('#end_date').datepicker({
	    			dateFormat: 'yy-mm-dd',
	  	    		prevText: '이전 달',
	  	   		    nextText: '다음 달',
	  	   		    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	  	   		    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	  	   		    dayNames: ['일','월','화','수','목','금','토'],
	  	   		    dayNamesShort: ['일','월','화','수','목','금','토'],
	  	   		    dayNamesMin: ['일','월','화','수','목','금','토'],
	  	   		    yearSuffix: '년',
	  		    	changeMonth: true,
	  		        changeYear: true,
	  		      	maxDate: '0',
	  		      	showOn: "button",
	  		      	buttonImage: '../resources/image/ico_cal.gif',
	  		      	buttonImageOnly: true
	    	  });
	    	  $('#end_date').datepicker('setDate', 'today');
    	});
    </script>
</body>
</html>