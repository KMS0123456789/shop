<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Document</title>
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
		<form action="<c:url value="/computer/computer.do" />" method="get" id="form">
               <div class="searchDiv">
                   <select name="searchType">
                       <option value="computer_title" ${param.searchType == 'computer_title'  ? 'selected' : ''}>제목</option>
                   </select>
                   <input type="text" name="keyword" value="${param.keyword}">
                   <input type="submit" value="검색">
               </div>
        </form>
		<div>
			광고 이미지
		</div>
		<div>
			<c:forEach items="${computer}" var="computer">
				<div>본체 이미지</div>
				<a href="<c:url value="/computer/computer.do/${computer.computerNo}"/>">${computer.computerTitle}</a>
			</c:forEach>
		</div>
		<div>
            <ul id="page">
                <f:parseNumber integerOnly="true" var="pageGroup" value="${(currentPage - 1) / 10}" />
					<c:set var="startPage" value="${(pageGroup * 10 + 1)}"></c:set>
					<c:set var="endPage" value="${(startPage + (10 - 1))}"></c:set>

				<c:if test="${currentPage > 1}">
						<li><a href="<c:url value="/computer/computer.do?page=1" />">&lt;&lt;</a></li>
						<li><a href="<c:url value="/computer/computer.do?page=${currentPage-1}" />">&lt;</a></li>
				</c:if>
				<c:forEach begin="${startPage}" end="${endPage > totalPage ? totalPage : endPage}" var="pageNum">
					<c:choose>
						<c:when test="${currentPage == pageNum}">
							<li><a>${pageNum}</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="<c:url value="/computer/computer.do?page=${pageNum}" />">${pageNum}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${currentPage < totalPage}">
					<li><a href="<c:url value="/computer/computer.do?page=${currentPage+1}" />">&gt;</a></li>
					<li><a href="<c:url value="/computer/computer.do?page=${totalPage}" />">&gt;&gt;</a></li>
				</c:if>
			</ul>
        </div>
	</body>
</html>