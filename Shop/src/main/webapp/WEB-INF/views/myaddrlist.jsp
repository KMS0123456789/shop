<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<c:url value='../resources/css/myaddrlist.css' />" rel="stylesheet">
<link href="<c:url value='../resources/css/mypage.css' />" rel="stylesheet">
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
                <form>
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
                                    <span class="displaynone">
                                        <input id="allCheck" onclick="myshopAddr.checkAll(this)" value="" type="checkbox">
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
                        <tbody class="displaynone center">
                            <tr class="">
                                <td></td>
                                <td>
                                    <a href="" class="btnNormal displaynone">해제</a>
                                    <a href="" class="btnEm displaynone">고정</a>
                                    <span class="displaynone">-</span>
                                </td>
                                <td>
                                    <img src="../resources/image/ico_addr_default.gif" class="displaynone" alt="기본"> </td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td class="left">() </td>
                                    <td>
                                        <a href="#" class="btnNormal ">수정</a>
                                    </td>
                            </tr>
                            <tr class="">
                                <td></td>
                                <td>
                                    <a href="" class="btnNormal displaynone">해제</a>
                                    <a href="" class="btnEm displaynone">고정</a>
                                    <span class="displaynone">-</span>
                                </td>
                                <td>
                                    <img src="../resources/image/ico_addr_default.gif" class="displaynone" alt="기본">
                                </td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td class="left">() </td>
                                <td><a href="#" class="btnNormal ">수정</a></td>
                            </tr>
                        </tbody>
                        <tbody class="">
                            <tr>
                                <td colspan="8" class="message">등록된 주소가 없습니다.</td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="ec-base-button">
                        <span class="gLeft displaynone">
                            <a href="#" class="btn_del">선택 주소록 삭제</a>
                        </span>
                        <span class="gRight">
                            <a href="<c:url value='/user/myaddradd.do'/>" class="btn_ins">배송지등록</a>
                        </span>
                    </div>
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
</body>
</html>