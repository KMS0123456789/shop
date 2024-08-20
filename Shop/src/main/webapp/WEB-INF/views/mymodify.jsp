<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link href="<c:url value='/resources/css/mymodify.css' />" rel="stylesheet">
</head>
<body>
<%@ include file="./includes/myheader.jsp" %>
	<div id="container">
        <div id="contents">
            <div id="mytitle">
                <h2>회원 정보 수정</h2>
            </div>
            <div id="typeWrite">
                <form id="mychangedata">
                    <table border="1">
                        <caption>회원 기본 정보</caption>
                        <colgroup>
                            <col style="width: 150px;">
                            <col style="width: auto;">
                        </colgroup>
                        <tbody>
                            <tr class="">
                                <th scope="row">
                                    아이디<img src="../resources/image/ico_required_blue.gif" alt="필수">
                                </th>
                                <td>
                                    <input id="id" name="id" readonly="readonly" value="${my.email }" type="text">
                                    (영문소문자/숫자, 4~16자)
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">비밀번호 <img src="../resources/image/ico_required_blue.gif" class="" alt="필수"></th>
                                <td>
                                    <div class="eTooltip">
                                        <input id="passwd" name="passwd" fw-filter="isMin[4]&amp;isMax[16]" fw-label="비밀번호" fw-msg="" autocomplete="off" maxlength="16" disabled="1" value="" type="password">
                                        <div class="ec-base-tooltip typeUpper ">
                                            <div class="content">
                                                <strong class="txtWarn">※ 비밀번호 입력 조건</strong>
                                                <ul class="ec-base-help typeDash gBlank10 txtWarn">
                                                    - 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자<br>- 입력 가능 특수문자 <br>&nbsp;&nbsp;&nbsp;  ~ ` ! @ # $ % ^ ( ) * _ - = { } [ ] | ; : &lt; &gt; , . ? /<br>- 공백 입력 불가능<br>- 연속된 문자, 숫자 사용 불가능<br>- 동일한 문자, 숫자를 반복해서 사용 불가능<br>- 아이디 포함 불가능
                                                </ul>
                                            </div>
                                            <a href="#none" class="btnClose" tabindex="-1"><img src="../resources/image/btn_close_tip.gif" alt="닫기"></a>
                                            <span class="edge"></span>
                                        </div>
                                    </div>
                                    (영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자)
                                </td>
                            </tr>
                            <tr class="">
                                <th scope="row">
                                    비밀번호 확인 <img src="../resources/image/ico_required_blue.gif" alt="필수">
                                </th>
                                <td>
                                    <input id="repw" name="repw" fw-filter="isMatch[passwd]" fw-label="비밀번호 확인" fw-msg="비밀번호가 일치하지 않습니다." autocomplete="off" maxlength="16" disabled="1" value="" type="password"> <span id="pwConfirmMsg"></span>
                                </td>
                            </tr>
                            <tr class="">
                                <th scope="row" id="">
                                    이름 <img src="../resources/image/ico_required_blue.gif" alt="필수">
                                </th>
                                <td>
                                    <input id="name" name="name" fw-filter="isFill&amp;isMax[30]" fw-label="이름" fw-msg="" class="ec-member-name" placeholder="" maxlength="30" readonly="readonly" value="${my.name }" type="text">
                                </td>
                            </tr>
                            <tr class="">
                                <th scope="row">
                                    주소 <img src="../resources/image/ico_required_blue.gif" class="displaynone" alt="필수">
                                </th>
                                <td>
                                    <input type="text" id="sample6_postcode" placeholder="우편번호">
                                    <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
                                    <input type="text" id="sample6_address" placeholder="주소" value=""><br>
                                    <input type="text" id="sample6_detailAddress" placeholder="상세주소">
                                    <input type="text" id="sample6_extraAddress" placeholder="참고항목">
                                </td>
                            </tr>
                            <tr class="">
                                <th scope="row">
                                    일반전화
                                </th>
                                <td>
                                    <input id="num1" name="phone[]" maxlength="15" fw-filter="isNumber&amp;isNumber" fw-label="일반전화" fw-alone="N" fw-msg="" value="" type="text">
                                </td>
                            </tr>
                            <tr class="">
                                <th scope="row">
                                    휴대전화 <img src="../resources/image/ico_required_blue.gif" class="" alt="필수">
                                </th>
                                <td>
                                    <input id="num1" name="mobile[]" maxlength="13" fw-filter="isNumber&amp;isFill" fw-label="휴대전화" fw-alone="N" fw-msg="" placeholder="" value="${my.phoneNum}" type="text">
                                    <button type="button" class="btnNormal displaynone" id="btn_action_verify_mobile" >인증번호받기</button>
                                    <p class="txtWarn gBlank5 displaynone" id="result_send_verify_mobile_fail"></p>
                                    <ul class="txtInfo gBlank5 displaynone" id="result_send_verify_mobile_success">
                                        <li>인증번호가 발송되었습니다.</li>
                                        <li>인증번호를 받지 못하셨다면 휴대폰 번호를 확인해 주세요.</li>
                                    </ul>
                                </td>
                            </tr>
                            <tr class="">
                                <th scope="row">
                                    SMS 수신여부 <img src="../resources/image/ico_required_blue.gif" alt="필수">
                                </th>
                                <td>
                                    <input id="is_sms0" name="is_sms" fw-filter="isFill" fw-label="is_sms" fw-msg="" value="T" type="radio"><label for="is_sms0">수신함</label>
                                    <input id="is_sms1" name="is_sms" fw-filter="isFill" fw-label="is_sms" fw-msg="" value="F" type="radio" checked="checked"><label for="is_sms1">수신안함</label>
                                    <p>쇼핑몰에서 제공하는 유익한 이벤트 소식을 SMS로 받으실 수 있습니다.</p>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">
                                    이메일 <img src="../resources/image/ico_required_blue.gif" alt="필수">
                                </th>
                                <td>
                                    <input id="email1" name="email1" fw-filter="isFill&amp;isEmail" fw-label="이메일" fw-alone="N" fw-msg="" placeholder="" value="" type="text">
                                    <span id="emailMsg"></span>
                                    <p class="displaynone">이메일 주소 변경 시 로그아웃 후 재인증을 하셔야만 로그인이 가능합니다.<br>
                                        인증 메일은 24시간 동안 유효하며, 유효 시간이 만료된 후에는 가입 정보로 로그인 하셔서 재발송 요청을 해주시기 바랍니다.
                                    </p>
                                </td>
                            </tr>
                            <tr class="">
                                <th scope="row">
                                    이메일 수신여부 <img src="../resources/image/ico_required_blue.gif" alt="필수">
                                </th>
                                <td>
                                    <input id="is_news_mail0" name="is_news_mail" fw-filter="isFill" fw-label="is_news_mail" fw-msg="" value="T" type="radio"><label for="is_news_mail0">수신함</label>
                                    <input id="is_news_mail1" name="is_news_mail" fw-filter="isFill" fw-label="is_news_mail" fw-msg="" value="F" type="radio" checked="checked"><label for="is_news_mail1">수신안함</label>
                                    <p>쇼핑몰에서 제공하는 유익한 이벤트 소식을 이메일로 받으실 수 있습니다.</p>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="btns">
                    <a href="#" class="btn_submit">회원정보수정</a>
                    <a href="<c:url value='/user/mypage.do'/>" class="btn_cancel">취소</a>
                    <span class="gRight">
                        <a href="#" class="btn_x">회원탈퇴</a>
                    </span>
                </div>
            </form>
        </div>
    </div>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        function sample6_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
    
                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수
    
                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }
    
                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if(data.userSelectedType === 'R'){
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraAddr !== ''){
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("sample6_extraAddress").value = extraAddr;
                    
                    } else {
                        document.getElementById("sample6_extraAddress").value = '';
                    }
    
                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('sample6_postcode').value = data.zonecode;
                    document.getElementById("sample6_address").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("sample6_detailAddress").focus();
                }
            }).open();
        }
    </script>
</body>
</html>