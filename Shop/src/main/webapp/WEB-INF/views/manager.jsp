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
		<div class="container">
        <div class="header">MANAGER</div>
        <div class="sub-header">등록된 상품</div>
        <ul class="menu-list">
            <li class="menu-item"><a href="<c:url value="/peripheral/peripheralwrite.do"/>">상품등록</a></li>
            <li class="menu-item"><a href="<c:url value="/question/managerQnA.do"/>">Q&A 목록</a></li>
            <li class="menu-item"><a href="<c:url value="/user/blacklist.do"/>">유저 관리</a></li>
            <li class="menu-item"><a href="<c:url value="/ask/managerAsk.do"/>">주문 목록</a></li>
            <li class="menu-item"><a href="#">취소/교환</a></li>
            <li class="menu-item"><a>배송 관리</a></li>
        </ul>
    </div>

</body>
</html>