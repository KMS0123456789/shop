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
        <form action="computerwrite.do" method="post" enctype="multipart/form-data">                   
            <br><br>
            <div class="form-group">
                <label for="computerTitle">상품 제목</label>
                <input type="text" id="computerTitle" name="computerTitle" maxlength="100">
            </div>
            <div class="form-group">
                <label for="computerSalePrice">상품 가격</label>
                <input type="number" id="computerSalePrice" name="computerSalePrice" oninput='handleOnInput(this,10)'  >
            </div>
            <div class="form-group">
                <label for="cpu">cpu</label>
                <input type="text" id="cpu" name="cpu" maxlength="100">
            </div>
            <div class="form-group">
                <label for="ssd">ssd</label>
                <input type="text" id="ssd" name="ssd" maxlength="100">
            </div>
            <div class="form-group">
                <label for="mainBoard">mainBoard</label>
                <input type="text" id="mainBoard" name="mainBoard" maxlength="100">
            </div>
            <div class="form-group">
                <label for="gpu">gpu</label>
                <input type="text" id="gpu" name="gpu" maxlength="100">
            </div>
            <div class="form-group">
                <label for="power">power</label>
                <input type="text" id="power" name="power" maxlength="100">
            </div>
            <div class="form-group">
                <label for="bCase">bCase</label>
                <input type="text" id="bCase" name="bCase" maxlength="100">
            </div>
            <div class="form-group">
                <label for="ram">ram</label>
                <input type="text" id="ram" name="ram" maxlength="100">
            </div>
            <div class="form-group">
                <label for="cooler">cooler</label>
                <input type="text" id="cooler" name="cooler" maxlength="100">
            </div>            
            <div class="form-group">
                <label for="computerStock">상품 수량</label>
                <input type="number" id="computerStock" name="computerStock" oninput='handleOnInput(this,5)'>
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
		let computerTitle = $("#computerTitle");
		let computerSalePrice=$("#computerSalePrice");
		let cpu=$("#cpu");
		let ssd=$("#ssd");
		let mainBoard=$("#mainBoard");
		let gpu = $("#gpu");
		let power =$("#power");
		let bCase =$("#bCase");
		let ram = $("#ram");
		let cooler = $("#cooler");
		let computerStock = $("#computerStock");
		
		if(computerTitle.val().trim() == ""){
			alert("제목은 필수 입력 항목 입니다.");
			computerTitle.focus();
			return false;
		}
		if(computerSalePrice.val().trim() == ""){
			alert("상품 가격은 필수 입력 항목 입니다.");
			computerSalePrice.focus();
			return false;
		}
		if(cpu.val().trim() == ""){
			alert("cpu는 필수 입력 항목 입니다.");
			cpu.focus();
			return false;
		}
		if(ssd.val().trim() == ""){
			alert("ssd는 필수 입력 항목 입니다.");
			ssd.focus();
			return false;
		}
		if(mainBoard.val().trim() == ""){
			alert("mainBoard는 필수 입력 항목 입니다.");
			mainBoard.focus();
			return false;
		}
		if(gpu.val().trim() == ""){
			alert("gpu는 필수 입력 항목 입니다.");
			gpu.focus();
			return false;
		}
		if(power.val().trim() == ""){
			alert("power는 필수 입력 항목 입니다.");
			power.focus();
			return false;
		}
		if(bCase.val().trim() == ""){
			alert("bCase는 필수 입력 항목 입니다.");
			bCase.focus();
			return false;
		}
		if(ram.val().trim() == ""){
			alert("ram은 필수 입력 항목 입니다.");
			ram.focus();
			return false;
		}
		if(ram.val().trim() == ""){
			alert("ram은 필수 입력 항목 입니다.");
			ram.focus();
			return false;
		}
		if(cooler.val().trim() == ""){
			alert("cooler은 필수 입력 항목 입니다.");
			cooler.focus();
			return false;
		}
		if(computerStock.val().trim() == ""){
			alert("computerStock은 필수 입력 항목 입니다.");
			computerStock.focus();
			return false;
		}				
		
		return true;
	})
	function handleOnInput(el, maxlength) {
  if(el.value.length > maxlength)  {
    el.value 
      = el.value.substr(0, maxlength);
  }
}
</script>
</html>