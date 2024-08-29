<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<c:url value='/resources/css/questionpost.css'/>" rel="stylesheet">
</head>
<body>
<%@ include file="./includes/myheader.jsp" %>
    <div class="container">
    	<h1 class="underline">제목:${vo.questionTitle}</h1>
    	<dl class="post-details">
		       <dt>작성자:${vo.questionUser}</dt>
		       		<dd></dd>
		 </dl>    	
    <div class="post-content">
    	${vo.questionBody}
    </div>
    <div>
	    	<div class="button-group">
		    	<form action="<c:url value="/answer/answerwrite.do"></c:url>" >
		    		<input type="hidden" value="${vo.questionNo}" name="questionNo">
					<button type="submit" class="button">답변하기</button>	
		    	</form>
	       	</div>
				<a onclick="history.back()" class="button">취소</a>  
    </div>
</div>
    
</body>
</html>