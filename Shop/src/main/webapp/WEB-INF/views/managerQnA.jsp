<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<c:url value='/resources/css/manager.css' />" rel="stylesheet">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<%@ include file="./includes/myheader.jsp" %>
	<div>상품 QnA 목록</div>
	<table border="1">
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
					<td>${question.itemCategory}</td>
					<td>${question.questionTitle}</td>
					<td>${question.questionCreateDate}</td>
				</tr>
			</tbody>
		</c:forEach>			
	</table>
	
</body>
</html>