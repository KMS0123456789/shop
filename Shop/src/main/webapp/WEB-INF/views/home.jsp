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
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/7.4.1/swiper-bundle.min.js"></script>
	   	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/7.4.1/swiper-bundle.css">
	</head>
	<body>
		<div class="wrap">
			<%@ include file="./includes/homeheader.jsp" %>
			<div style="position: relative; display: inline-block; width: 85%; ">
				<div class="main-slide slick-initialized slick-slider ">
					<div aria-live="polite" class="slick-list draggable ">
						<div class="slick-track swiper" role="listbox" >
							<ul class="slick-silde slick-cloned swiper-wrapper"aria-hidden="true">
								<li class="swiper-slide">
									<a href="" target="_self" class="trace_link" data-name="" >
										<img src="<c:url value="/resources/image/amd.jpg"/>">
									</a>
								</li>
								<li class="swiper-slide">
									<a href="" target="_self" class="trace_link" data-name="" >
										<img src="<c:url value="/resources/image/intel.jpg"/>">
									</a>
								</li>
								<li class="swiper-slide">
									<a href="" target="_self" class="trace_link" data-name="" >
										<img src="<c:url value="/resources/image/computer.jpg"/>">
									</a>
								</li>
								<li class="swiper-slide">
									<a href="" target="_self" class="trace_link" data-name="" >
										<img src="<c:url value="/resources/image/gpu.jpg"/>">
									</a>
								</li>
								<li class="swiper-slide">
									<a href="" target="_self" class="trace_link" data-name="" >
										<img src="<c:url value="/resources/image/pc.jpeg"/>">
									</a>
								</li>
							</ul>
							<div class="control-area">
			          		<div class="pagination"></div>
				          		<button class="btn btn-autoplay" aria-label="자동재생정지"></button>
				          		<button class="btn btn-prev" aria-label="이전슬라이드"></button>
				          		<button class="btn btn-next" aria-label="다음슬라이드"></button>
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
			<section id="container" class="mainpage" style="display: inline-block;">
				<div class="product-box" id="main-recommend">
					<div class="box recomend" id="box_recomend">
						<ul class="item">
							<c:forEach items="${computer}" var="computer">
								<c:forEach items="${computer.files}" var="file">
									<li>
										<div class="item-image">
											<a href='<c:url value="/computer/computer.do/${computer.computerNo}"/>'><img class="image" src="<c:url value='${file.filePath}'/>"></a>
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
							</c:forEach>	
							<c:forEach items="${peripheral}" var="peripheral">
								<c:forEach items="${peripheral.files}" var="file"> 
									<c:choose>
										<c:when test="${peripheral.peripheralCategory == 0}">
											<li>
												<div class="item-image">
													<a href='<c:url value="/peripheral/peripheral.do/${peripheral.peripheralNo}"/>'><img class="image" src="<c:url value='${file.filePath}'/>"></a>
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
													<a href='<c:url value="/peripheral/peripheral.do/${peripheral.peripheralNo}"/>'><img class="image" src="<c:url value='${file.filePath}'/>"></a>
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
													<a href='<c:url value="/peripheral/peripheral.do/${peripheral.peripheralNo}"/>'><img class="image" src="<c:url value='${file.filePath}'/>"></a>
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
	<script type="text/javascript">
	const visualSlide = new Swiper('.swiper',{
	      loop: true,
	      centeredSlides: true,
	      freeMode : true,
	      autoplay:{
	         delay: 4000,  
	      	},
	     navigation: {
	      	nextEl: ".btn-next",
	      	prevEl: ".btn-prev"
	    	},
	    pagination: {
	      el: ".pagination",
	      type:"bullets",
	      clickable: true
	      },
	      effect: 'cube',
	 	})
	</script>
</html>