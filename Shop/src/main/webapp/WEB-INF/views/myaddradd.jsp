<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<c:url value='/resources/css/myaddradd.css' />" rel="stylesheet">
</head>
<body>
<%@ include file="./includes/myheader.jsp" %>
	<div id="mycontainer">
        <div id="contents">
            <div id="mytitle">
                <h2>배송 주소록 관리</h2>
                <p>자주 쓰는 배송지를 등록 관리하실 수 있습니다.</p>
            </div>
            <form>
                <div id="new">
                    <div id="table">
                        <table border="1">
                            <caption>배송 주소록 입력</caption>
                            <colgroup>
                                <col style="width:120px">
                                <col style="width:auto">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"> 배송지명 
                                        <img src="../resources/image/ico_required_blue.gif" alt="필수">
                                    </th>
                                    <td>
                                        <input id="ma_rcv_title" name="ma_rcv_title" fw-filter="isFill&amp;isMaxByte[90]" fw-label="배송지명" fw-msg="" class="inputTypeText" placeholder="" value="" type="text">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">성명 <img src="../resources/image/ico_required_blue.gif" alt="필수"></th>
                                    <td>
                                        <input id="ma_rcv_name" name="ma_rcv_name" fw-filter="isFill&amp;isMaxByte[90]" fw-label="성명" fw-msg="" class="ec-member-name" placeholder="" value="" type="text">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">주소 <img src="../resources/image/ico_required_blue.gif" alt="필수"></th>
                                    <td>
                                        <input type="text" id="sample6_postcode" placeholder="우편번호">
                                        <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
                                        <input type="text" id="sample6_address" placeholder="주소"><br>
                                        <input type="text" id="sample6_detailAddress" placeholder="상세주소">
                                        <input type="text" id="sample6_extraAddress" placeholder="참고항목">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">일반전화 
                                    <span class="displaynone"></span>
                                </th>
                                    <td>
                                        <select id="ma_rcv_phone1" name="ma_rcv_phone[]" fw-filter="isNumber" fw-label="유선전화" fw-alone="N" fw-msg="">
                                            <option value="02">02</option>
                                            <option value="031">031</option>
                                            <option value="032">032</option>
                                            <option value="033">033</option>
                                            <option value="041">041</option>
                                            <option value="042">042</option>
                                            <option value="043">043</option>
                                            <option value="044">044</option>
                                            <option value="051">051</option>
                                            <option value="052">052</option>
                                            <option value="053">053</option>
                                            <option value="054">054</option>
                                            <option value="055">055</option>
                                            <option value="061">061</option>
                                            <option value="062">062</option>
                                            <option value="063">063</option>
                                            <option value="064">064</option>
                                            <option value="0502">0502</option>
                                            <option value="0503">0503</option>
                                            <option value="0504">0504</option>
                                            <option value="0505">0505</option>
                                            <option value="0506">0506</option>
                                            <option value="0507">0507</option>
                                            <option value="070">070</option>
                                            <option value="010">010</option>
                                            <option value="011">011</option>
                                            <option value="016">016</option>
                                            <option value="017">017</option>
                                            <option value="018">018</option>
                                            <option value="019">019</option>
                                            <option value="0508">0508</option>
                                        </select>
                                        <input id="ma_rcv_phone2" name="ma_rcv_phone[]" maxlength="4" fw-filter="isNumber" fw-label="유선전화" fw-alone="N" fw-msg="" value="" type="text">
                                        <input id="ma_rcv_phone3" name="ma_rcv_phone[]" maxlength="4" fw-filter="isNumber" fw-label="유선전화" fw-alone="N" fw-msg="" value="" type="text">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">휴대전화 
                                        <span class=""><img src="../resources/image/ico_required_blue.gif" alt="필수"></span>
                                    </th>
                                    <td>
                                        <select id="ma_rcv_mobile_no1" name="ma_rcv_mobile_no[]" fw-filter="isNumber&amp;isFill" fw-label="휴대전화" fw-alone="N" fw-msg="">
                                            <option value="010">010</option>
                                            <option value="011">011</option>
                                            <option value="016">016</option>
                                            <option value="017">017</option>
                                            <option value="018">018</option>
                                            <option value="019">019</option>
                                        </select>
                                        <input id="ma_rcv_mobile_no2" name="ma_rcv_mobile_no[]" maxlength="4" fw-filter="isNumber&amp;isFill" fw-label="휴대전화" fw-alone="N" fw-msg="" placeholder="" value="" type="text">-
                                        <input id="ma_rcv_mobile_no3" name="ma_rcv_mobile_no[]" maxlength="4" fw-filter="isNumber&amp;isFill" fw-label="휴대전화" fw-alone="N" fw-msg="" placeholder="" value="" type="text">
                                    </td>
                                </tr>
                                <tr class="right">
                                    <td colspan="2">
                                        <input id="ma_main_flag0" name="ma_main_flag" fw-filter="" fw-label="기본 배송지로 저장" fw-msg="" value="T" type="checkbox">
                                        <label for="ma_main_flag0">기본 배송지로 저장</label>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="ec-base-button">
                        <span class="gRight">
                            <a href="#none" class="btnSubmitFix sizeS" onclick="myshopAddr.formCheck();">등록</a>
                            <a href="list.html" class="btnNormalFix sizeS">취소</a>
                        </span>
                    </div>
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