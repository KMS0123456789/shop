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
        }
	</style>
</head>
<body>
	<header>
        <h2 id="main"><a href="#">커스텀PC Shop</a></h2>
        <nav id="menu">    
            <ul id="menu">
                <li><a href="<c:url value='/peripheral/keyboard.do'/>">키보드</a></li>
                <li><a href="<c:url value='/peripheral/mouse.do'/>">마우스</a></li>
                <li><a href="<c:url value='/peripheral/monitor.do'/>">모니터</a></li>
                <li><a href="<c:url value='/computer/computer.do'/>">컴퓨터</a></li>
            </ul>
        </nav>
            <ul id="menu2">
                <li><a href="<c:url value='/user/mypage.do'/>">마이페이지</a></li>
                <li><a href="#">장바구니</a></li>
                <li><a href="<c:url value='/user/logout.do'/>">로그아웃</a></li>
            </ul>
    </header>
</body>
</html>