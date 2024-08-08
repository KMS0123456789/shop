<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
</head>
<body>
	<h1>컴퓨터 사이트</h1>
	<table border="1">
		<thead>
			<tr>
				<th><a href="<c:url value='/peripheral/keyboard.do'/>">키보드</a></th>
				<th><a href="<c:url value='/peripheral/mouse.do'/>">마우스</a></th>
				<th><a href="<c:url value='/computer/computer.do'/>">컴퓨터</a></th>
				<th><a href="<c:url value='/peripheral/monitor.do'/>">모니터</a></th>
			</tr>
		</thead>
	</table>
	<div>
		광고 이미지
	</div>
	<div>
		최신 상품
	</div>
	<div>
		<img src="#">
	</div>
</body>
</html>