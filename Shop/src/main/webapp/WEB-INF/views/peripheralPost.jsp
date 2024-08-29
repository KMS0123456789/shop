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
				<div class="contents" style="display: inline-block; margin-left: 200px;" >
					<div class="product-view">
						<div class="detail-top">
							<div class="left">
								<div class="photo-slide">
									<div class="large" style="position: relative;">
										<div class="mainImg">
											<img class="mainImg2" src="${peripheral.peripheralFilePath}">
										</div>
									</div>
								</div>
								<div id="avg_star_rating">
								    <fieldset>	    		
						    			<span>⭐ ${peripheral.starAvg} &ensp;<a href="#review" style="color: black;">리뷰 보러 가기</a></span>
								    </fieldset>
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
																<span>찜하기🤍</span>
															</button>
														</li>
													</c:when>
													<c:when test="${peripheral.keepFlag == 1}">
														<li>
														<form action="<c:url value="/keep/keepDeletePeripheral.do"/>">
															<input type="hidden" value="${peripheral.peripheralNo}" name="peripheralNo">
															<input type="hidden" value="${sessionScope.user.email}" name="keepUser">
															<button class="btn-l-white">
																<span>찜하기❤️</span>
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
													<button class="btn-l-gray" onclick="openModal()">
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
							<c:if test="${(peripheral.reviewFlag < 1) && (peripheral.buyFlag > 0)}">
								<c:forEach items="${ask}" var="ask">
									<c:if test="${ask.askUser == sessionScope.user.email}">
										<div>
											<button class="" onclick="reviewModal()">리뷰 작성</button>
										</div>
									</c:if>
								</c:forEach>
							</c:if>
							<div class="review">
								<div class="review-list">
									<ul>
										<c:forEach items="${peripheral.reviews}" var="review">
											<li>
												<div class="review-user">
													<div class="review-user-info">
														<c:forEach items="${peripheral.stars}" var="star">
															<div id="review_star_rating">
															    <fieldset>
															    	<c:choose>
															    		<c:when test="${(star.starCount == 1) && (star.starUser == review.reviewUser)}">
															    			<span>⭐</span>
															    		</c:when>
															    		<c:when test="${(star.starCount == 2) && (star.starUser == review.reviewUser)}">
															    			<span>⭐⭐</span>
															    		</c:when>
															    		<c:when test="${(star.starCount == 3) && (star.starUser == review.reviewUser)}">
															    			<span>⭐⭐⭐</span>
															    		</c:when>
															    		<c:when test="${(star.starCount == 4) && (star.starUser == review.reviewUser)}">
															    			<span>⭐⭐⭐⭐</span>
															    		</c:when>
															    		<c:when test="${(star.starCount == 5) && (star.starUser == review.reviewUser)}">
															    			<span>⭐⭐⭐⭐⭐</span>
															    		</c:when>
															    	</c:choose>
															    </fieldset>
															</div>
														</c:forEach>
														<div style="padding-left: 5px;">
															<span class="review-user-name">${review.reviewUser}</span>
															<span class="review-date">${review.reviewCreateDate}</span>
														</div>
													</div>
												</div>
												<div class="review-text">
													<p>${review.reviewBody}</p>
												</div>
											</li>
										</c:forEach>
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
														<c:when test="${question.questionFlag == 1}">
															<td>답변 전</td>
														</c:when>
														<c:when test="${question.questionFlag == 2}">
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
				<div class="right" id="right" >
					<div class='history_box'>
						<ul class='history_list' id='history'>
						
						</ul>
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
		<div id="reviewModal" class="reviewModal" style="display: none;">
		    <div class="modal-content">
		        <h2>별점 및 리뷰 작성</h2>
		        <form id="review" action='<c:url value="/review/reviewPeripheral.do"/>' method="post">
		            <input type="hidden" name="peripheralNo" value="${peripheral.peripheralNo}">
		            <input type="hidden" name="reviewUser" value="${sessionScope.user.email}">
		            <input type="hidden" name="starUser" value="${sessionScope.user.email}">
		            <br>
	            	별점
                     	<div id="star_rating">
						    <fieldset>
						        <input type="radio" name="starCount" value="5" id="star1"><label for="star1">⭐</label>
						        <input type="radio" name="starCount" value="4" id="star2"><label for="star2">⭐</label>
						        <input type="radio" name="starCount" value="3" id="star3"><label for="star3">⭐</label>
						        <input type="radio" name="starCount" value="2" id="star4"><label for="star4">⭐</label>
						        <input type="radio" name="starCount" value="1" id="star5"><label for="star5">⭐</label>
						    </fieldset>
						</div>
		                        본문
                   	<br>
		            <textarea rows="20px" cols="40px" name="reviewBody" style="resize: none;"></textarea>
		            <br><br>
		            <button type="submit" style="margin-left: 200px">작성하기</button>
		            <button type="button" onclick="reviewCloseModal()" style="text-align: right">취소</button>
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
		    }
			
			function reviewModal() {
		        document.getElementById('reviewModal').style.display = 'block';
		    }
			function reviewCloseModal() {
		        document.getElementById('reviewModal').style.display = 'none';
		    }
			
			window.onload = function () {
				let no = ${peripheral.peripheralNo};
				let title = "${peripheral.peripheralTitle}";
				$("#history").children().remove();
								
				let obj = {
						no : no,
						title : title,
						flag : 2
				};
				
				let watchArr = window.localStorage.getItem('watchList');
				let watchArrNo = watchArr == null ? [] : JSON.parse(watchArr);
				watchArrNo.unshift(obj);
				watchArrNo =  watchArrNo.filter((watch, idx, arr)=>{
				    return arr.findIndex((item) => item.no === watch.no && item.flag === watch.flag) === idx
				});

				let watchList = JSON.stringify(watchArrNo);
				window.localStorage.setItem('watchList', watchList);
				let watchListArr = window.localStorage.getItem('watchList');
				watchListArr = JSON.parse(watchListArr);
				if (watchListArr.length >= 5) {
					watchListArr.length = 5; 
				}
				
				let history = "";
				
				for(let i = 0; i < watchListArr.length; i++){
					if(watchListArr[i].flag === 1){
						history += "<li>"
							history += "<a href='<c:url value='/computer/computer.do/"+watchListArr[i].no+"'/>'>"+watchListArr[i].title+"</a>"
						history += "</li>"
					}
					else if(watchListArr[i].flag === 2){
						history += "<li>"
							history += "<a href='<c:url value='/peripheral/peripheral.do/"+watchListArr[i].no+"'/>'>"+watchListArr[i].title+"</a>"
						history += "</li>"	
					}
					
				}
				$("#history").append(history);
			}﻿
		</script>
	</body>
</html>