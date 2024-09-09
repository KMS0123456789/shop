<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<link href="<c:url value='/resources/css/table.css' />" rel="stylesheet">
</head>
<body>
<%@ include file="./includes/myheader.jsp" %>
	<h2>상품 QnA 목록</h2>	
	    <table>
	        <thead>
	            <tr>
	                <th>QnA번호</th>
	                <th>Email</th>
	                <th>카테고리</th>
	                <th>제목</th>
	                <th>작성일</th>
	            </tr>
	        </thead>
	        <c:forEach items="${question}" var="question" >
	        <tbody>
	           		<tr>
						<td>${question.questionNo}</td>
						<td>${question.questionUser}</td>
						<td>
						<c:choose>
							<c:when test="${question.itemCategory ==1}">
								컴퓨터
							</c:when>
							<c:when test="${question.itemCategory ==2}">
								마우스
							</c:when>
							<c:when test="${question.itemCategory ==3}">
								키보드
							</c:when>
							<c:when test="${question.itemCategory ==4}">
								모니터
							</c:when>
						</c:choose>
						</td>		
						<td><a href='<c:url value="/question/questionPost.do/${question.questionNo}"/>'>${question.questionTitle}</a></td>
						<td>${question.questionCreateDate}</td>
					</tr>
			</tbody>	
	</c:forEach>    
</table>		
		    
		<div class="paging">
	           <f:parseNumber integerOnly="true" var="pageGroup" value="${(currentPage - 1) / 10}" />
				<c:set var="startPage" value="${(pageGroup * 10 + 1)}"></c:set>
				<c:set var="endPage" value="${(startPage + (10 - 1))}"></c:set>
			<c:if test="${currentPage > 1}">
					<a class="first" href="<c:url value="/question/managerQnA.do?page=1" />">&lt;&lt;</a>
					<a class="prev" href="<c:url value="/question/managerQnA.do?page=${currentPage-1}" />">&lt;</a>
			</c:if>
			<c:forEach begin="${startPage}" end="${endPage > totalPage ? totalPage : endPage}" var="pageNum">
				<c:choose>
					<c:when test="${currentPage == pageNum}">
						<a>${pageNum}</a>
					</c:when>
					<c:otherwise>
						<a href="<c:url value="/question/managerQnA.do?page=${pageNum}" />">${pageNum}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${currentPage < totalPage}">
				<a class="next" href="<c:url value="/question/managerQnA.do?page=${currentPage+1}" />">&gt;</a>
				<a class="last" href="<c:url value="/question/managerQnA.do?page=${totalPage}" />">&gt;&gt;</a>
			</c:if>
		</div>
</body>
</html>