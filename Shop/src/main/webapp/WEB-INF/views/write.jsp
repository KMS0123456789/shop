<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <form action="write.do" method="post" enctype="multipart/form-data">
		<div>
		    상품 분류
		    <select id="categoryNo" name="categoryNo" class="category" >
		        <option>완제품 컴퓨터</option>
		        <option>마우스</option>
		        <option>키보드</option>
		        <option>모니터</option>
		    </select>
		    <table border="1px">
		        <tbody>
		            <tr>
		                <td>상품명</td>
		                <td></td>
		            </tr>
		            <tr>
		                <td>상품가격</td>
		                <td></td>
		            </tr>
		            <tr>
		                <td>상품 수량</td>
		                <td></td>
		            </tr>
		        </tbody>
		    </table>
	    </div>
		    <div class="form-group">
		        <label for="body">상품 소개</label>
		        <textarea id="body" name="body"></textarea>
		    </div>
			    <div class="form-group" id="fileDiv">
			        <label for="file">첨부파일</label>
			        <input type="file" accept="image/*" multiple id="file" name="file">
			    </div>
			    <div>
			        <img id="previewImg" onclick="popImage(this.src)">
			    </div>	
	    <div class="footer">
	        <button type="submit" class="button">상품 등록하기</button>
	        <a onclick="history.back()" class="button">취소</a>
	    </div>
    </form>
</body>
</html>