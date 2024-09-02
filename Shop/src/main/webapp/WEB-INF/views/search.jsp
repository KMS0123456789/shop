<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<link href="<c:url value='/resources/css/list.css' />" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	</head>
	<body>
		<div class="wrap">
			<%@ include file="./includes/computerheader.jsp" %>
			<section id="container" class="subpage">
				<div class="contents">
					<div style="text-align: center; position: relative; display: none; margin-bottom: 80px;"></div>
					<h2>검색 결과</h2>
					<div class="category-product">
						<div class="product-box" style="padding-top: 0 !important;">
							<div class="box">
								<div class="item-wrap">
									<ul class="item rows admSortTable">
										<c:forEach items="${search}" var="search">
											<c:if test="${search.searchFlag == 1}">
												<li>
													<div class="item-image"><a href='<c:url value="/computer/computer.do/${search.searchNo}"/>'><img class="image" src="<c:url value='${search.searchFilePath}'/>"></a></div>
													<div class="item-content">
														<div class="subject"><a href='<c:url value="/computerl/computer.do/${search.searchNo}"/>'>${search.searchTitle}</a></div>
													</div>
													<div class="info">
														<div class="pull-left">
															<span>${search.searchPrice}</span>
														</div>
													</div>
												</li>
											</c:if>
											<c:if test="${search.searchFlag == 2}">
												<li>
													<div class="item-image"><a href='<c:url value="/peripheral/peripheral.do/${search.searchNo}"/>'><img class="image" src="<c:url value='${search.searchFilePath}'/>"></a></div>
													<div class="item-content">
														<div class="subject"><a href='<c:url value="/peripheral/peripheral.do/${search.searchNo}"/>'>${search.searchTitle}</a></div>
													</div>
													<div class="info">
														<div class="pull-left">
															<span>${search.searchPrice}</span>
														</div>
													</div>
												</li>
											</c:if>
										</c:forEach>
									</ul>
									<div class="paging">
							            <f:parseNumber integerOnly="true" var="pageGroup" value="${(currentPage - 1) / 10}" />
											<c:set var="startPage" value="${(pageGroup * 10 + 1)}"></c:set>
											<c:set var="endPage" value="${(startPage + (10 - 1))}"></c:set>
							
										<c:if test="${currentPage > 1}">
												<a class="first" href="<c:url value="/computer/search.do?keyword=${param.keyword}&page=1" />">&lt;&lt;</a>
												<a class="prev" href="<c:url value="/computer/search.do?keyword=${param.keyword}&page=${currentPage-1}" />">&lt;</a>
										</c:if>
										<c:forEach begin="${startPage}" end="${endPage > totalPage ? totalPage : endPage}" var="pageNum">
											<c:choose>
												<c:when test="${currentPage == pageNum}">
													<a>${pageNum}</a>
												</c:when>
												<c:otherwise>
													<a href="<c:url value="/computer/search.do?keyword=${param.keyword}&page=${pageNum}" />">${pageNum}</a>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<c:if test="${currentPage < totalPage}">
											<a class="next" href="<c:url value="/computer/search.do?keyword=${param.keyword}&page=${currentPage+1}" />">&gt;</a>
											<a class="last" href="<c:url value="/computer/search.do?keyword=${param.keyword}&page=${totalPage}" />">&gt;&gt;</a>
										</c:if>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="right" id="right">
					<div class='history_box'>
						<ul class='history_list' id='history'>
						
						</ul>
					</div>
				</div>
			</section>
		</div>
	</body>
	<script>	
		let watchList = window.localStorage.getItem('watchList');
		watchList = JSON.parse(watchList);
		if (watchList.length >= 5) {
			watchList.length = 5; 
		}
		
		let history = "";
		
		for(let i = 0; i < watchList.length; i++){
			if(watchList[i].flag === 1){
				history += "<li>"
					history += "<a href='<c:url value='/computer/computer.do/'/>"+watchList[i].no+"'>"+"<img class='last_image' src='<c:url value='/'/>"+watchList[i].path+"'>"+"</a>"
				history += "</li>"
			}
			else if(watchList[i].flag === 2){
				history += "<li>"
					history += "<a href='<c:url value='/peripheral/peripheral.do/'/>"+watchList[i].no+"'>"+"<img class='last_image' src='<c:url value='/'/>"+watchList[i].path+"'>"+"</a>"
				history += "</li>"	
			}
			
		}
		$("#history").append(history);
	</script>
</html>