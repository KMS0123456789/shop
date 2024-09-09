<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <form action="peripheralwrite.do" method="post" enctype="multipart/form-data">
            <select id="peripheralCategory" name="peripheralCategory" class="peripheralCategory">
                <option value="0">마우스</option>
                <option value="1">키보드</option>
                <option value="2">모니터</option>
            </select>
            <br><br>
            <div class="form-group">
                <label for="peripheralTitle">상품 제목</label>
                <input type="text" id="peripheralTitle" name="peripheralTitle" maxlength="30">
            </div>
            <div class="form-group">
                <label for="peripheralSalePrice">상품 가격</label>
                <input type="number" id="peripheralSalePrice" name="peripheralSalePrice" max="10">
            </div>
            <div class="form-group">
                <label for="peripheralName">상품명</label>
                <input type="text" id="peripheralName" name="peripheralName" maxlength="30">
            </div>
            <div class="form-group">
                <label for="peripheral_stock">상품 수량</label>
                <input type="number" id="peripheral_stock" name="peripheral_stock"  min="2" max="5">
            </div>
            <div class="form-group" id="fileDiv">
                <label for="file">첨부파일</label>
                <input type="file" accept="image/*" multiple id="file" name="file">
            </div>
            <div>
                <img id="previewImg" onclick="popImage(this.src)">
            </div>
            <div class="footer">
                <button type="submit" class="button">상품 등록</button>
                <a onclick="history.back()" class="button">취소</a>
            </div>
        </form>
    </div>
</body>
<script>

		$("form").submit(function(){
	
		let peripheralTitle = $("#peripheralTitle");
		let peripheralSalePrice = $("#peripheralSalePrice");
		let peripheralName = $("#peripheralName");
		let peripheral_stock = $("#peripheral_stock")		
		
		if(peripheralTitle.val().trim() == ""){
			alert("상품제목은 필수 입력 항목 입니다.");
			peripheralTitle.focus();
			return false;
		}
		
		if(peripheralSalePrice.val().trim() == ""){
			alert("상품가격은 필수 입력 항목 입니다.");
			peripheralSalePrice.focus();
			return false;
		}
		
		if(peripheralName.val().trim() == ""){
			alert("상품명은 필수 입력 항목 입니다.");
			peripheralName.focus();
			return false;
		}
		
		if(peripheral_stock.val().trim() == ""){
			alert("상품재고는 필수 입력 항목 입니다.");
			peripheral_stock.focus();
			return false;
		}
		return true;
	})
</script>
</html>