<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<c:url value='/resources/css/manager1.css' />" rel="stylesheet">
<link href="<c:url value='/resources/css/manager.css' />" rel="stylesheet">
</head>
<body>
<%@ include file="./includes/myheader.jsp" %>
	<div class="container">
		<div id="menu-list">
			<div class="header">
				<h3 id="h3">MANAGER</h3>
				<h5 id="h5">등록된 상품</h5>
			</div>
			<ul class="menu-list">
				<li class="menu-item"><a href="<c:url value="/computer/computerwrite.do"/>">컴퓨터등록</a></li>
				<li class="menu-item"><a href="<c:url value="/peripheral/peripheralwrite.do"/>">주변기기등록</a></li>
				<li class="menu-item"><a href="<c:url value="/opt/optionwrite.do"/>">옵션등록</a></li>
				<li class="menu-item"><a href="<c:url value="/question/managerQnA.do"/>">Q&A 목록</a></li>
				<li class="menu-item"><a href="<c:url value="/user/blacklist.do"/>">유저 관리</a></li>
				<li class="menu-item"><a href="<c:url value="/askdetail/managerAsk.do"/>">주문 목록</a></li>
				<li class="menu-item"><a href="<c:url value="/askdetail/managercancel.do"/>">취소/교환</a></li>
				<li class="menu-item"><a href="<c:url value="/askdetail/managerdelivery.do"/>">배송 관리</a></li>
			</ul>
		</div>
		<table>
			<colgroup>
				<col style="width:150px;">
	            <col style="width:150px;">
	            <col style="width:350px;">
	            <col style="width:150px;">
            </colgroup>
			<thead>
				<tr>
					<th>상품번호</th>
					<th>상품이미지</th>
					<th>상품 이름</th>
					<th>판매가</th>
					<th>등록일</th>
				</tr>
			</thead>   		 	
			<tbody>
				<c:forEach items="${computer}" var="computer">
					<c:forEach items="${computer.files}" var="file">
						<tr>		   		 			
							<td>${computer.computerNo}</td>
							<td><a href='<c:url value="/computer/computer.do/${computer.computerNo}"/>'><img class="image" src="<c:url value='${file.filePath}'/>" style="width:55px;"></td>
							<td><a href='<c:url value="/computer/computer.do/${computer.computerNo}"/>'>${computer.computerTitle}</td>
							<td><f:formatNumber value="${computer.computerSalePrice}" type="number" pattern="#,###"/>원</td>
							<td>${computer.computerCreateDate}</td>
						</tr>
					</c:forEach>
				</c:forEach>
			</tbody>
		</table>
		<div id="page2">
		<f:parseNumber integerOnly="true" var="pageGroup1" value="${(currentPage2 - 1) / 10}" />
		<c:set var="startPage1" value="${(pageGroup1 * 10 + 1)}"></c:set>
		<c:set var="endPage1" value="${(startPage1 + (10 - 1))}"></c:set>
		<c:if test="${currentPage2 > 1}">
			<a class="first" href="<c:url value="/user/manager.do?page2=1" />">&lt;&lt;</a>
			<a class="prev" href="<c:url value="/user/manager.do?page2=${currentPage2-1}" />">&lt;</a>
		</c:if>
		<c:forEach begin="${startPage1}" end="${endPage1 > totalPage2 ? totalPage2 : endPage1}" var="pageNum2">
			<c:choose>
				<c:when test="${currentPage2 == pageNum2}">
					<a id="page">${pageNum2}</a>
				</c:when>
				<c:otherwise>
					<a href="<c:url value="/user/manager.do?&page2=${pageNum2}" />">${pageNum2}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${currentPage2 < totalPage2}">
			<a class="next" href="<c:url value="/user/manager.do?page2=${currentPage2+1}" />">&gt;</a>
			<a class="last" href="<c:url value="/user/manager.do?page2=${totalPage2}" />">&gt;&gt;</a>
		</c:if>
	</div>
	<table>
		<colgroup>
			<col style="width:150px;">
            <col style="width:150px;">
            <col style="width:350px;">
            <col style="width:150px;">
        </colgroup>
	 	<thead>
	 		<tr>
				<th>상품번호</th>
				<th>상품이미지</th>
				<th>상품 이름</th>
				<th>판매가</th>
				<th>등록일</th>
	 		</tr>
	 	</thead>   		 	
	 	<tbody>
		<c:forEach items="${peripheral}" var="peripheral">
			<c:forEach items="${peripheral.files}" var="file">
				<tr>
					<td>${peripheral.peripheralNo}</td>
					<td><a href='<c:url value="/peripheral/peripheral.do/${peripheral.peripheralNo}"/>'><img class="image" src="<c:url value='${file.filePath}'/>" style="width:55px;"></td>
					<td><a href='<c:url value="/peripheral/peripheral.do/${peripheral.peripheralNo}"/>'>${peripheral.peripheralTitle}</td>
					<td><f:formatNumber value="${peripheral.peripheralSalePrice}" type="number" pattern="#,###"/>원</td>
					<td>${peripheral.peripheralCreateDate}</td>
				</tr>
			</c:forEach>
		</c:forEach>
		</tbody>
	 </table> 
		<div id="page">
            <f:parseNumber integerOnly="true" var="pageGroup" value="${(currentPage - 1) / 10}" />
			<c:set var="startPage" value="${(pageGroup * 10 + 1)}"></c:set>
			<c:set var="endPage" value="${(startPage + (10 - 1))}"></c:set>
			<c:if test="${currentPage > 1}">
				<a class="first" href="<c:url value="/user/manager.do?page=1" />">&lt;&lt;</a>
				<a class="prev" href="<c:url value="/user/manager.do?page=${currentPage-1}" />">&lt;</a>
			</c:if>
			<c:forEach begin="${startPage}" end="${endPage > totalPage ? totalPage : endPage}" var="pageNum">
				<c:choose>
					<c:when test="${currentPage == pageNum}">
						<a id="page">${pageNum}</a>
					</c:when>
					<c:otherwise>
						<a href="<c:url value="/user/manager.do?&page=${pageNum}" />">${pageNum}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${currentPage < totalPage}">
				<a class="next" href="<c:url value="/user/manager.do?page=${currentPage+1}" />">&gt;</a>
				<a class="last" href="<c:url value="/user/manager.do?page=${totalPage}" />">&gt;&gt;</a>
			</c:if>
		</div>
	</div>
</body>
</html>