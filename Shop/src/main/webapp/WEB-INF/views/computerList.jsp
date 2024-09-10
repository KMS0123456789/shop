<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<c:url value='/resources/css/table.css' />" rel="stylesheet">
</head>
<body>
<%@ include file="./includes/myheader.jsp" %>
	<h2>컴퓨터 게시글 목록</h2>
		<table>
			<thead>
				<tr>
					<th>컴퓨터 번호</th>
					<th>컴퓨터 이름</th>
					<th>컴퓨터 이미지</th>
					<th>컴퓨터 재고</th>
					<th>컴퓨터 가격</th>
					<th>컴퓨터 게시글 삭제</th>
				</tr>
			</thead>
			<c:forEach items="${computer}" var="computer">
				<tbody>
					<tr>
						<td>${computer.computerNo}</td>	
						<td>${computer.computerTitle}</td>
						<c:forEach items="${computer.files}"  var="file">
							<td>
								<a href='<c:url value="/computer/computer.do/${computer.computerNo}"/>'><img class="image" src="<c:url value='${file.filePath}'/>" style="width:50px;">
							</td>
						</c:forEach>								
		                <td>${computer.computerStock}</td>
						<td>${computer.computerSalePrice}</td>
						<td>
							<form action="<c:url value='/computer/computerDelete.do'/>">
								<input type="hidden" value="${computer.computerNo}" name="computerNo">
								<input type="submit" value="컴퓨터 게시글 삭제" class="btn">
							</form>
						</td>
			    	</tr>                                    
				</tbody>
			</c:forEach>
		</table>
		<div class="paging">
			<f:parseNumber integerOnly="true" var="pageGroup" value="${(currentPage - 1) / 10}" />
				<c:set var="startPage" value="${(pageGroup * 10 + 1)}"></c:set>
				<c:set var="endPage" value="${(startPage + (10 - 1))}"></c:set>
				<c:if test="${currentPage > 1}">
					<a class="first" href="<c:url value="/computer/computerList.do?page=1" />">&lt;&lt;</a>
					<a class="prev" href="<c:url value="/computer/computerList.do?page=${currentPage-1}" />">&lt;</a>
				</c:if>
				<c:forEach begin="${startPage}" end="${endPage > totalPage ? totalPage : endPage}" var="pageNum">
					<c:choose>
						<c:when test="${currentPage == pageNum}">
							<a>${pageNum}</a>
						</c:when>
						<c:otherwise>
							<a href="<c:url value="/computer/computerList.do?page=${pageNum}" />">${pageNum}</a>
						</c:otherwise>
					</c:choose>
			</c:forEach>
			<c:if test="${currentPage < totalPage}">
				<a class="next" href="<c:url value="/computer/computerList.do?page=${currentPage+1}" />">&gt;</a>
				<a class="last" href="<c:url value="/computer/computerList.do?page=${totalPage}" />">&gt;&gt;</a>
			</c:if>
		</div>
</body>
</html>