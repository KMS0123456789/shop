<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <title>Confirmation</title>
</head>
<body>
	<a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=91452e14d92a8c67875cd1e2ec08fdd2
	&redirect_uri=http://localhost:8080/shop/user/kakao/callback">
	<img height="50px" src="${pageContext.request.contextPath}/resources/image/kakaoLogin.png"/></a>
</body>
</html>