<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<link href="<c:url value='/resources/css/list.css' />" rel="stylesheet">
	</head>
	<body>
		<div class="wrap">
			<header id="header">
				<div class="top">
					<h1><a>컴퓨터 사이트</a></h1>
					<ul class="toplink">
						<li><a>장바구니</a></li>
						<li><a>마이페이지</a></li>
						<li><a><div class="login-btn"><span>로그인</span></div></a></li>
					</ul>
					<div class="search">
						<form action="<c:url value="/computer/computer.do" />" method="get" id="form">
						    <fieldset>
							    <div class="inform">
									<input type="hidden" name="searchType" value="computer_title" ${param.searchType == 'computer_title'  ? 'selected' : ''}>
							        <input type="text" name="keyword" value="${param.keyword}">
							        <button type="submit" class="btn-search"></button>
							    </div>
						    </fieldset>
					    </form>
					</div>
				</div>
				<nav id="gnb" class="bottom">
					<ul class="menu">
						<li><a href="<c:url value="/computer/computer.do"/>">컴퓨터</a></li>
						<li><a href="<c:url value="/peripheral/mouse.do"/>">마우스</a></li>
						<li><a href="<c:url value="/peripheral/keyboard.do"/>">키보드</a></li>
						<li><a href="<c:url value="/peripheral/monitor.do"/>">모니터</a></li>
					</ul>
				</nav>
			</header>
			<section id="container" class="subpage">
				<div class="contents">
					<div style="text-align: center; position: relative; display: none; margin-bottom: 80px;"></div>
					<h2>컴퓨터</h2>
					<div class="category-product">
						<div class="list-info-box">
							<ul class="list-sort">
								<li class="on"><a>인기 순</a></li>
								<li><a>높은 가격</a></li>
								<li><a>낮은 가격</a></li>
								<li><a>최신 순</a></li>
							</ul>
						</div>
						<div class="product-box" style="padding-top: 0 !important;">
							<div class="box">
								<div class="item-wrap">
									<ul class="item rows admSortTable">
										<c:forEach items="${computer}" var="computer">
											<li>
												<div class="item-image"><a href='<c:url value="/computer/computer.do/${computer.computerNo}"/>'><img>이미지</a></div>
												<div class="item-content">
													<div class="subject"><a href='<c:url value="/computer/computer.do/${computer.computerNo}"/>'>${computer.computerTitle}</a></div>
												</div>
												<div class="info">
													<div class="pull-left">
														<span>${computer.computerSalePrice}</span>
													</div>
												</div>
											</li>
										</c:forEach>
									</ul>
									<div class="paging">
							            <f:parseNumber integerOnly="true" var="pageGroup" value="${(currentPage - 1) / 10}" />
											<c:set var="startPage" value="${(pageGroup * 10 + 1)}"></c:set>
											<c:set var="endPage" value="${(startPage + (10 - 1))}"></c:set>
							
										<c:if test="${currentPage > 1}">
												<a class="first" href="<c:url value="/computerl/computer.do?page=1" />">&lt;&lt;</a>
												<a class="prev" href="<c:url value="/computer/computer.do?page=${currentPage-1}" />">&lt;</a>
										</c:if>
										<c:forEach begin="${startPage}" end="${endPage > totalPage ? totalPage : endPage}" var="pageNum">
											<c:choose>
												<c:when test="${currentPage == pageNum}">
													<a>${pageNum}</a>
												</c:when>
												<c:otherwise>
													<a href="<c:url value="/computer/computer.do?page=${pageNum}" />">${pageNum}</a>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<c:if test="${currentPage < totalPage}">
											<a class="next" href="<c:url value="/computer/computer.do?page=${currentPage+1}" />">&gt;</a>
											<a class="last" href="<c:url value="/computer/computer.do?page=${totalPage}" />">&gt;&gt;</a>
										</c:if>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</body>
</html>