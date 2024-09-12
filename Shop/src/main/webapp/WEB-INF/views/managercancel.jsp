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
	  <div id="cancelasklist">
            <ul class="cancelAskList">
                <li>
                	<form action="<c:url value='/askdetail/managercancel.do'/>" method="get">
                 		<button type="submit" id="list"> 주문 내역 조회</button>
                	</form>
                </li>
                <li>
                	<form action="<c:url value='/askdetail/changelist.do'/>" method="get">
                 		<button type="submit" id="list2"> 교환 내역</button>
                	</form>
                </li>
            </ul>
        </div>
		<table>
			<thead>
				<tr>
					<th>주문 번호</th>
					<th>처리 상태</th>
					<th>구매자</th>
					<th>주문 일자</th>
					<th>상품 이미지</th>
					<th>상품 명</th>
					<th>옵션 명</th>
					<th>판매가</th>
				</tr>
			</thead>
			<c:forEach items="${ask}" var="ask">
				<c:forEach items="${ask.asks}" var="asks">	
					<tbody>
						<tr>
							<td>${asks.askNo}</td>	
							<td>
								<c:if test="${asks.askDeleteFlag ==  1}" >
									구매취소
								</c:if>
							</td>
							<td>${asks.askUser}</td>										
							<td>${asks.askDate}</td>
							<td>
								<c:forEach items="${ask.files}" var="file">
									<img class="mainImg2" src='<c:url value="${file.filePath}" />' style="width:50px;">
								</c:forEach>
							</td>
							<c:forEach items="${ask.computers}" var="com">
								<c:if test="${com.computerNo != 0}">
									<td>${com.computerTitle}</td>
									<td><p>옵션${ask.ssdName} ${ask.hddName} ${ask.osName}</p></td>
									<c:if test="${com.computerSalePrice + ask.ssdPrice + ask.hddPrice + ask.osPrice > 50000}">
										<td><f:formatNumber value="${com.computerSalePrice + ask.ssdPrice + ask.hddPrice + ask.osPrice}" type="number" pattern="#,###"/>원</td>
									</c:if>
									<c:if test="${com.computerSalePrice + ask.ssdPrice + ask.hddPrice + ask.osPrice < 50000}">
										<td><f:formatNumber value="${com.computerSalePrice + ask.ssdPrice + ask.hddPrice + ask.osPrice +3000}" type="number" pattern="#,###"/>원</td>
									</c:if>
	  							</c:if>
							</c:forEach>
							<c:forEach items="${ask.peripherals}" var="per">
								<c:if test="${per.peripheralNo != 0}">
									<td>${per.peripheralTitle}</td>
									<td>-</td>
									<c:if test="${per.peripheralSalePrice> 50000}">
										<td><f:formatNumber value="${per.peripheralSalePrice}" type="number" pattern="#,###"/>원</td>
									</c:if>
									<c:if test="${per.peripheralSalePrice < 50000}">
										<td><f:formatNumber value="${per.peripheralSalePrice}" type="number" pattern="#,###"/>원</td>
									</c:if>
 								</c:if>
							</c:forEach>
						</tr>                                    
					</tbody>
				</c:forEach>
			</c:forEach>					
		</table>
		<div class="paging">
			<f:parseNumber integerOnly="true" var="pageGroup" value="${(currentPage - 1) / 10}" />
			<c:set var="startPage" value="${(pageGroup * 10 + 1)}"></c:set>
			<c:set var="endPage" value="${(startPage + (10 - 1))}"></c:set>
			<c:if test="${currentPage > 1}">
				<a class="first" href="<c:url value="/askdetail/managercancel.do?page=1" />">&lt;&lt;</a>
				<a class="prev" href="<c:url value="/askdetail/managercancel.do?page=${currentPage-1}" />">&lt;</a>
			</c:if>
			<c:forEach begin="${startPage}" end="${endPage > totalPage ? totalPage : endPage}" var="pageNum">
				<c:choose>
					<c:when test="${currentPage == pageNum}">
						<a>${pageNum}</a>
					</c:when>
					<c:otherwise>
						<a href="<c:url value="/askdetail/managercancel.do?page=${pageNum}" />">${pageNum}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${currentPage < totalPage}">
				<a class="next" href="<c:url value="/askdetail/managercancel.do?page=${currentPage+1}" />">&gt;</a>
				<a class="last" href="<c:url value="/askdetail/managercancel.do?page=${totalPage}" />">&gt;&gt;</a>
			</c:if>
		</div>
</body>
<script type="text/javascript"></script>
</html>