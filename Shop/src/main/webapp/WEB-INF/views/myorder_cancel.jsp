<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<c:url value='/resources/css/myorder.css' />" rel="stylesheet">
<style>
	#order2{
		background: black;
		color:white;
	}
</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
</head>
<body>
<%@ include file="./includes/myheader.jsp" %>
	<div id="mycontents">
        <div id="myortitle">
            <h2>주문 조회</h2>
        </div>
        <div id="myordermenu">
            <ul class="myordermenu">
                <li id="ormenu">
               		<form action="<c:url value='/ask/myorder.do'/>" method="get">
                		<input type="hidden" value="${sessionScope.user.email}" name="askUser">
                 		<button type="submit" id="order"> 주문 내역 조회</button>
                	</form>
                </li>
                <li id="ormenu">
                	<form action="<c:url value='/ask/myorder_cancel.do'/>" method="get">
                		<input type="hidden" value="${sessionScope.user.email}" name="askUser">
                 		<button type="submit" id="order2"> 취소/교환 내역</button>
                	</form>
                </li>
            </ul>
        </div>
        <div id="field">
            <form>
                <fieldset id="datecase">
                    <legend>검색기간 설정</legend>
                    <span id="date">
                        <a href="<c:url value='/askdetail/myOnecanceldate.do'/>" class="btnNormal" days="00"><img src="../resources/image/btn_date1.gif" alt="오늘"></a>
                        <a href="<c:url value='/askdetail/myOnecancelweek.do'/>" class="btnNormal" days="07"><img src="../resources/image/btn_date2.gif" alt="1주일"></a>
                        <a href="<c:url value='/askdetail/myOnemonthcancel.do'/>" class="btnNormal" days="30"><img src="../resources/image/btn_date3.gif" alt="1개월"></a>
                        <a href="<c:url value='/askdetail/myThreemonthcancel.do'/>" class="btnNormal" days="90"><img src="../resources/image/btn_date4.gif" alt="3개월"></a>
                        <a href="<c:url value='/askdetail/mySixmonthcancel.do'/>" class="btnNormal" days="180"><img src="../resources/image/btn_date5.gif" alt="6개월"></a>
                    </span>
                </fieldset>
                <ul id="order_infor">
                    <li class=" ">기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 주문처리완료 후 36개월 이내의 주문내역을 조회하실 수 있습니다.</li>
                    <li>주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.</li>
                </ul>
                <input id="mode" name="mode" value="" type="hidden">
                <input id="term" name="term" value="" type="hidden">
            </form>
        </div>
        <div id="order_contents">
            <div id="order_title"><h3>주문 상품 정보</h3></div>
            <table border="1" id="or_table">
                <colgroup>
                    <col style="width:135px;">
                    <col style="width:93px;">
                    <col style="width:auto;">
                    <col style="width:61px;">
                    <col style="width:111px;">
                    <col style="width:111px;">
                    <col style="width:111px;">
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col">주문일자<br>[주문번호]</th>
                        <th scope="col">이미지</th>
                        <th scope="col">상품정보</th>
                        <th scope="col">수량</th>
                        <th scope="col">상품구매금액</th>
                        <th scope="col">주문처리상태</th>
                        <th scope="col">취소/교환</th>
                    </tr>
                </thead>
                <c:forEach items="${canceldate}" var="date">
               		<tbody>
		               	<tr>
		                	<td>
		                		<c:forEach items="${date.asks }" var="ask">
			                		${ask.askDate }<br>
			                		${ask.askNo }
		                		 </c:forEach>
		                	</td>
		               		<td>
			               		<c:forEach items="${date.files }" var="file">
			               			<img src="<c:url value="${file.filePath}"/>" style="width: 50px">
			               		</c:forEach>
		               		</td>
		               <c:if test="${date.computerNo ge 1 }">
	                    	<c:forEach items="${date.computers }" var="com">
	                    		<td>${com.computerTitle} <br>
			                    	옵션:
			                    	SSD ${date.ssdName != null ? date.ssdName : '미포함'}, 
			                    	HDD ${date.hddName != null ? date.hddName : '미포함'}, 
			                    	OS ${date.osName != null ? date.osName : '미포함'}
		                    	</td>
		                   	</c:forEach>
	                    	<td>${date.itemCount}</td>	                    
		                    <td>
	                    		<c:forEach items="${date.computers }" var="com">
	                    			<f:formatNumber type="number" pattern="#,###" value="${com.computerSalePrice }"/>원
	                    		</c:forEach>
		                    </td>
	                    </c:if>
	                    <c:if test="${date.peripheralNo ge 1 }">
	                    	<c:forEach items="${date.peripherals }" var="per">
			                    <td>${per.peripheralTitle }</td>
			                    <td>${date.itemCount}</td>
		                    	<td>
		                    		<f:formatNumber type="number" pattern="#,###" value="${per.peripheralSalePrice }"/>원
		                    	</td>
		                    </c:forEach>
	                    </c:if>
		                <c:forEach items="${date.asks }" var="asks">
		                   	<c:if test="${asks.askStateFlag  == 1}">
		                    	<td>결제 완료</td>
		                    </c:if>
		                    <c:if test="${asks.askStateFlag  == 3}">
		                    	<td>배송 완료</td>
		                    </c:if>		                   
		                    <c:if test="${asks.askDeleteFlag == 1}">
		                    	 <td>취소</td>
		                    </c:if>
		                    <c:if test="${asks.askDeleteFlag == 2}">
		                    	 <td>교환 신청중</td>
		                    </c:if>
		                    <c:if test="${asks.askDeleteFlag == 3}">
		                    	 <td>교환 진행중</td>
		                    </c:if>
		                    <c:if test="${asks.askDeleteFlag == 4}">
		                    	 <td>교환 완료</td>
		                    </c:if>
		                </c:forEach>
		                </tr>
	                </tbody>
                </c:forEach>
                <c:forEach items="${cancelweek}" var="week">
                	<tbody>
		               	<tr>
		                	<td>
		                		<c:forEach items="${week.asks }" var="ask">
			                		${ask.askDate }<br>
			                		${ask.askNo }
		                		 </c:forEach>
		                	</td>
		               		<td>
			               		<c:forEach items="${week.files }" var="file">
			               			<img src="<c:url value="${file.filePath}"/>" style="width: 50px">
			               		</c:forEach>
		               		</td>
		               <c:if test="${week.computerNo ge 1 }">
	                    	<c:forEach items="${week.computers }" var="com">
	                    		<td>${com.computerTitle} <br>
			                    	옵션:
			                    	SSD ${week.ssdName != null ? week.ssdName : '미포함'}, 
			                    	HDD ${week.hddName != null ? week.hddName : '미포함'}, 
			                    	OS ${week.osName != null ? week.osName : '미포함'}
		                    	</td>
		                   	</c:forEach>
	                    	<td>${week.itemCount}</td>	                    
		                    <td>
	                    		<c:forEach items="${week.computers }" var="com">
	                    			<f:formatNumber type="number" pattern="#,###" value="${com.computerSalePrice }"/>원
	                    		</c:forEach>
		                    </td>
	                    </c:if>
	                    <c:if test="${week.peripheralNo ge 1 }">
	                    	<c:forEach items="${week.peripherals }" var="per">
			                    <td>${per.peripheralTitle }</td>
			                    <td>${week.itemCount}</td>
		                    	<td>
		                    		<f:formatNumber type="number" pattern="#,###" value="${per.peripheralSalePrice }"/>원
		                    	</td>
		                    </c:forEach>
	                    </c:if>
		                <c:forEach items="${week.asks }" var="asks">
		                   	<c:if test="${asks.askStateFlag  == 1}">
		                    	<td>결제 완료</td>
		                    </c:if>
		                    <c:if test="${asks.askStateFlag  == 3}">
		                    	<td>배송 완료</td>
		                    </c:if>		                   
		                    <c:if test="${asks.askDeleteFlag == 1}">
		                    	 <td>취소</td>
		                    </c:if>
		                    <c:if test="${asks.askDeleteFlag == 2}">
		                    	 <td>교환 신청중</td>
		                    </c:if>
		                    <c:if test="${asks.askDeleteFlag == 3}">
		                    	 <td>교환 진행중</td>
		                    </c:if>
		                    <c:if test="${asks.askDeleteFlag == 4}">
		                    	 <td>교환 완료</td>
		                    </c:if>
		                </c:forEach>
		                </tr>
	                </tbody>
                </c:forEach>
                <c:forEach items="${cancelmonth }" var="month">
                	<tbody>
		               	<tr>
		                	<td>
		                		<c:forEach items="${month.asks }" var="ask">
			                		${ask.askDate }<br>
			                		${ask.askNo }
		                		 </c:forEach>
		                	</td>
		               		<td>
			               		<c:forEach items="${month.files }" var="file">
			               			<img src="<c:url value="${file.filePath}"/>" style="width: 50px">
			               		</c:forEach>
		               		</td>
		               <c:if test="${month.computerNo ge 1 }">
	                    	<c:forEach items="${month.computers }" var="com">
	                    		<td>${com.computerTitle} <br>
			                    	옵션:
			                    	SSD ${month.ssdName != null ? month.ssdName : '미포함'}, 
			                    	HDD ${month.hddName != null ? month.hddName : '미포함'}, 
			                    	OS ${month.osName != null ? month.osName : '미포함'}
		                    	</td>
		                   	</c:forEach>
	                    	<td>${month.itemCount}</td>	                    
		                    <td>
	                    		<c:forEach items="${month.computers }" var="com">
	                    			<f:formatNumber type="number" pattern="#,###" value="${com.computerSalePrice }"/>원
	                    		</c:forEach>
		                    </td>
	                    </c:if>
	                    <c:if test="${month.peripheralNo ge 1 }">
	                    	<c:forEach items="${month.peripherals }" var="per">
			                    <td>${per.peripheralTitle }</td>
			                    <td>${month.itemCount}</td>
		                    	<td>
		                    		<f:formatNumber type="number" pattern="#,###" value="${per.peripheralSalePrice }"/>원
		                    	</td>
		                    </c:forEach>
	                    </c:if>
		                <c:forEach items="${month.asks }" var="asks">
		                   	<c:if test="${asks.askStateFlag  == 1}">
		                    	<td>결제 완료</td>
		                    </c:if>
		                    <c:if test="${asks.askStateFlag  == 3}">
		                    	<td>배송 완료</td>
		                    </c:if>		                   
		                    <c:if test="${asks.askDeleteFlag == 1}">
		                    	 <td>취소</td>
		                    </c:if>
		                    <c:if test="${asks.askDeleteFlag == 2}">
		                    	 <td>교환 신청중</td>
		                    </c:if>
		                    <c:if test="${asks.askDeleteFlag == 3}">
		                    	 <td>교환 진행중</td>
		                    </c:if>
		                    <c:if test="${asks.askDeleteFlag == 4}">
		                    	 <td>교환 완료</td>
		                    </c:if>
		                </c:forEach>
		                </tr>
	                </tbody>
                </c:forEach>
                <c:forEach items="${cancelThreemonth }" var="three">
                	<tbody>
		               	<tr>
		                	<td>
		                		<c:forEach items="${three.asks }" var="ask">
			                		${ask.askDate }<br>
			                		${ask.askNo }
		                		 </c:forEach>
		                	</td>
		               		<td>
			               		<c:forEach items="${three.files }" var="file">
			               			<img src="<c:url value="${file.filePath}"/>" style="width: 50px">
			               		</c:forEach>
		               		</td>
		               <c:if test="${three.computerNo ge 1 }">
	                    	<c:forEach items="${three.computers }" var="com">
	                    		<td>${com.computerTitle} <br>
			                    	옵션:
			                    	SSD ${three.ssdName != null ? three.ssdName : '미포함'}, 
			                    	HDD ${three.hddName != null ? three.hddName : '미포함'}, 
			                    	OS ${three.osName != null ? three.osName : '미포함'}
		                    	</td>
		                   	</c:forEach>
	                    	<td>${three.itemCount}</td>	                    
		                    <td>
	                    		<c:forEach items="${three.computers }" var="com">
	                    			<f:formatNumber type="number" pattern="#,###" value="${com.computerSalePrice }"/>원
	                    		</c:forEach>
		                    </td>
	                    </c:if>
	                    <c:if test="${three.peripheralNo ge 1 }">
	                    	<c:forEach items="${three.peripherals }" var="per">
			                    <td>${per.peripheralTitle }</td>
			                    <td>${three.itemCount}</td>
		                    	<td>
		                    		<f:formatNumber type="number" pattern="#,###" value="${per.peripheralSalePrice }"/>원
		                    	</td>
		                    </c:forEach>
	                    </c:if>
		                <c:forEach items="${three.asks }" var="asks">
		                   	<c:if test="${asks.askStateFlag  == 1}">
		                    	<td>결제 완료</td>
		                    </c:if>
		                    <c:if test="${asks.askStateFlag  == 3}">
		                    	<td>배송 완료</td>
		                    </c:if>		                   
		                    <c:if test="${asks.askDeleteFlag == 1}">
		                    	 <td>취소</td>
		                    </c:if>
		                    <c:if test="${asks.askDeleteFlag == 2}">
		                    	 <td>교환 신청중</td>
		                    </c:if>
		                    <c:if test="${asks.askDeleteFlag == 3}">
		                    	 <td>교환 진행중</td>
		                    </c:if>
		                    <c:if test="${asks.askDeleteFlag == 4}">
		                    	 <td>교환 완료</td>
		                    </c:if>
		                </c:forEach>
		                </tr>
	                </tbody>
                </c:forEach>
                <c:forEach items="${cancelSixmonth }" var="six">
                	<tbody>
		               	<tr>
		                	<td>
		                		<c:forEach items="${six.asks }" var="ask">
			                		${ask.askDate }<br>
			                		${ask.askNo }
		                		 </c:forEach>
		                	</td>
		               		<td>
			               		<c:forEach items="${six.files }" var="file">
			               			<img src="<c:url value="${file.filePath}"/>" style="width: 50px">
			               		</c:forEach>
		               		</td>
		               <c:if test="${six.computerNo ge 1 }">
	                    	<c:forEach items="${six.computers }" var="com">
	                    		<td>${com.computerTitle} <br>
			                    	옵션:
			                    	SSD ${six.ssdName != null ? six.ssdName : '미포함'}, 
			                    	HDD ${six.hddName != null ? six.hddName : '미포함'}, 
			                    	OS ${six.osName != null ? six.osName : '미포함'}
		                    	</td>
		                   	</c:forEach>
	                    	<td>${six.itemCount}</td>	                    
		                    <td>
	                    		<c:forEach items="${six.computers }" var="com">
	                    			<f:formatNumber type="number" pattern="#,###" value="${com.computerSalePrice }"/>원
	                    		</c:forEach>
		                    </td>
	                    </c:if>
	                    <c:if test="${six.peripheralNo ge 1 }">
	                    	<c:forEach items="${six.peripherals }" var="per">
			                    <td>${per.peripheralTitle }</td>
			                    <td>${six.itemCount}</td>
		                    	<td>
		                    		<f:formatNumber type="number" pattern="#,###" value="${per.peripheralSalePrice }"/>원
		                    	</td>
		                    </c:forEach>
	                    </c:if>
		                <c:forEach items="${six.asks }" var="asks">
		                   	<c:if test="${asks.askStateFlag  == 1}">
		                    	<td>결제 완료</td>
		                    </c:if>
		                    <c:if test="${asks.askStateFlag  == 3}">
		                    	<td>배송 완료</td>
		                    </c:if>		                   
		                    <c:if test="${asks.askDeleteFlag == 1}">
		                    	 <td>취소</td>
		                    </c:if>
		                    <c:if test="${asks.askDeleteFlag == 2}">
		                    	 <td>교환 신청중</td>
		                    </c:if>
		                    <c:if test="${asks.askDeleteFlag == 3}">
		                    	 <td>교환 진행중</td>
		                    </c:if>
		                    <c:if test="${asks.askDeleteFlag == 4}">
		                    	 <td>교환 완료</td>
		                    </c:if>
		                </c:forEach>
		                </tr>
	                </tbody>
                </c:forEach>
            </table>
          	<c:if test="${cancelweek == null and canceldate == null and cancelmonth ==null and cancelThreemonth == null and cancelSixmonth == null}">
            	<p class="message ">주문 내역이 없습니다.</p>
            </c:if>
            <div id="page">
                <c:if test="${canceldate != null}">
	                <f:parseNumber integerOnly="true" var="pageGroup" value="${(currentPage - 1) / 10}" />
					<c:set var="startPage" value="${(pageGroup * 10 + 1)}"></c:set>
					<c:set var="endPage" value="${(startPage + (10 - 1))}"></c:set>
						<c:if test="${currentPage > 1}">
							<a class="first" href="<c:url value="/askdetail/myOnecanceldate.do?email=${email}&page=1" />">&lt;&lt;</a>
							<a class="prev" href="<c:url value="/askdetail/myOnecanceldate.do?email=${email}&page=${currentPage-1}" />">&lt;</a>
						</c:if>
					<c:forEach begin="${startPage}" end="${endPage > totalPage ? totalPage : endPage}" var="pageNum">
						<c:choose>
							<c:when test="${currentPage == pageNum}">
								<a>${pageNum}</a>
							</c:when>
							<c:otherwise>
								<a href="<c:url value="/askdetail/myOnecanceldate.do?email=${email}&page=${pageNum}" />">${pageNum}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${currentPage < totalPage}">
						<a class="next" href="<c:url value="/askdetail/myOnecanceldate.do?email=${email}&page=${currentPage+1}" />">&gt;</a>
						<a class="last" href="<c:url value="/askdetail/myOnecanceldate.do?email=${email}&page=${totalPage}" />">&gt;&gt;</a>
					</c:if>
				</c:if>
            </div>
            <div id="page">
                <c:if test="${cancelweek != null}">
	                <f:parseNumber integerOnly="true" var="pageGroup" value="${(currentPage - 1) / 10}" />
					<c:set var="startPage" value="${(pageGroup * 10 + 1)}"></c:set>
					<c:set var="endPage" value="${(startPage + (10 - 1))}"></c:set>
						<c:if test="${currentPage > 1}">
							<a class="first" href="<c:url value="/askdetail/myOnecancelweek.do?email=${email}&page=1" />">&lt;&lt;</a>
							<a class="prev" href="<c:url value="/askdetail/myOnecancelweek.do?email=${email}&page=${currentPage-1}" />">&lt;</a>
						</c:if>
					<c:forEach begin="${startPage}" end="${endPage > totalPage ? totalPage : endPage}" var="pageNum">
						<c:choose>
							<c:when test="${currentPage == pageNum}">
								<a>${pageNum}</a>
							</c:when>
							<c:otherwise>
								<a href="<c:url value="/askdetail/myOnecancelweek.do?email=${email}&page=${pageNum}" />">${pageNum}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${currentPage < totalPage}">
						<a class="next" href="<c:url value="/askdetail/myOnecancelweek.do?email=${email}&page=${currentPage+1}" />">&gt;</a>
						<a class="last" href="<c:url value="/askdetail/myOnecancelweek.do?email=${email}&page=${totalPage}" />">&gt;&gt;</a>
					</c:if>
				</c:if>
            </div>
            <div id="page">
                <c:if test="${cancelmonth != null}">
	                <f:parseNumber integerOnly="true" var="pageGroup" value="${(currentPage - 1) / 10}" />
					<c:set var="startPage" value="${(pageGroup * 10 + 1)}"></c:set>
					<c:set var="endPage" value="${(startPage + (10 - 1))}"></c:set>
						<c:if test="${currentPage > 1}">
							<a class="first" href="<c:url value="/askdetail/myOnemonthcancel.do?email=${email}&page=1" />">&lt;&lt;</a>
							<a class="prev" href="<c:url value="/askdetail/myOnemonthcancel.do?email=${email}&page=${currentPage-1}" />">&lt;</a>
						</c:if>
					<c:forEach begin="${startPage}" end="${endPage > totalPage ? totalPage : endPage}" var="pageNum">
						<c:choose>
							<c:when test="${currentPage == pageNum}">
								<a>${pageNum}</a>
							</c:when>
							<c:otherwise>
								<a href="<c:url value="/askdetail/myOnemonthcancel.do?email=${email}&page=${pageNum}" />">${pageNum}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${currentPage < totalPage}">
						<a class="next" href="<c:url value="/askdetail/myOnemonthcancel.do?email=${email}&page=${currentPage+1}" />">&gt;</a>
						<a class="last" href="<c:url value="/askdetail/myOnemonthcancel.do?email=${email}&page=${totalPage}" />">&gt;&gt;</a>
					</c:if>
				</c:if>
            </div>
            <div id="page">
                <c:if test="${cancelThreemonth != null}">
	                <f:parseNumber integerOnly="true" var="pageGroup" value="${(currentPage - 1) / 10}" />
					<c:set var="startPage" value="${(pageGroup * 10 + 1)}"></c:set>
					<c:set var="endPage" value="${(startPage + (10 - 1))}"></c:set>
						<c:if test="${currentPage > 1}">
							<a class="first" href="<c:url value="/askdetail/myThreemonthcancel.do.do?email=${email}&page=1" />">&lt;&lt;</a>
							<a class="prev" href="<c:url value="/askdetail/myThreemonthcancel.do.do?email=${email}&page=${currentPage-1}" />">&lt;</a>
						</c:if>
					<c:forEach begin="${startPage}" end="${endPage > totalPage ? totalPage : endPage}" var="pageNum">
						<c:choose>
							<c:when test="${currentPage == pageNum}">
								<a>${pageNum}</a>
							</c:when>
							<c:otherwise>
								<a href="<c:url value="/askdetail/myThreemonthcancel.do.do?email=${email}&page=${pageNum}" />">${pageNum}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${currentPage < totalPage}">
						<a class="next" href="<c:url value="/askdetail/myThreemonthcancel.do.do?email=${email}&page=${currentPage+1}" />">&gt;</a>
						<a class="last" href="<c:url value="/askdetail/myThreemonthcancel.do.do?email=${email}&page=${totalPage}" />">&gt;&gt;</a>
					</c:if>
				</c:if>
            </div>
            <div id="page">
                <c:if test="${cancelSixmonth != null}">
	                <f:parseNumber integerOnly="true" var="pageGroup" value="${(currentPage - 1) / 10}" />
					<c:set var="startPage" value="${(pageGroup * 10 + 1)}"></c:set>
					<c:set var="endPage" value="${(startPage + (10 - 1))}"></c:set>
						<c:if test="${currentPage > 1}">
							<a class="first" href="<c:url value="/askdetail/myThreemonthcancel.do.do?email=${email}&page=1" />">&lt;&lt;</a>
							<a class="prev" href="<c:url value="/askdetail/myThreemonthcancel.do.do?email=${email}&page=${currentPage-1}" />">&lt;</a>
						</c:if>
					<c:forEach begin="${startPage}" end="${endPage > totalPage ? totalPage : endPage}" var="pageNum">
						<c:choose>
							<c:when test="${currentPage == pageNum}">
								<a>${pageNum}</a>
							</c:when>
							<c:otherwise>
								<a href="<c:url value="/askdetail/myThreemonthcancel.do.do?email=${email}&page=${pageNum}" />">${pageNum}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${currentPage < totalPage}">
						<a class="next" href="<c:url value="/askdetail/myThreemonthcancel.do.do?email=${email}&page=${currentPage+1}" />">&gt;</a>
						<a class="last" href="<c:url value="/askdetail/myThreemonthcancel.do.do?email=${email}&page=${totalPage}" />">&gt;&gt;</a>
					</c:if>
				</c:if>
            </div>
        </div>
    </div>
    <script type="text/javascript">
    	/* 설정 */
    	$(function(){
    		/* 캘린더 */
	    	  $('#start_date').datepicker({
	    			dateFormat: 'yy-mm-dd',
	  	    		prevText: '이전 달',
	  	   		    nextText: '다음 달',
	  	   		    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	  	   		    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	  	   		    dayNames: ['일','월','화','수','목','금','토'],
	  	   		    dayNamesShort: ['일','월','화','수','목','금','토'],
	  	   		    dayNamesMin: ['일','월','화','수','목','금','토'],
	  	   		    yearSuffix: '년',
	  		    	changeMonth: true,
	  		        changeYear: true,
	  		      	maxDate: '0',
	  		        showOn: "button",
	  		      	buttonImage: '../resources/image/ico_cal.gif',
	  		      	buttonImageOnly: true
	    	  });
	    	  $('#start_date').datepicker('setDate', '-3m');
	    	  
	    	  $('#end_date').datepicker({
	    			dateFormat: 'yy-mm-dd',
	  	    		prevText: '이전 달',
	  	   		    nextText: '다음 달',
	  	   		    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	  	   		    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	  	   		    dayNames: ['일','월','화','수','목','금','토'],
	  	   		    dayNamesShort: ['일','월','화','수','목','금','토'],
	  	   		    dayNamesMin: ['일','월','화','수','목','금','토'],
	  	   		    yearSuffix: '년',
	  		    	changeMonth: true,
	  		        changeYear: true,
	  		      	maxDate: '0',
	  		      	showOn: "button",
	  		      	buttonImage: '../resources/image/ico_cal.gif',
	  		      	buttonImageOnly: true
	    	  });
	    	  $('#end_date').datepicker('setDate', 'today');
    	});
    </script>
</body>
</html>