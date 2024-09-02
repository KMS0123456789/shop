<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>위시리스트</title>
    <link href="<c:url value='/resources/css/keep.css' />" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<%@ include file="./includes/myheader.jsp" %>
    <div class="container">
        <h1>위시리스트</h1>
        <div class="cart-content" style="width:1200px">
            <div class="cart-items">
                <table>
                    <thead>
                        <tr>
                            <th><input id="ck_all"  value="" type="checkbox" name="ck_all"></th>
                            <th style="text-align: center">주문상품정보</th>
                            <th style="text-align: center">수량</th>
                            <th style="text-align: center">가격</th>
                        </tr>
                    </thead>
                    <tbody>
					    <c:forEach items="${keep}" var="keep">
					    	<c:forEach items="${keep.computers}" var="computer">
					    		<tr>
						            <td>
						           		<input type="checkbox" class="item-checkbox" name="check" value="${keep.keepNo}">
						            </td>
						            <td class="product-info">
						            	<c:forEach items="${keep.files}" var="file">
						            		 <img src="<c:url value='${file.filePath}' />" alt="Product">
						            	</c:forEach>
						                <div>
						                    <h3>
						                        <a href="<c:url value='/computer/computer.do/${comptuer.computerNo}'/>">${computer.computerTitle}</a>
						                    </h3>
						                </div>
						            </td>
						            <td>
						                <div class="quantity-control">
						                    <p>1</p>
						                </div>
						            </td>
						            <td class="price">
						                <strong>
						                    <fmt:formatNumber value="${computer.computerSalePrice}" type="number" pattern="#,###"/>원
						                </strong>
						            </td>
						            <td>
						            	<button class="btn-remove" value="${keep.keepNo}" onclick="keepDelete(${keep.keepNo})">×</button>
						            </td>
						        </tr>
					    	</c:forEach>
					    	<c:forEach items="${keep.peripherals}" var="peripheral">
					    		<tr data-cart-no="${keep.keepNo}">
						            <td>
						            	<input type="checkbox" class="item-checkbox" name="check" value="${keep.keepNo}">
						            </td>
						            <td class="product-info">
						            	<c:forEach items="${keep.files}" var="file">
						            		 <img class="keep_image" src="<c:url value='${file.filePath}' />" alt="Product">
						            	</c:forEach>
						                <div>
						                    <h3>
						                        <a href="<c:url value='/peripheral/peripheral.do/${peripheral.peripheralNo}'/>">${peripheral.peripheralTitle}</a>
						                    </h3>
						                </div>
						            </td>
						            <td>
						                <div class="quantity-control">
						                    <p>1</p>
						                </div>
						            </td>
						            <td class="price">
						                <strong>
						                    <fmt:formatNumber value="${peripheral.peripheralSalePrice}" type="number" pattern="#,###"/>원
						                </strong>
						            </td>
						            <td>
						            	<button class="btn-remove" value="${keep.keepNo}" onclick="keepDelete(${keep.keepNo})">×</button>
						            </td>
						        </tr>
					    	</c:forEach>
					    </c:forEach>
					</tbody>
                </table>
                <div class="cart-actions">
                    <button class="btn-delete-selected" onclick="keepSelectDelete()">선택상품 삭제</button>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
	$(document).ready(function(){
	    //체크박스 전체 선택&해제
	    $('#ck_all').click(function(){
	         if($("#ck_all").prop("checked")){
	            $("input[type=checkbox]").prop("checked",true); 
	        }else{
	            $("input[type=checkbox]").prop("checked",false); 
	        }
		});       
	});
	
	function keepDelete(keepNo){
		console.log(keepNo)
		$.ajax({
	    	url: "<c:url value='/keep/keepDelete.do'/>",
	    	type: "POST",
	    	data: {"keepNo" : keepNo},
	    	success:function(keepNo){
	    		alert("완료!");
	    		document.location.href = document.location.href;      
			},
			error:function(jqXHR, textStatus, errorThrown){
				alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
			}
	    })
	};
	
	
	function keepSelectDelete(){
		var check = [];
			$("input[name='check']:checked").each(function(i){
				check.push($(this).val());
			});
		var arrayParams = {"checkArray": check};
		$.ajax({
	    	url: "<c:url value='/keep/keepSelectDelete.do'/>",
	    	type: "POST",
	    	data: arrayParams,
	    	success:function(arrayParams){
	    		alert("완료!");
	    		document.location.href = document.location.href;
				self.close();        
			},
			error:function(jqXHR, textStatus, errorThrown){
				alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
				self.close();
			}
	    })
	};
</script>
</html>
