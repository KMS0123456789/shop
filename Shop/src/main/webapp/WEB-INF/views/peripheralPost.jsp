<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<c:if test="${peripheral.peripheralCategory == 0}">
			마우스 상세 페이지
		</c:if>
		<c:if test="${peripheral.peripheralCategory == 1}">
			키보드 상세 페이지
		</c:if>
		<c:if test="${peripheral.peripheralCategory == 2}">
			모니터 상세 페이지
		</c:if>
		<table border="1">
			<thead>
				<tr>
				<th><a href="<c:url value='/peripheral/keyboard.do'/>">키보드</a></th>
				<th><a href="<c:url value='/peripheral/mouse.do'/>">마우스</a></th>
				<th><a href="<c:url value='/computer/computer.do'/>">컴퓨터</a></th>
				<th><a href="<c:url value='/peripheral/monitor.do'/>">모니터</a></th>
			</tr>
			</thead>
		</table>
		<div>
			상품 이미지
		</div>
		<div>
			상품 이름 : ${peripheral.peripheralTitle}<br>
			상품 가격 : ${peripheral.peripheralSalePrice}<br>
			총 가격 : ${peripheral.peripheralSalePrice}
			<br>
			<button>구매하기</button>
			<br>
			<button>찜하기</button><button>장바구니</button><button>문의</button>
		</div>
		<br>
		<div>
			<button>상세정보</button><button>리뷰</button><button>QnA</button>
		</div>
		<div>
			상품 정보
			<table border="1">
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
		<br>
		<div>
			상품 리뷰
			<c:forEach items="${peripheral.reviews}" var="review">
				<table border="1">
					<tbody>
						<tr>
							<td>★★★★★</td>
						</tr>
						<tr>
							<td>작성자 : ${review.reviewUser}</td>
							<td>작성일 : ${review.reviewCreateDate}</td>
						</tr>
						<tr>
							<td>${review.reviewBody}</td>
						</tr>
					</tbody>
				</table>
			</c:forEach>
		</div>
		<div>
			QnA
			<table border="1">
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
						<c:if test="${question.questionFlag == 0}">
							<td>답변 전</td>
						</c:if>
						<c:if test="${question.questionFlag == 1}">
							<td>답변 완료</td>
						</c:if>
						<td>${question.questionTitle}</td>
						<td>${question.questionUser}</td>
						<td>${question.questionCreateDate}</td>
					</tr>
				</tbody>
				</c:forEach>
			</table>
		</div>
	</body>
</html>