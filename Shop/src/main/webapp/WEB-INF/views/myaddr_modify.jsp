<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<c:url value='/resources/css/myaddradd.css' />" rel="stylesheet">
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
            <form action="<c:url value='/addr/myaddrModify.do'/>" method="post">
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
                                    	<input type="hidden" value="${myaddr.addrUserEmail}" name="addrUserEmail">
                                    	<input type="hidden" value="${myaddr.addrNo}" name="addrNo">
                                        <input id="ma_rcv_title" name="dAddrName" fw-filter="isFill&amp;isMaxByte[90]" fw-label="배송지명" fw-msg="" class="inputTypeText" placeholder="" type="text" value="${myaddr.dAddrName}">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">성명 <img src="../resources/image/ico_required_blue.gif" alt="필수"></th>
                                    <td>
                                        <input id="ma_rcv_name" name="addrUserName" fw-filter="isFill&amp;isMaxByte[90]" fw-label="성명" fw-msg="" class="ec-member-name" placeholder="" value="${myaddr.addrUserName}" type="text">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">주소 <img src="../resources/image/ico_required_blue.gif" alt="필수"></th>
                                    <td>
                                        <input type="text" id="sample6_postcode" placeholder="우편번호" name="addressCode" value="${myaddr.addressCode}" readonly>
                                        <input type="button" onclick="sample6_execDaumPostcode()" value="주소 검색" class="btn"><br>
                                        <input type="text" id="sample6_address" placeholder="주소" name="address" value="${myaddr.address}" readonly><br>
                                        <input type="text" id="sample6_detailAddress" placeholder="상세주소" name="addressDetail" value="${myaddr.addressDetail}">
                                        <input type="text" id="sample6_extraAddress" placeholder="참고항목" name="addressPlus" value="${myaddr.addressPlus}"readonly>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">일반전화 
                                    <span class="displaynone"></span>
                                </th>
                                    <td>
                                        <input id="ma_rcv_phone" name="addrUserLandLine" maxlength="15" fw-filter="isNumber" fw-label="유선전화" fw-alone="N" fw-msg="" value="${myaddr.addrUserLandLine }" type="text">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">휴대전화 
                                        <span class=""><img src="../resources/image/ico_required_blue.gif" alt="필수"></span>
                                    </th>
                                    <td>
                                        <input id="ma_rcv_mobile_no" name="addrUserPhoneNum" oninput="oninputPhone(this)" maxlength="13" fw-filter="isNumber&amp;isFill" fw-label="휴대전화" fw-alone="N" fw-msg="" placeholder="" value="${myaddr.addrUserPhoneNum}" type="text">
                                    </td>
                                </tr>
                                <tr class="right">
                                    <td colspan="2">
                                    	<c:choose>
                                    		<c:when test="${myaddr.addrFlag  == 0}">
                                    			<input id="ma_main_flag0" name="addrFlag" fw-filter="" fw-label="기본 배송지로 저장" fw-msg="" value="0"  type="checkbox" checked onClick="return false">
		                                   		<input type="hidden" name="addrFlag" value="1" id="addr_hidden" >
		                                       	<label for="ma_main_flag0">기본 배송지로 저장</label>
                                    		</c:when>
                                    		<c:otherwise>
	                                    		<input id="ma_main_flag0" name="addrFlag" fw-filter="" fw-label="기본 배송지로 저장" fw-msg="" value="0"  type="checkbox" >
		                                   		<input type="hidden" name="addrFlag" value="1" id="addr_hidden" >
		                                       	<label for="ma_main_flag0">기본 배송지로 저장</label>
                                    		</c:otherwise>
                                    	</c:choose>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="ec-base-button">
                        <span class="gRight">
                        	<button type="submit" class="btnSubmitFix sizeS" >수정</button>
                            <a onclick="history.back()" class="btnNormalFix sizeS" >취소</a>
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
<script type="text/javascript">
	if(document.getElementById("ma_main_flag0").checked) {
	    document.getElementById("addr_hidden").disabled = true;
	}
	
	function oninputPhone(target) {
	    target.value = target.value
	        .replace(/[^0-9]/g, '')
	        .replace(/(^02.{0}|^01.{1}|[0-9]{3,4})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
	}
</script>
<script type="text/javascript">
$("form").submit(function(){
    
    let addrDname = $("#ma_rcv_title");
    let addrUname = $("#ma_rcv_name");
    let addrCode = $("#sample6_postcode");
    let addr = $("#sample6_address");
    let addrDetail =$("#sample6_detailAddress");
    let addrPlus = $("#sample6_extraAddress");
    let addrLand = $("#ma_rcv_phone");
    let addrPhone = $("#ma_rcv_mobile_no");


    if(addrDname.val().trim() == ""){
        alert("배송지명 입력해주세요");
        addrDname.focus();
        return false;
    }


    if(addrUname.val().trim() == ""){
        alert("이름을 입력해주세요");
        addrUname.focus();
        return false;
    }

    if(addrCode.val().trim() == ""){
        alert("우편번호을 입력해주세요");
        return false;
    }

    if(addr.val().trim() == ""){
        alert("주소를 입력해주세요");
        return false;
    }
    
    if(addrDetail.val().trim() == ""){
        alert("상세주소를 입력해주세요");
        return false;
    }
    if( addrPhone.val().trim() == ""){
        alert("휴대전화번호를 입력해주세요");
        addrPhone.focus();
        return false;
    }

    this.submit();
});
</script>
</body>
</html>