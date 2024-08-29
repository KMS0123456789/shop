<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style>
		@import url('https://fonts.googleapis.com/css2?family=Gowun+Batang&family=Noto+Serif+KR:wght@200..900&display=swap');
		body{
            margin-top: 0px;
            margin-left: 10rem;
            margin-right: 10rem;
            min-width: 1220px;
        }
        header{
            margin-top: 20px;
            margin-bottom: 5rem;
        }
        li a{
            text-decoration: none;
        }
        #meun,#menu2{
            display: inline-block;
        }
        #main a{
            text-decoration: none;
             font-size: 19.5px;
        }
        #main{
            display: inline-block;
        }
        #menu li{
            list-style: none;
            display: inline-block;
            margin-left: 1rem;
        }
        #menu2{
            float: right;
            list-style: none;
            padding-top: 10px;
        }
        #menu2 li{
            display: inline-block;
            margin-left: 1rem;
        }
        #menu{
            display: inline-block;
        }
        a{
            color: black;
            font-family: "Noto Serif KR", serif;
            font-optical-sizing: auto;
            font-style: normal;
            font-size: 13px;
        }
        
        button{
        	border: none;
        	color: black;
            font-family: "Noto Serif KR", serif;
            font-optical-sizing: auto;
            font-style: normal;
            background: none;
            font-size: 13px;
            cursor: pointer;
        }
        #h1{
        	text-align: center;
        }
	</style>
</head>
<body>
	<header>
        <h2 id="main">
        	<a href="<c:url value="/"/>" style=" font-family: 'Noto Serif KR', serif; ">커스텀PC Shop</a>
        </h2>  
            <ul id="menu">
                <li><a href="<c:url value='/peripheral/keyboard.do'/>">키보드</a></li>
                <li><a href="<c:url value='/peripheral/mouse.do'/>">마우스</a></li>
                <li><a href="<c:url value='/peripheral/monitor.do'/>">모니터</a></li>
                <li><a href="<c:url value='/computer/computer.do'/>">컴퓨터</a></li>
            </ul>
            <ul id="menu2">
            	<c:if test="${sessionScope.user.email != null }">
	                <li>
	                	<form action="<c:url value='/user/mypage.do'/>" method="post">
	                		<input type="hidden" value="${sessionScope.user.email}" name="email">
	                 		<button type="submit">마이페이지</button>
	                	</form>
	               </li>
	                <li><a href="#">장바구니</a></li>
	                <li><a href="<c:url value='/user/logout.do'/>">로그아웃</a></li>
                </c:if>
                <c:if test="${sessionScope.user.email == null }">
                	<li><a href="<c:url value='/user/login.do'/>">로그인</a></li>
                </c:if>
            </ul>
    </header>
    <h1 id="h1">커스텀PC Shop</h1>
</body>
</html>