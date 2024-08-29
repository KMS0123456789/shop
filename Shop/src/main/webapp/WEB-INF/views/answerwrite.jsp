<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<c:url value='/resources/css/write.css'/>" rel="stylesheet">
</head>
<body>
<%@ include file="./includes/myheader.jsp" %>
        <div class="container">
		    <h1>게시글 작성</h1>
        <form action="answerwrite.do" method="post" enctype="multipart/form-data">
        <input type="hidden" name="questionNo" value="${questionNo}">
		        <div class="form-group">
		            <label for="answerBody">본문</label>
		            <textarea id="body" name="answerBody"></textarea>
		        </div>
		        <div class="footer">
		            <button type="submit" class="button">작성하기</button>
		            <a onclick="history.back()" class="button">취소</a>
		        </div>
		    </form>
		</div>
</body>
</html>