<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<c:url value='/resources/css/write.css' />" rel="stylesheet">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
		<div class="container">
			<a><h1>커스텀pc Shop</h1></a>
			<form action="optionwrite.do"  method="POST">
			<select id="optCategory" name="optCategory" class="optCategory">
				<option value="0">ssd</option>
				<option value="1">hdd</option>
				<option value="2">os</option>
			</select>
				 <div class="form-group">
	                <label for="optName">옵션 이름</label>
	                <input type="text" id="optName" name="optName">
	            </div> 
	            <div class="form-group">
	                <label for="optStock">옵션 재고</label>
	                <input type="number" id="optStock" name="optStock" maxlength="3">
	            </div>
	            <div class="form-group">
	                <label for="optSalePrice">옵션 가격</label>
	                <input type="number" id="optSalePrice" name="optSalePrice" maxlength="10">
	            </div>	
	            <div class="footer">
	                <button type="submit" class="button">옵션 등록</button>
	                <a onclick="history.back()" class="button">취소</a>
	            </div>
	        </form>
	      </div>
</body>
<script type="text/javascript">
$("form").submit(function(){
	
	let optName = $("#optName");
	let optStock = $("#optStock");
	let optSalePrice = $("#optSalePrice");		
	
	if(optName.val().trim() == ""){
		alert("옵션이름은 필수 입력 항목 입니다.");
		optName.focus();
		return false;
	}
	
	if(optStock.val().trim() == ""){
		alert("옵션재고는 필수 입력 항목 입니다.");
		optStock.focus();
		return false;
	}
	
	if(optSalePrice.val().trim() == ""){
		alert("옵션가격은 필수 입력 항목 입니다.");
		optSalePrice.focus();
		return false;
	}
	return true;
})
</script>
</html>