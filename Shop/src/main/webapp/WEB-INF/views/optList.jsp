<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<c:url value='/resources/css/table.css' />" rel="stylesheet">
</head>
<body>
<%@ include file="./includes/myheader.jsp" %>
	<h2>옵션 목록</h2>
		<table>
			<thead>
				<tr>
					<th>옵션 번호</th>
					<th>옵션 이름</th>
					<th>옵션 재고</th>
					<th>옵션 가격</th>
					<th>옵션 삭제</th>
				</tr>
			</thead>
			<c:forEach items="${opt}" var="opt">
				<tbody>
					<tr>
						<td>${opt.optNo}</td>	
						<td>${opt.optName}</td>								
		                <td>${opt.optStock}</td>
						<td>${opt.optSalePrice}</td>
						<td>
							<form action="<c:url value='/opt/optDelete.do'/>">
								<input type="hidden" value="${opt.optNo}" name="optNo">
								<input type="submit" value="옵션 삭제" class="btn">
							</form>
						</td>
			    	</tr>                                    
				</tbody>
			</c:forEach>
		</table>
		<div class="paging">
			<f:parseNumber integerOnly="true" var="pageGroup" value="${(currentPage - 1) / 10}" />
				<c:set var="startPage" value="${(pageGroup * 10 + 1)}"></c:set>
				<c:set var="endPage" value="${(startPage + (10 - 1))}"></c:set>
				<c:if test="${currentPage > 1}">
					<a class="first" href="<c:url value="/opt/optList.do?page=1" />">&lt;&lt;</a>
					<a class="prev" href="<c:url value="/opt/optList.do?page=${currentPage-1}" />">&lt;</a>
				</c:if>
				<c:forEach begin="${startPage}" end="${endPage > totalPage ? totalPage : endPage}" var="pageNum">
					<c:choose>
						<c:when test="${currentPage == pageNum}">
							<a>${pageNum}</a>
						</c:when>
						<c:otherwise>
							<a href="<c:url value="/opt/optList.do?page=${pageNum}" />">${pageNum}</a>
						</c:otherwise>
					</c:choose>
			</c:forEach>
			<c:if test="${currentPage < totalPage}">
				<a class="next" href="<c:url value="/opt/optList.do?page=${currentPage+1}" />">&gt;</a>
				<a class="last" href="<c:url value="/opt/optList.do?page=${totalPage}" />">&gt;&gt;</a>
			</c:if>
		</div>
</body>
</html>