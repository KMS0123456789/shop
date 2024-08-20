<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<c:url value='/resources/css/myorder.css' />" rel="stylesheet">
<style>
	#order{
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
                <li id="ormenu"><a href="<c:url value='/user/myorder.do'/>" id="order">주문 내역 조회</a></li>
                <li id="ormenu"><a href="<c:url value='/user/myorder_cancel.do'/>" id="order2">취소/교환 내역</a></li>
                <li id="ormenu"><a href="<c:url value='/user/myorder_past.do'/>" id="order3">과거 주문 내역</a></li>
            </ul>
        </div>
        <div id="field">
            <form method="get" name="myorder_history" >
                <fieldset id="datecase">
                    <legend>검색기간 설정</legend>
                    <div class="stateSelect">
                        <select id="order_status" name="order_status" class="fSelect">
                            <option value="all">전체 주문처리상태</option>
                            <option value="shipped_after">결제 완료</option>
                            <option value="shipped_standby">배송준비중</option>
                            <option value="shipped_complate">배송완료</option>
                            <option value="order_cancel">취소</option>
                            <option value="order_exchange">교환</option>
                        </select>
                    </div>
                    <span id="date">
                        <a href="<c:url value='/ask/myOnedate.do'/>" class="btnNormal" days="00"><img src="../resources/image/btn_date1.gif" alt="오늘"></a>
                        <a href="#none" class="btnNormal" days="07"><img src="../resources/image/btn_date2.gif" alt="1주일"></a>
                        <a href="#none" class="btnNormal" days="30"><img src="../resources/image/btn_date3.gif" alt="1개월"></a>
                        <a href="#none" class="btnNormal" days="90"><img src="../resources/image/btn_date4.gif" alt="3개월"></a>
                        <a href="#none" class="btnNormal" days="180"><img src="../resources/image/btn_date5.gif" alt="6개월"></a>
                    </span>
                    <input id="start_date" name="history_start_date" class="start_date" readonly="readonly" size="10" value="" type="text">
                    ~ 
                    <input id="end_date" name="history_end_date"readonly="readonly" size="10" value="" type="text">
                    <input alt="조회" id="order_btn" type="image" src="../resources/image/btn_search.gif">
                </fieldset>
                <ul id="order_infor">
                    <li class="displaynone">기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 지난 주문내역을 조회하실 수 있습니다.</li>
                    <li class=" ">기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 주문처리완료 후 36개월 이내의 주문내역을 조회하실 수 있습니다.</li>
                    <li class=" ">완료 후 36개월 이상 경과한 주문은 <a href="<c:url value='/user/myorder_past.do'/>">[과거주문내역]</a>에서 확인할 수 있습니다.</li>
                    <li>주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.</li>
                    <li class="">취소/교환/반품 신청은 배송완료일 기준 7일까지 가능합니다.</li>
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
                <c:if test="${myOnedate != null }">
                	<c:forEach items="myOnedate" var="my">
                		  <tbody>
		                    <tr>
		                        <td>${my.askDate}<br>
		                        	 ${my.askNo }</td>
		                        <td>이미지</td>
		                        <td>컴퓨터</td>
		                        <td>1</td>
		                        <td>30000원</td>
		                        <td>배송</td>
		                        <td> - </td>
		                    </tr>
		                </tbody>
                	</c:forEach>
                </c:if>
                <tbody>
                    <tr>
                        <td>2024-08-05</td>
                        <td>11</td>
                        <td>컴퓨터</td>
                        <td>1</td>
                        <td>456000원</td>
                        <td>배송완료</td>
                        <td> - </td>
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
	    	  $('#start_date').datepicker('setDate', 'today');
	    	  
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