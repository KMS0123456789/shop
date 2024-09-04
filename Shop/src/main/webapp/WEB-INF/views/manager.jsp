<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<c:url value='/resources/css/manager1.css' />" rel="stylesheet">
<link href="<c:url value='/resources/css/table.css' />" rel="stylesheet">
</head>
<body>
<%@ include file="./includes/myheader.jsp" %>
		<div class="container">
	        <div class="header">MANAGER</div>
	        <div class="sub-header">등록된 상품</div>
		        <ul class="menu-list">
		        	<li class="menu-item"><a href="<c:url value="/computer/computerwrite.do"/>">컴퓨터등록</a></li>
		            <li class="menu-item"><a href="<c:url value="/peripheral/peripheralwrite.do"/>">주변기기등록</a></li>
		            <li class="menu-item"><a href="<c:url value="/question/managerQnA.do"/>">Q&A 목록</a></li>
		            <li class="menu-item"><a href="<c:url value="/user/blacklist.do"/>">유저 관리</a></li>
		            <li class="menu-item"><a href="<c:url value="/ask/managerAsk.do"/>">주문 목록</a></li>
		            <li class="menu-item"><a href="<c:url value="/ask/managercancel.do"/>">취소/교환</a></li>
		            <li class="menu-item"><a href="<c:url value="/ask/managerdelivery.do"/>">배송 관리</a></li>
		        </ul>
   	<%-- 	 </div>
   		 <table>
   		 	<thead>
   		 		<tr>
  					<th>상품번호</th>
  					<th>상품이미지</th>
  					<th>판매 상태</th>
  					<th>판매가</th>
  					<th>등록일</th>
   		 		</tr>
   		 	</thead>
		   		 	<tbody>
		   		 		<tr>
		   		 			<c:forEach items="${computer}" var="computer">
							<c:forEach items="${computer.files}" var="file">
										<td>${computer.computerNo}</td>
										<td><img class="image" src="<c:url value='${file.filePath}'/>"></td>
										<td>${computer.computerTitle}</td>
										<td>${computer.computerSalePrice}</td>
										<td>${computer.computerCreateDate}</td>
							</c:forEach>
							</c:forEach>
						</tr>
		   		 	</tbody>
   		 </table>  	 --%>	 
</body>
</html>