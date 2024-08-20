<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<link href="<c:url value='/resources/css/peripheral.css' />" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	</head>
	<body>
		<div class="wrap">
			<header id="header">
				<div class="top">
					<h1><a href="<c:url value="/"/>">컴퓨터 사이트</a></h1>
					<ul class="toplink">
						<c:choose>
							<c:when test="${sessionScope.user.email != null}">
								<li><a>장바구니</a></li>
								<li><a>마이페이지</a></li>
								<li><a>로그아웃</a></li>	
							</c:when>
							<c:when test="${sessionScope.user.email == null}">
								<li><a>로그인</a></li>
							</c:when>
						</c:choose>
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
									<div class="tit">${peripheral.peripheralTitle}</div>
								</div>
								<div class="fixed-box">
									<div class="inner">
										<div class="inner-box">
											<div class="price-box">
												<div class="pull-left">
													<span class="p1"><em>${peripheral.peripheralSalePrice}</em>원</span>
												</div>
											</div>
											<div class="add-list">
												<ul class="list">
													<li class="goods-form"></li>
												</ul>
											</div>
											<div class="total">
												<span class="t1">총 결제금액</span>
												<span class="t2">
													<strong id="toal-price">${peripheral.peripheralSalePrice}</strong>원
												</span>
											</div>
											<ul class="btnbox">
												<c:choose>
													<c:when test="${peripheral.keepFlag == 0}">
														<li>
															<button class="btn-l-white" onclick="Keep()">
																<span>찜하기♡</span>
															</button>
														</li>
													</c:when>
													<c:when test="${peripheral.keepFlag == 1}">
														<li>
														<form action="<c:url value="/keep/keepDeletePeripheral.do"/>">
															<input type="hidden" value="${peripheral.peripheralNo}" name="peripheralNo">
															<input type="hidden" value="${sessionScope.user.email}" name="keepUser">
															<button class="btn-l-white">
																<span>찜하기♥</span>
															</button>
														</form>	
														</li>
													</c:when>
												</c:choose>
												<li>
													<button class="btn-l-red" onclick="Cart()">
														<span>장바구니</span>
													</button>
												</li>
												<li>
													<button class="btn-l-white" onclick="openModal()">
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
							<li class="on"><a href="#info">상품 정보</a></li>
							<li><a href="#review">리뷰</a></li>
							<li><a href="#qna">QnA</a></li>
						</ul>
						<div class="detail-info" id="info">
							<div class="detail-info2">
								<div class="detail-info3">
									<div class="table-box">
										<table>
											<tbody>
												<tr>
													<td>상품 번호</td>
													<td>${peripheral.peripheralNo}</td>
													<td>상품 상태</td>
													<td>신상품</td>
												</tr>
												<tr>
													<td>제조사</td>
													<td>우리</td>
													<td>브랜드</td>
													<td>우리</td>
												</tr>
												<tr>
													<td>원산지</td>
													<td>국산</td>
													<td>제조일자</td>
													<td>${peripheral.peripheralCreateDate}</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<div class="review-tab" id="review">
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
						<div class="qna" id="qna">
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
										<c:forEach items="${peripheral.questions}" var="question">
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
			<div id="qnaModal" class="modal" style="display: none;">
			    <div class="modal-content">
			        <h2>QnA 작성 페이지입니다.</h2>
			        <form id="question" action='<c:url value="/question/questionPeripheral.do"/>' method="post">
			            <input type="hidden" name="peripheralNo" value="${peripheral.peripheralNo}">
			            <input type="hidden" name="questionUser" value="${sessionScope.user.email}">
		            	제목<br>
                      	<input type="text" name="questionTitle" class="qnatitle"><br>
			                        본문<br>
			            <textarea rows="20px" cols="40px" name="questionBody" style="resize: none;"></textarea><br><br>
			            <button type="submit" style="margin-left: 200px">작성하기</button>
			            <button type="button" onclick="closeModal()" style="text-align: right">취소</button>
			        </form>
			    </div>
			</div>
		<script>
			function Keep(){
				let session = "${sessionScope.user.email}"
				if(session == null || session == ""){
					alert("로그인 해주세요");
					return;
				};
				$.ajax({
					url : "<c:url value='/keep/keepPeripheral.do'/>",
					type : "post",
					data : {
						"keepUser" : "${sessionScope.user.email}",
						"peripheralNo" : ${peripheral.peripheralNo}
					},
					success : function(data){
						document.location.href = document.location.href;
					}
				})
			}
			function Cart(){
				let session = "${sessionScope.user.email}"
				if(session == null || session == ""){
					alert("로그인 해주세요");
					return;
				};
				$.ajax({
					url : "<c:url value='/cart/cartPeripheral.do'/>",
					type : "post",
					data : {
						"cartUser" : "${sessionScope.user.email}",
						"peripheralNo" : ${peripheral.peripheralNo}
					},
					success : function(data){
						alert("장바구니에 추가되었습니다.");
						document.location.href = document.location.href;
					}
				})
			}
			function openModal() {
				let session = "${sessionScope.user.email}"
					if(session == null || session == ""){
						alert("로그인 해주세요");
						return;
				};
		        document.getElementById('qnaModal').style.display = 'block';
		    }
			function closeModal() {
		        document.getElementById('qnaModal').style.display = 'none';
		    }﻿
		</script>
	</body>
</html>