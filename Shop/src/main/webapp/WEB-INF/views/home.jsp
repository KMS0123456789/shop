<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
	<html>
	<head>
	    <meta charset="UTF-8">
	    <link href="<c:url value='/resources/css/home.css' />" rel="stylesheet">
	</head>
	<body>
		<div class="wrap">
			<header id="header">
				<div class="top">
					<h1><a href="<c:url value=""/>">컴퓨터 사이트</a></h1>
					<ul class="toplink">
						<li><a>장바구니</a></li>
						<li><a>마이페이지</a></li>
						<li><a>로그인</a></li>
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
			<div style="position: relative;">
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
			<section id="container" class="mainpage">
				<div class="product-box" id="main-recommend">
					<div class="box recomend">
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
</html>