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
					<h2>키보드</h2>
					<div class="category-product">
						<div class="list-info-box">
							<ul class="list-sort">
								<li class="on"><a href="<c:url value='/peripheral/keyboard.do'/>">최신순</a></li>
								<li><a href="<c:url value='/peripheral/keyboardHighPrice.do'/>">높은 가격</a></li>
								<li><a href="<c:url value='/peripheral/keyboardLowPrice.do'/>">낮은 가격</a></li>
							</ul>
						</div>
						<div class="product-box" style="padding-top: 0 !important;">
							<div class="box">
								<div class="item-wrap">
									<ul class="item rows admSortTable">
										<c:forEach items="${keyboard}" var="keyboard">
											<c:forEach items="${keyboard.files}" var="file">
												<li>
													<div class="item-image"><a href='<c:url value="/peripheral/peripheral.do/${keyboard.peripheralNo}"/>'><img src="<c:url value='${file.filePath}'/>"></a></div>
													<div class="item-content">
														<div class="subject"><a href='<c:url value="/peripheral/peripheral.do/${keyboard.peripheralNo}"/>'>${keyboard.peripheralTitle}</a></div>
													</div>
													<div class="info">
														<div class="pull-left">
															<span>${keyboard.peripheralSalePrice}</span>
														</div>
													</div>
												</li>
											</c:forEach>
										</c:forEach>
									</ul>
									<div class="paging">
							            <f:parseNumber integerOnly="true" var="pageGroup" value="${(currentPage - 1) / 10}" />
											<c:set var="startPage" value="${(pageGroup * 10 + 1)}"></c:set>
											<c:set var="endPage" value="${(startPage + (10 - 1))}"></c:set>
							
										<c:if test="${currentPage > 1}">
												<a class="first" href="<c:url value="/peripheral/keyboard.do?page=1" />">&lt;&lt;</a>
												<a class="prev" href="<c:url value="/peripheral/keyboard.do?page=${currentPage-1}" />">&lt;</a>
										</c:if>
										<c:forEach begin="${startPage}" end="${endPage > totalPage ? totalPage : endPage}" var="pageNum">
											<c:choose>
												<c:when test="${currentPage == pageNum}">
													<a>${pageNum}</a>
												</c:when>
												<c:otherwise>
													<a href="<c:url value="/peripheral/keyboard.do?page=${pageNum}" />">${pageNum}</a>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<c:if test="${currentPage < totalPage}">
											<a class="next" href="<c:url value="/peripheral/keyboard.do?page=${currentPage+1}" />">&gt;</a>
											<a class="last" href="<c:url value="/peripheral/keyboard.do?page=${totalPage}" />">&gt;&gt;</a>
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
					history += "<a href='<c:url value='/computer/computer.do/'/>"+watchList[i].no+"'>"+"<img src='<c:url value='/'/>"+watchList[i].path+"'>"+"</a>"
				history += "</li>"
			}
			else if(watchList[i].flag === 2){
				history += "<li>"
					history += "<a href='<c:url value='/peripheral/peripheral.do/'/>"+watchList[i].no+"'>"+"<img src='<c:url value='/'/>"+watchList[i].path+"'>"+"</a>"
				history += "</li>"	
			}
			
		}
		$("#history").append(history);
	</script>
</html>