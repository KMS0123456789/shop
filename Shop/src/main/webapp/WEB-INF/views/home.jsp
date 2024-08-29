<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
	<html>
	<head>
	    <meta charset="UTF-8">
	    <link href="<c:url value='/resources/css/home.css' />" rel="stylesheet">
	    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
	</head>
	<body>
		<div class="wrap">
			<header id="header">
				<div class="top">
					<h1><a href="<c:url value="/"/>">커스텀 PC Shop</a></h1>
					<ul class="toplink">
						<c:if test="${sessionScope.user.email != null}">
							<li><a href="<c:url value='/cart/view.do'/>">장바구니</a></li>
						</c:if>
						<c:if test="${sessionScope.user.email != null}">
							<li><a href="<c:url value='/user/mypage.do'/>">마이페이지</a></li>
						</c:if>
    					<c:if test="${sessionScope.user.email == null}">
							<li><a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=91452e14d92a8c67875cd1e2ec08fdd2
							&redirect_uri=http://localhost:8080/shop/user/kakao/callback.do">
							<img height="30px" src="<c:url value='/resources/image/kakaoLogin.png'/>"></a></li>
						</c:if>
						<c:if test="${sessionScope.user.email != null}">
    						<li><a href="<c:url value='/user/logout.do'/>">로그아웃</a></li>
    					</c:if>
					</ul>
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
			<div style="position: relative; display: inline-block; width: 80%; margin-left: 200px">
				<div class="main-slide slick-initialized slick-slider">
					<div aria-live="polite" class="slick-list draggable">
						<div class="slick-track" role="listbox">
							<ul class="slick-silde slick-cloned" data-slick-index="-2" aria-hidden="true" tabindex="-1">
								<li>
									<a href="" target="_self" class="trace_link" data-name="" tabindex="-1">
										<img src="<c:url value="/resources/image/keyboard.jpg"/>">
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="right" id="right" style="display: inline-block;">
				<div class='history_box'>
					<ul class='history_list' id='history'>
					
					</ul>
				</div>
			</div>
			<section id="container" class="mainpage" style="display: inline-block;">
				<div class="product-box" id="main-recommend">
					<div class="box recomend" id="box_recomend">
						<ul class="item">
							<c:forEach items="${computer}" var="computer">
								<li>
									<div class="item-image">
										<a href='<c:url value="/computer/computer.do/${computer.computerNo}"/>'><img class="image">이미지</a>
									</div>
									<div class="item-content">
										<div class="subject">
											<a href='<c:url value="/computer/computer.do/${computer.computerNo}"/>'>${computer.computerTitle}</a>
										</div>
									</div>
									<div class="info">
										<div class="pull-left">
											<span>${computer.computerSalePrice}</span>
										</div>
									</div>
									<div class="txt"></div>
								</li>
							</c:forEach>	
							<c:forEach items="${peripheral}" var="peripheral">
								<c:choose>
									<c:when test="${peripheral.peripheralCategory == 0}">
										<li>
											<div class="item-image">
												<a href='<c:url value="/peripheral/peripheral.do/${peripheral.peripheralNo}"/>'><img class="image">이미지</a>
											</div>
											<div class="item-content">
												<div class="subject">
													<a href='<c:url value="/peripheral/peripheral.do/${peripheral.peripheralNo}"/>'>${peripheral.peripheralTitle}</a>
												</div>
											</div>
											<div class="info">
												<div class="pull-left">
													<span>${peripheral.peripheralSalePrice}</span>
												</div>
											</div>
											<div class="txt"></div>
										</li>	
									</c:when>
									<c:when test="${peripheral.peripheralCategory == 1}">
										<li>
											<div class="item-image">
												<a href='<c:url value="/peripheral/peripheral.do/${peripheral.peripheralNo}"/>'><img class="image">이미지</a>
											</div>
											<div class="item-content">
												<div class="subject">
													<a href='<c:url value="/peripheral/peripheral.do/${peripheral.peripheralNo}"/>'>${peripheral.peripheralTitle}</a>
												</div>
											</div>
											<div class="info">
												<div class="pull-left">
													<span>${peripheral.peripheralSalePrice}</span>
												</div>
											</div>
											<div class="txt"></div>
										</li>	
									</c:when>
									<c:when test="${peripheral.peripheralCategory == 2}">
										<li>
											<div class="item-image">
												<a href='<c:url value="/peripheral/peripheral.do/${peripheral.peripheralNo}"/>'><img class="image">이미지</a>
											</div>
											<div class="item-content">
												<div class="subject">
													<a href='<c:url value="/peripheral/peripheral.do/${peripheral.peripheralNo}"/>'>${peripheral.peripheralTitle}</a>
												</div>
											</div>
											<div class="info">
												<div class="pull-left">
													<span>${peripheral.peripheralSalePrice}</span>
												</div>
											</div>
											<div class="txt"></div>
										</li>	
									</c:when>
								</c:choose>
							</c:forEach>								
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
			if(watchList[i].flag == 1){
				history += "<li>"
					history += "<a href='<c:url value='/computer/computer.do/"+watchList[i].no+"'/>'>"+watchList[i].title+"</a>"
				history += "</li>"
			}
			else if(watchList[i].flag == 2){
				history += "<li>"
					history += "<a href='<c:url value='/peripheral/peripheral.do/"+watchList[i].no+"'/>'>"+watchList[i].title+"</a>"
				history += "</li>"	
			}
			
		}
		$("#history").append(history);
	</script>
</html>