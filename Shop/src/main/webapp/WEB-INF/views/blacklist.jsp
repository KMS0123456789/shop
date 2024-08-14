<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
				<div>
		<table border="1">
			<tbody>
				<tr>
					<td>회원구분</td>
					<td>이름</td>
					<td>이메일</td>
					<td>관리</td>
				</tr>
			</tbody>
			 	<tbody>
					 <tr>
		             	<c:forEach items="${user}" var="user">
		             		<tr>
		             			<c:if test="${user.userType == 0}">
		             				<td>관리자</td>
		             			</c:if>
		             			<c:if test="${user.userType == 1}">
		             				<td>일반유저</td>
		             			</c:if>
		             			<c:if test="${user.userType == 2}">
		             				<td>블랙리스트 유저</td>
		             			</c:if>
				             		<td>${user.name}</td>
				                	<td>${user.email}</td>
				                	<td>
			              			<form action='<c:url value="/user/blackList.do"/>'  method="post">
										<input type="hidden" name="email" value="${user.email}">
							        	<button type="submit" >블랙리스트</button>
							        </form>
						        </td>
						    </tr>
		             	</c:forEach>		             		    	
		            </tr>
		        </tbody>
		</table>
		</div>
</body>
</html>