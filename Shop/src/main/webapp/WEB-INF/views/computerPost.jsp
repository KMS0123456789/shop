<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<link href="<c:url value='/resources/css/computer.css' />" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	</head>
	<body>
		<div class="wrap">
		<%@ include file="./includes/myheader.jsp" %>	
			<section id="container" class="subpage">
				<div class="contents">
					<div class="product-view">
						<div class="detail-top">
							<div class="left">
								<div class="photo-slide">
									<div class="large" style="position: relative;">
										<div class="mainImg">
											<img class="mainImg2" src="<c:url value='${computer.computerFilePath}'/>">
										</div>
									</div>
								</div>
								<div id="avg_star_rating">
								    <fieldset>	    		
						    			<span>⭐ ${computer.starAvg} &ensp;<a href="#review" style="color: black;">리뷰 보러 가기</a></span>
								    </fieldset>
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
													<span class="p1"><em><fmt:formatNumber value="${computer.computerSalePrice}" type="number" pattern="#,###"/></em>원</span>
												</div>
											</div>
											<form class="select-form" action="<c:url value="/ask/computerBuy.do"/>" method="post">	
												<input type="hidden" value="${sessionScope.user.email}" name="askUser">
												<input type="hidden" value="${sessionScope.user.email}" name="askDetailUser">
												<input type="hidden" value="${computer.computerNo}" name="computerNo">							
												<ul class="info-list">
													<li>
														<div class="tit">SSD</div>
														<div class="ssd">
															<select id="selectbox1" class="selectbox" onchange="onSelectChange1()" name="optSsd">
																<option data-price="0" value="0">SSD 추가 구매</option>
																<c:forEach items="${opt}" var="opt">
																	<c:if test="${opt.optCategory == 0}">
																		<option data-price="${opt.optSalePrice}" value="${opt.optNo}" >${opt.optName}+<fmt:formatNumber value="${opt.optSalePrice}" type="number" pattern="#,###"/>원
																	</c:if>
																</c:forEach>
															</select>
														</div>
													</li>
													<li>
														<div class="tit">HDD</div>
														<div class="hdd">
															<select id="selectbox2" class="selectbox" onchange="onSelectChange2()" name="optHdd">
																<option data-price="0" value="0">HDD 추가 구매</option>
																<c:forEach items="${opt}" var="opt">
																	<c:if test="${opt.optCategory == 1}">
																		<option data-price="${opt.optSalePrice}" value="${opt.optNo}">${opt.optName}+<fmt:formatNumber value="${opt.optSalePrice}" type="number" pattern="#,###"/>원
																	</c:if>
																</c:forEach>
															</select>
														</div>
													</li>
													<li>
														<div class="tit">OS</div>
														<div class="os">
															<select id="selectbox3" class="selectbox" onchange="onSelectChange3()" name="optOs">
																<option data-price="0" value="0" >OS 추가 구매</option>
																<c:forEach items="${opt}" var="opt">
																	<c:if test="${opt.optCategory == 2}">
																		<option data-price="${opt.optSalePrice}" value="${opt.optNo}">${opt.optName}+<fmt:formatNumber value="${opt.optSalePrice}" type="number" pattern="#,###"/>원
																	</c:if>
																</c:forEach>
															</select>
														</div>
													</li>
												</ul>
											
											<div class="total">
												<span class="t1">총 결제금액</span>
												<span class="t2">
													<strong id="total-price"><fmt:formatNumber value="${computer.computerSalePrice}" type="number" pattern="#,###"/></strong>원
												</span>
											</div>
											<ul class="btnbox">
												<c:choose>
													<c:when test="${computer.keepFlag == 0}">
														<li>
															<button  type="button" class="btn-l-white" onclick="Keep()">
																<span>찜하기🤍</span>
															</button>
														</li>
													</c:when>
													<c:when test="${computer.keepFlag == 1}">
														<li>
															<button  type="button" class="btn-l-white-red" onclick="KeepDelete()">
																<span>찜하기❤️</span>
															</button>
														</li>
													</c:when>
												</c:choose>
												<li>
													<button  type="button" class="btn-l-red" onclick="Cart()">
														<span>장바구니</span>
													</button>
												</li>
												<li>
													<button  type="button" class="btn-l-gray" onclick="openModal()">
														<span>QnA</span>
													</button>
												</li>
											</ul>
											<ul class="btnbox2">
												<c:if test="${sessionScope.user.email == null or sessionScope.user.email == ''}">
													<li>
														<button type="button" class="btn-l-yellow" onclick="buyCheck()">
															<span>카카오페이로 구매하기</span>
														</button>
													</li>
												</c:if>
												<c:if test="${sessionScope.user.email != null and sessionScope.user.email != ''}">
													<li>
														<button class="btn-l-yellow" type="submit">
															<span>카카오페이로 구매하기</span>
														</button>
													</li>
												</c:if>
											</ul>
											</form>
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
						<div class="review-tab" id="review">
							<div class="tab-title"></div>
							<c:if test="${(computer.reviewFlag < 1) && (computer.buyFlag > 0)}">
								<c:forEach items="${ask}" var="ask">
									<c:if test="${fn:contains(ask.askUser,sessionScope.user.email)}">
										<div>
											<button onclick="reviewModal()">리뷰 작성</button>
										</div>
									</c:if>
								</c:forEach>
							</c:if>
							<div class="review">
								<div class="review-list">
									<ul>
										<c:forEach items="${computer.reviews}" var="review">
											<li>
												<div class="review-user">
													<div class="review-user-info">
														<c:forEach items="${computer.stars}" var="star">
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
										<c:forEach items="${computer.questions}" var="question">
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
				<div class="right" id="right" style="display: inline-block;">
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
		        <form id="question" action='<c:url value="/question/questionComputer.do"/>' method="post">
		            <input type="hidden" name="computerNo" value="${computer.computerNo}">
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
		        <form id="review" action='<c:url value="/review/reviewComputer.do"/>' method="post">
		            <input type="hidden" name="computerNo" value="${computer.computerNo}">
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
			function onSelectChange1(){ 
			    let selected = $("select option:selected");
			    let beforePrice = parseInt($(".p1 > em").text().replace(/[^0-9]/g, ""));
			    let totalPrice = beforePrice;
			    for(var i = 0; i < selected.length; i++){
			  		totalPrice += parseInt(selected.eq(i).data('price'));
			    }
			    let str = totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			    $("#total-price").text(str);
			}  	 
			function onSelectChange2(){ 
			 	let selected = $("select option:selected");
			    let beforePrice = parseInt($(".p1 > em").text().replace(/[^0-9]/g, ""));
			    let totalPrice = beforePrice;
			    for(var i = 0; i < selected.length; i++){
			   		totalPrice += parseInt(selected.eq(i).data('price'));
			    }
			    let str = totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			    $("#total-price").text(str);
			}  
			function onSelectChange3(){ 
				let selected = $("select option:selected");
				let beforePrice = parseInt($(".p1 > em").text().replace(/[^0-9]/g, ""));
				let totalPrice = beforePrice;
				for(var i = 0; i < selected.length; i++){
				   totalPrice += parseInt(selected.eq(i).data('price'));
				}
				let str = totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				$("#total-price").text(str);
			} 
			function Keep(){
				let session = "${sessionScope.user.email}"
				if(session == null || session == ""){
					alert("로그인 해주세요");
					return;
				};
				$.ajax({
					url : "<c:url value='/keep/keepComputer.do'/>",
					type : "post",
					data : {
						"keepUser" : "${sessionScope.user.email}",
						"computerNo" : ${computer.computerNo}
					},
					success : function(data){
						document.location.href = document.location.href;
					}
				})
			}
			function KeepDelete(){
				$.ajax({
					url : "<c:url value='/keep/keepDeleteComputer.do'/>",
					type : "post",
					data : {
						"keepUser" : "${sessionScope.user.email}",
						"computerNo" : ${computer.computerNo}
					},
					success : function(data){
						document.location.href = document.location.href;
					}
				})
			}
			function Cart(){
				let session = "${sessionScope.user.email}"
				let selected = $("select option:selected");
				if(session == null || session == ""){
					alert("로그인 해주세요");
					return;
				};
				$.ajax({
					url : "<c:url value='/cart/cartComputer.do'/>",
					type : "post",
					data : {
						"cartUser" : "${sessionScope.user.email}",
						"computerNo" : ${computer.computerNo},
						"optSsd" : parseInt(selected.eq(0).attr("value")),
						"optHdd" : parseInt(selected.eq(1).attr("value")),
						"optOs" : parseInt(selected.eq(2).attr("value"))
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
				let no = ${computer.computerNo};
				let path = "${computer.computerFilePath}";
				$("#history").children().remove();
								
				let obj = {
					no : no,
					path : path,
					flag : 1
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
							history += "<a href='<c:url value='/computer/computer.do/'/>"+watchListArr[i].no+"'>"+"<img class='last_image' src='<c:url value='/'/>"+watchListArr[i].path+"'>"+"</a>"
						history += "</li>"
					}
					else if(watchListArr[i].flag === 2){
						history += "<li>"
							history += "<a href='<c:url value='/peripheral/peripheral.do/'/>"+watchListArr[i].no+"'>"+"<img class='last_image' src='<c:url value='/'/>"+watchListArr[i].path+"'>"+"</a>"
						history += "</li>"	
					}
					
				}
				$("#history").append(history);
				
			}
			function buyCheck(){
				let session = "${sessionScope.user.email}"
				let selected = $("select option:selected");
				if(session == null || session == ""){
					alert("로그인 해주세요");
					return;
				};
			};﻿
		</script>
	</body>
</html>