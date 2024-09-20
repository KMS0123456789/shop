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
        
        .search-box{
        	height: 30px;
        	width: 300px;
        	background: white;
        	border-radius: 40px;
        	padding: 10px;
        	border: 1px solid black;
        }
        .search-text{
        	border: none;
        	background: none;
        	outline: none;
        	float: left;
        	padding: 0px;
        	color: #797979;
        	font-size: 16px;
        	line-height: 30px;
        	width: 200px;
        }
        .search-btn{
        	color: #f9deec;
        	float: right;
        	width: 40px;
        	height: 100%;
        	border-radius: 50%;
        	background: white;
        	font-size: 16px;
        	display: flex;
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
            	<c:if test="${sessionScope.user.email != null and sessionScope.user.userType == 0}">
                	<li><a href="<c:url value='/user/manager.do'/>">관리자 페이지</a></li>
					<li><a href="<c:url value='/user/logout.do'/>">로그아웃</a></li>
                </c:if>
            	<c:if test="${sessionScope.user.email != null and sessionScope.user.userType == 1}">
	                <li>
	                	<form action="<c:url value='/user/mypage.do'/>" method="post">
	                		<input type="hidden" value="${sessionScope.user.email}" name="email">
	                 		<button type="submit">마이페이지</button>
	                	</form>
	               </li>
	                <li><a href="<c:url value="/cart/view.do"/>">장바구니</a></li>
	                <li><a href="<c:url value='/user/logout.do'/>">로그아웃</a></li>
                </c:if>
                <c:if test="${sessionScope.user.email != null and sessionScope.user.userType == 4}">
	                <li><a href="<c:url value='/user/manager.do'/>">관리자 페이지</a></li>
	                <li>
	                	<form action="<c:url value='/user/mypage.do'/>" method="post">
	                		<input type="hidden" value="${sessionScope.user.email}" name="email">
	                 		<button type="submit">마이페이지</button>
	                	</form>
	               </li>
	                <li><a href="<c:url value="/cart/view.do"/>">장바구니</a></li>
	                <li><a href="<c:url value='/user/logout.do'/>">로그아웃</a></li>
                </c:if>
                <c:if test="${sessionScope.user.email == null }">
                	<li><a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=91452e14d92a8c67875cd1e2ec08fdd2
	&redirect_uri=http://jjezen.cafe24.com/custompcshop/user/kakao/callback.do">로그인</a></li>
                </c:if>
            </ul>
    </header>
    <div class="search">
		<form action="<c:url value="/computer/search.do" />" method="get" class="search-box">
		    <div class="inform">
		        <input type="text" name="keyword" value="${param.keyword}" class="search-text">
		        <button type="submit" class="search-btn"><img src="../resources/image/btn_search.png"></button>
		    </div>
	    </form>
	</div>
</body>
</html>