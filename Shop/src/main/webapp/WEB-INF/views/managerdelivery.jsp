<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<c:url value='/resources/css/table.css' />" rel="stylesheet">
</head>
<body>
<%@ include file="./includes/myheader.jsp" %>
		<h2>배송 관리 페이지</h2>
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
					<c:forEach items="${ask}" var="ask">
						<c:if test="${askStateFlag== 0}">
							<tbody>
								<tr>
									<td>${ask.askNo}</td>
									<c:choose>
										<c:when test="${ask.askStateFlag == 1}">
											<td>배송중</td>
										</c:when>
										<c:when test="${ask.askStateFlag == 2 }">
											<td>배송완료</td>
										</c:when>
									</c:choose>						
		                           	<td>${ask.askDate}</td>
		                            <td>상품 이미지</td>
		                            <td>1</td>
		                            <td>1</td>
		                            <td>판매가</td>                                                        
								</tr>
							</tbody>
						</c:if>
					</c:forEach>
				</table>
</body>
</html>