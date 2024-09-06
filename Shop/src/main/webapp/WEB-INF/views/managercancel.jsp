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
	<h2>주문 취소 목록</h2>
		<table>
			<thead>
				<tr>
					<th>주문 번호</th>
					<th>처리 상태</th>
					<th>주문 일자</th>
					<th>상품 이미지</th>
					<th>상품 명</th>
					<th>옵션 명</th>
					<th>판매가</th>
				</tr>
			</thead>					
		</table>
</body>
<script type="text/javascript"></script>
</html>