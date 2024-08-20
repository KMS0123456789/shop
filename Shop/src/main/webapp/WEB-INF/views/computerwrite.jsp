<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<c:url value='/resources/css/write.css' />" rel="stylesheet">
</head>
<body>
		<div class="container">
        <a><h1>커스텀pc Shop</h1></a>
        <form action="computerwrite.do" method="post" enctype="multipart/form-data">                   
            <br><br>
            <div class="form-group">
                <label for="computerTitle">상품 제목</label>
                <input type="text" id="title" name="computerTitle">
            </div>
            <div class="form-group">
                <label for="computerSalePrice">상품 가격</label>
                <input type="text" id="computerSalePrice" name="computerSalePrice">
            </div>
            <div class="form-group">
                <label for="cpu">cpu</label>
                <input type="text" id="cpu" name="cpu">
            </div>
            <div class="form-group">
                <label for="ssd">ssd</label>
                <input type="text" id="ssd" name="ssd">
            </div>
            <div class="form-group">
                <label for="mainBoard">mainBoard</label>
                <input type="text" id="mainBoard" name="mainBoard">
            </div>
            <div class="form-group">
                <label for="gpu">gpu</label>
                <input type="text" id="gpu" name="gpu">
            </div>
            <div class="form-group">
                <label for="power">power</label>
                <input type="text" id="power" name="power">
            </div>
            <div class="form-group">
                <label for="bCase">bCase</label>
                <input type="text" id="bCase" name="bCase">
            </div>
            <div class="form-group">
                <label for="ram">ram</label>
                <input type="text" id="ram" name="ram">
            </div>
            <div class="form-group">
                <label for="cooler">cooler</label>
                <input type="text" id="cooler" name="cooler">
            </div>            
            <div class="form-group">
                <label for="computerStock">상품 수량</label>
                <input type="text" id="itemCount" name="computerStock">
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
</html>