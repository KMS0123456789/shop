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
		완제품 상세 페이지
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
			상품 이름 : ${computer.computerTitle}<br>
			상품 가격 : ${computer.computerSalePrice}<br>
			<select>
				<option> SSD
				<option> SSD1
				<option> SSD2
				<option> SSD3
		    </select>
		    <br>
		    <select>
				<option> OS
				<option> OS1
				<option> OS2
				<option> OS3
		    </select>
		    <br>
		    <select>
				<option> HDD
				<option> HDD1
				<option> HDD2
				<option> HDD3
		    </select>
		    <br>
			총 가격 : ${computer.computerSalePrice}
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
						<td>${computer.computerNo}</td>
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
						<td>${computer.computerCreateDate}</td>
					</tr>
				</tbody>
			</table>
			자세한 문의는 QnA를 통해서 해주세요
			<table border="1">
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
		<br>
		<div>
			상품 리뷰
			<c:forEach items="${computer.reviews}" var="review">
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
				<c:forEach items="${computer.questions}" var="question">
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