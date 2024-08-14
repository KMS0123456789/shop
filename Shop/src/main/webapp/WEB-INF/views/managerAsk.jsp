<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<c:url value='/resources/css/manager.css' />" rel="stylesheet">
</head>
<body>
<%@ include file="./includes/myheader.jsp" %>
			<h2>주문 상품 목록</h2>
			<form action="<c:url value='/AskDetail/deliveryC.do' />" method="POST">
				<table border="1">
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
						<tbody>
							<tr>
								<td>${ask.askNo}</td>
								<td>
								<select>
									<option value="처리상태">처리상태</option>
		                            <option value="배송중">배송중</option>
		                            <option valeu="배송 완료">배송 완료</option>
	                            </select>
	                            </td>
	                           	<td>${ask.askDate}</td>
	                            <td>상품 이미지</td>
	                            <td>1</td>
	                            <td>1</td>
	                            <td>판매가</td>                                                        
							</tr>
						</tbody>
					</c:forEach>
					<input type="submit" value="변경완료" >
					<input type="submit" value="취소"> 
				</table>
			</form>
</body>
</html>