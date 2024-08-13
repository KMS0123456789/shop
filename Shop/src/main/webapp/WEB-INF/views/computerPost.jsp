<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<link href="<c:url value='/resources/css/computer.css' />" rel="stylesheet">
	</head>
	<body>
		<div class="wrap">
			<header id="header">
				<div class="top">
					<h1><a href="<c:url value="/"/>">컴퓨터 사이트</a></h1>
					<ul class="toplink">
						<li><a>장바구니</a></li>
						<li><a>마이페이지</a></li>
						<li><a><div class="login-btn"><span>로그인</span></div></a></li>
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
			<section id="container" class="subpage">
				<div class="contents">
					<div class="product-view">
						<div class="detail-top">
							<div class="left">
								<div class="photo-slide">
									<div class="large" style="position: relative;">
										<div class="mainImg">
											<img class="mainImg2">
										</div>
									</div>
								</div>
							</div>
							<div class="right">
								<div class="txt-box">
									<div class="tit">${computer.computerTitle}</div>
								</div>
								<div class="fixed-box">
									<div class="inner">
										<div class="inner-box">
											<div class="price-box">
												<div class="pull-left">
													<span class="p1"><em>${computer.computerSalePrice}</em>원</span>
												</div>
											</div>
											<form class="select-form">
												<ul class="info-list">
													<li>
														<div class="tit">SSD</div>
														<div class="ssd">
															<select class="selectbox">
																<option>SSD 추가 구매
																<option>SSD1
																<option>SSD2
															</select>
														</div>
													</li>
													<li>
														<div class="tit">HDD</div>
														<div class="hdd">
															<select class="selectbox">
																<option>HDD 추가 구매
																<option>HDD1
																<option>HDD2
															</select>
														</div>
													</li>
													<li>
														<div class="tit">OS</div>
														<div class="os">
															<select class="selectbox">
																<option>OS 추가 구매
																<option>OS1
																<option>OS2
															</select>
														</div>
													</li>
												</ul>
											</form>
											<div class="add-list">
												<ul class="list">
													<li class="goods-form"></li>
												</ul>
											</div>
											<div class="total">
												<span class="t1">총 결제금액</span>
												<span class="t2">
													<strong id="toal-price">${computer.computerSalePrice}</strong>원
												</span>
											</div>
											<ul class="btnbox">
												<li>
													<button class="btn-l-black">
														<span>찜하기</span>
													</button>
												</li>
												<li>
													<button class="btn-l-red">
														<span>장바구니</span>
													</button>
												</li>
												<li>
													<button class="btn-l-white">
														<span>QnA</span>
													</button>
												</li>
											</ul>
											<ul class="btnbox2">
												<li>
													<button class="btn-l-yellow">
														<span>카카오페이로 구매하기</span>
													</button>
												</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
						<ul class="tabmenu">
							<li class="on"><a>상품 정보</a></li>
							<li><a>리뷰</a></li>
							<li><a>QnA</a></li>
						</ul>
						<div class="detail-info">
							<div class="detail-info2">
								<div class="detail-info3">
									<div class="table-box">
										<table>
											<tbody>
												<tr>
													<td>CPU</td>
													<td>${computer.cpu}</td>
													<td>메인보드</td>
													<td>${computer.mainBoard}</td>
												</tr>
												<tr>
													<td>SSD</td>
													<td>${computer.ssd}</td>
													<td>RAM</td>
													<td>${computer.ram}</td>
												</tr>
												<tr>
													<td>POWER</td>
													<td>${computer.power}</td>
													<td>GPU</td>
													<td>${computer.gpu}</td>
												</tr>
												<tr>
													<td>CASE</td>
													<td>${computer.bCase}</td>
													<td>COOLER</td>
													<td>${computer.cooler}</td>
												</tr>
												<tr>
													<td>OS</td>
													<td>OS 미포함</td>
													<td>무상AS</td>
													<td>1년</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<div class="review-tab">
							<div class="tab-title"></div>
							<div class="review">
								<div class="review-list">
									<ul>
										<li>
											<div class="review-user">
												<div class="review-user-info">
													<div>
														<span class="star">
															<span class="star-bg">★</span>
														</span>
													</div>
													<div style="padding-left: 5px;">
														<span class="review-user-name">이름</span>
														<span class="review-date">작성일</span>
													</div>
												</div>
											</div>
											<div class="review-text">
												<p>리뷰 내용</p>
											</div>
										</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="qna">
							<div class="tab-title"></div>
							<div class="top">
								<p class="tit">상품 QnA</p>
							</div>
							<div class="qna-box">
								<div>
									<table>
										<thead>
											<tr>
												<th>답변 상태</th>
												<th>제목</th>
												<th>작성자</th>
												<th>작성일</th>
											</tr>
										</thead>
										<c:forEach items="${computer.questions}" var="question">
											<tbody>
												<tr>
													<c:choose>
														<c:when test="${question.questionFlag == 0}">
															<td>답변 전</td>
														</c:when>
														<c:when test="${question.questionFlag == 1}">
															<td>답변 완료</td>
														</c:when>
													</c:choose>
													<td>${question.questionTitle}</td>
													<td>${question.questionUser}</td>
													<td>${question.questionCreateDate}</td>
												</tr>
											</tbody>
										</c:forEach>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</body>
</html>