<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<c:url value='../resources/css/myaddrlist.css' />" rel="stylesheet">
<link href="<c:url value='../resources/css/mypage.css' />" rel="stylesheet">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<%@ include file="./includes/myheader.jsp" %>
	<div id="mycontainer">
        <div id="contents">
            <div id="mytitle">
                <h2>배송 주소록 관리</h2>
                <p>자주 쓰는 배송지를 등록 관리하실 수 있습니다.</p>
            </div>
            <div id="listtable">
                    <table border="1">
                        <caption>배송 주소록 관리</caption>
                        <colgroup>
                            <col style="width:27px">
                            <col style="width:80px">
                            <col style="width:95px">
                            <col style="width:95px">
                            <col style="width:120px">
                            <col style="width:120px">
                            <col style="width:auto">
                            <col style="width:76px">
                        </colgroup>
                        <thead>
                            <tr>
                                <th scope="col">
                                    <span class="">
                                        <input id="ck_all"  value="" type="checkbox" name="ck_all">
                                    </span>
                                </th>
                                <th scope="col">주소록 고정</th>
                                <th scope="col">배송지명</th>
                                <th scope="col">수령인</th>
                                <th scope="col">일반전화</th>
                                <th scope="col">휴대전화</th>
                                <th scope="col">주소</th>
                                <th scope="col">수정</th>
                            </tr>
                        </thead>
                        <tbody class="displaynones center">
                      	<c:forEach items="${my}" var="my">
                        	<tr class="" data-tr_value="${my.addrNo} ">
                                <td>
                                	<span class="">
                                        <input id="Check" type="checkbox" name="check" value="${my.addrNo}">
                                    </span>
                                </td>
                                <td>
                                    <span class="displaynones">-</span>
                                </td>
                                <td>
                                	<c:if test="${my.addrFlag == 0}">
                                		<img src="../resources/image/ico_addr_default.gif" class="displaynones" alt="기본"> 
                                	</c:if>
                                  	${my.dAddrName}
                                </td>
                                <td>${my.addrUserName}</td>
                                <td>${my.addrUserLandLine}</td>
                                <td>${my.addrUserPhoneNum}</td>
                                <td class="left">(${my.addressCode})${my.address} ${my.addressDetail}</td>
                                <td>
                                	<form action="<c:url value='/addr/myaddrOne.do'/>">
                                		<input type="hidden" value="${my.addrNo}" name="addrNo">
                                		<input type="submit" value="수정" class="btnNormal">
                                	</form>
                                </td>
                            </tr>
                         </c:forEach>
                         <c:if test="${empty my}">
	                        <tbody class="">
	                            <tr>
	                                <td colspan="8" class="message">등록된 주소가 없습니다.</td>
	                            </tr>
	                        </tbody>
                        </c:if>
                    </table>
                    <div class="ec-base-button">
                    	<c:if test="${!empty my}">
	                        <span class="gLeft displaynones">
	                            <button type="button" class="btn_del" onclick="myaddrDelete()">선택 주소록 삭제</button>
	                        </span>
                         </c:if>
                        <span class="gRight">
                            <a href="<c:url value='/addr/myaddradd.do'/>" class="btn_ins">배송지등록</a>
                        </span>
                    </div>
                <form action="" name="deleteForm" method="post">
                	<input type="hidden" name="idList">
                </form>
                <div class="ec-base-help">
                    <h3>배송주소록 유의사항</h3>
                    <div class="inner">
                        <ol>
                            <li class="item1">배송 주소록은 최대 50개까지 등록할 수 있으며, 별도로 등록하지 않을 경우 최근 배송 주소록 기준으로 자동 업데이트 됩니다.</li>
                            <li class="item2">자동 업데이트를 원하지 않을 경우 주소록 고정 선택을 선택하시면 선택된 주소록은 업데이트 대상에서 제외됩니다.</li>
                            <li class="item3">기본 배송지는 1개만 저장됩니다. 다른 배송지를 기본 배송지로 설정하시면 기본 배송지가 변경됩니다.</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
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
    </script>
    <script type="text/javascript">
	function myaddrDelete(){
		var check = [];
			$("input[name='check']:checked").each(function(i){
				check.push($(this).val());
			});
		var arrayParams = {"checkArray": check};
		console.log(arrayParams);
		$.ajax({
	    	url: "<c:url value='/addr/myaddrDelete.do'/>",
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
	}
    </script>
</body>
</html>