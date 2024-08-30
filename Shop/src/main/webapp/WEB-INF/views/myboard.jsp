<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <table border="1">
                        <caption> 게시물 관리 목록</caption>
                        <colgroup class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
                            <col style="width:70px;">
                            <col style="width:auto;">
                            <col style="width:12rem;">
                            <col style="width:10rem;">
                        </colgroup>
                        <thead><tr>
                            <th scope="col">번호</th>
                            <th scope="col">제목</th>
                            <th scope="col">작성자</th>
                            <th scope="col">작성일</th>
                            </tr>
                        </thead>
                        <tbody class="displaynoned center">
	                       <c:forEach items="${my}" var="my">
		                       	<c:forEach items="${my.questions}" var="question">
		                       		<tr class="">
		                                <td style="text-align: center">${question.questionNo}</td>
		                                <td>
		                                    <a href="" class="txtEm">${question.questionTitle}</a>
		                                </td>
		                                <td class="left subject" style="text-align: center">${question.questionUser}</td>
		                                <td style="text-align: center">${question.questionCreateDate}</td>
	                           		</tr>
		                       	</c:forEach>
	                        </c:forEach>
                        </tbody>
                    </table>
                     <p id="myreview"> My Review </p>
                    <table border="1">
                        <caption> 게시물 관리 목록</caption>
                        <colgroup class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
                            <col style="width:70px;">
                            <col style="width:auto;">
                            <col style="width:12rem;">
                            <col style="width:10rem;">
                        </colgroup>
                        <thead><tr>
                            <th scope="col">번호</th>
                            <th scope="col">제목</th>
                            <th scope="col">작성자</th>
                            <th scope="col">작성일</th>
                            </tr>
                        </thead>
                        <tbody class="displaynoned center">
	                       <c:forEach items="${myreview}" var="mr">
	                        	<c:forEach items="${mr.reviews}" var="my">
	                        		<tr class="">
		                                <td style="text-align: center">${my.reviewNo}</td>
		                                <td>
		                                    <a href="" class="txtEm">${my.reviewBody}</a>
		                                </td>
		                                <td style="text-align: center">${my.reviewUser}</td>
		                                <td style="text-align: center">
		                                    <span class="txtNum">${my.reviewCreateDate}</span>
		                                </td>
		                            </tr>
	                        	</c:forEach>
	                        </c:forEach>
                        </tbody>
                    </table>
                    <c:if test="${empty my}">
                    	<p class="message0 ">게시물이 없습니다.</p>
                    </c:if>
                </div>
            </div>
            <form id="boardSearchForm" name="" action="" method="get" target="" enctype="multipart/form-data">
                <input id="board_no" name="board_no" value="" type="hidden">
                <input id="page" name="page" value="1" type="hidden">
                <input id="board_sort" name="board_sort" value="" type="hidden">
                <div class="field">
                    <fieldset class="boardSearch">
                        <legend>게시물 검색</legend>
                        <p>
                            <select id="search_key" name="search_key" fw-filter="" fw-label="" fw-msg="">
                                <option value="subject">제목</option>
                                <option value="content">내용</option>
                                <option value="member_id">아이디</option>
                            </select>
                            <input id="search" name="search" fw-filter="" fw-label="" fw-msg="" class="inputTypeText" placeholder="" value="" type="text">
                            <a href="#" class="btnEmFix">찾기</a>
                        </p>
                    </fieldset>
                </div>
            </form>
        </div>
    </div>
</body>
</html>