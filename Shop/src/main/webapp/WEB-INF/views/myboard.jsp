<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<c:url value='../resources/css/myboard.css' />" rel="stylesheet">
</head>
<body>
<%@ include file="./includes/myheader.jsp" %>
	<div id="mycontainer">
        <div id="contents">
            <div id="mytitle">
                <h2>게시물 관리</h2>
            </div>
            <div id="data">
                <div id="cho">
                    <p> My question </p>
                </div>
                <div id="table">
                    <table border="1"  id="tables">
                        <caption> 게시물 관리 목록</caption>
                        <colgroup class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
                            <col style="width:70px;">
                            <col style="width:auto;">
                            <col style="width:12rem;">
                            <col style="width:10rem;">
                        </colgroup>
                        <thead>
	                        <tr>
	                            <th scope="col">번호</th>
	                            <th scope="col">제목</th>
	                            <th scope="col">작성자</th>
	                            <th scope="col">작성일</th>
	                        </tr>
                        </thead>
                        <tbody class="displaynoned center">
	                       <c:forEach items="${myquestion}" var="my">
		                       		<tr class="">
		                                <td style="text-align: center">${my.questionNo}</td>
		                              <c:if test="${my.itemCategory == 1}">
		                                	<td>
			                                    <a href="<c:url value="/computer/computer.do/${my.computerNo}"/>" class="txtEm">${my.questionTitle}</a>
			                                </td>
		                                </c:if>
		                                 <c:if test="${my.itemCategory == 2}">
		                                	<td>
			                                    <a href="<c:url value="/peripheral/peripheral.do/${my.peripheralNo}"/>" class="txtEm">${my.questionTitle}</a>
			                                </td>
		                                </c:if>
		                                <td class="left subject" style="text-align: center">${my.questionUser}</td>
		                                <td style="text-align: center">${my.questionCreateDate}</td>
	                           		</tr>
	                        </c:forEach>
                        </tbody>
                         <c:if test="${empty myquestion}">
                    		<p class="message0 ">게시물이 없습니다.</p>
                    	</c:if>
                    </table>
                    <div id="page">
	                    <f:parseNumber integerOnly="true" var="pageGroup" value="${(currentPage - 1) / 10}" />
						<c:set var="startPage" value="${(pageGroup * 10 + 1)}"></c:set>
						<c:set var="endPage" value="${(startPage + (10 - 1))}"></c:set>
							<c:if test="${currentPage > 1}">
								<a class="first" href="<c:url value="/user/myboard.do?email=${email}&page=1" />">&lt;&lt;</a>
								<a class="prev" href="<c:url value="/user/myboard.do?email=${email}&page=${currentPage-1}" />">&lt;</a>
							</c:if>
						<c:forEach begin="${startPage}" end="${endPage > totalPage ? totalPage : endPage}" var="pageNum">
							<c:choose>
								<c:when test="${currentPage == pageNum}">
									<a id="page">${pageNum}</a>
								</c:when>
								<c:otherwise>
									<a href="<c:url value="/user/myboard.do?email=${email}&page=${pageNum}" />">${pageNum}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${currentPage < totalPage}">
							<a class="next" href="<c:url value="/user/myboard.do?email=${email}&page=${currentPage+1}" />">&gt;</a>
							<a class="last" href="<c:url value="/user/myboard.do?email=${email}&page=${totalPage}" />">&gt;&gt;</a>
						</c:if>
					</div>
                   <p id="myreview"> My Review </p>
                    <table border="1" id="tables">
                        <caption> 게시물 관리 목록</caption>
                        <colgroup class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
                            <col style="width:70px;">
                            <col style="width:auto;">
                            <col style="width:12rem;">
                            <col style="width:10rem;">
                        </colgroup>
                        <thead>
                        	<tr>
	                            <th scope="col">번호</th>
	                            <th scope="col">제목</th>
	                            <th scope="col">작성자</th>
	                            <th scope="col">작성일</th>
                            </tr>
                        </thead>
                        <tbody class="displaynoned center">
	                       <c:forEach items="${myreview}" var="mr">
	                        		<tr class="">
		                                <td style="text-align: center">${mr.reviewNo}</td>
		                                <c:if test="${mr.itemCategory == 1}">
		                                	<td>
			                                    <a href="<c:url value="/computer/computer.do/${mr.computerNo}"/>" class="txtEm">${mr.reviewBody}</a>
			                                </td>
		                                </c:if>
		                                <c:if test="${mr.itemCategory == 2}">
		                                	<td>
			                                    <a href="<c:url value="/peripheral/peripheral.do/${mr.peripheralNo}"/>" class="txtEm">${mr.reviewBody}</a>
			                                </td>
		                                </c:if>
		                                <td style="text-align: center">${mr.reviewUser}</td>
		                                <td style="text-align: center">
		                                    <span class="txtNum">${mr.reviewCreateDate}</span>
		                                </td>
		                            </tr>
	                        </c:forEach>
                        </tbody>
                        <c:if test="${empty myreview}">
                   			<p class="message0 ">게시물이 없습니다.</p>
                   		</c:if>
                    </table>
                    <div id="page1">
	                    <f:parseNumber integerOnly="true" var="pageGroup1" value="${(currentPage2 - 1) / 10}" />
						<c:set var="startPage1" value="${(pageGroup1 * 10 + 1)}"></c:set>
						<c:set var="endPage1" value="${(startPage1 + (10 - 1))}"></c:set>
							<c:if test="${currentPage2 > 1}">
								<a class="first" href="<c:url value="/user/myboard.do?email=${email2}&page2=1" />">&lt;&lt;</a>
								<a class="prev" href="<c:url value="/user/myboard.do?email=${email2}&page2=${currentPage2-1}" />">&lt;</a>
							</c:if>
						<c:forEach begin="${startPage1}" end="${endPage1 > totalPage2 ? totalPage2 : endPage1}" var="pageNum2">
							<c:choose>
								<c:when test="${currentPage2 == pageNum2}">
									<a id="page">${pageNum2}</a>
								</c:when>
								<c:otherwise>
									<a href="<c:url value="/user/myboard.do?email=${email2}&page2=${pageNum2}" />">${pageNum2}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${currentPage2 < totalPage2}">
							<a class="next" href="<c:url value="/user/myboard.do?email=${email2}&page2=${currentPage2+1}" />">&gt;</a>
							<a class="last" href="<c:url value="/user/myboard.do?email=${email2}&page2=${totalPage2}" />">&gt;&gt;</a>
						</c:if>
					</div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>