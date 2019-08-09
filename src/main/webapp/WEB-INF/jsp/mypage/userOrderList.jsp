<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../module/header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div class="subWrap">
				<div class="subLayout">
					<!-- start:Tab -->
<ul class="subTab">
				<li><a href="/giftcon/mypage.conn">회원정보수정</a></li>
				<li><a href="/giftcon/userPwChgForm.conn">비밀번호변경</a></li>
				<li><a href="/giftcon/myQnalist.conn" >나의 문의 이력</a></li>
				<li><a href="/giftcon/orderList.conn"class="on">주문 내역</a></li>

			</ul>
					<!-- /end:Tab -->
					<!-- start:searchBox -->
<!-- 					<form id="searchFrm" name="searchFrm" method="get">
					<div class="mySearch1 mb30">
						<div class="mr46 searchArea">
							<div>
								<label>조회기간</label>
								<p>
									<span class="iptCal"><input id="searchStYmd" name="searchStYmd" value="2019-07-08" type="text" class="ui-datepicker-trigger hasDatepicker" readonly=""><a href="#" class="btnCalendar">달력</a></span> ~ 
									<span class="iptCal"><input id="searchEnYmd" name="searchEnYmd" value="2019-08-08" type="text" class="ui-datepicker-trigger hasDatepicker" readonly=""><a href="#" class="btnCalendar">달력</a></span>
								</p>
							</div>
						</div>
						<div class="searchArea">
							<div>
								<label class="txtNone">기간설정</label>
								<p>
									<a href="#" onclick="javascript:goSearchPeriod('1W');" class="dateTxt ">1주일</a>
									<a href="#" onclick="javascript:goSearchPeriod('1M');" class="dateTxt on">1개월</a>
									<a href="#" onclick="javascript:goSearchPeriod('3M');" class="dateTxt ">3개월</a>
								</p>
							</div>
						</div>
						<div class="searchBtn1">
							<a href="#" class="btnSmlBgBlue3 w108" onclick="javascript:goList(0);">조회하기</a>
						</div>
						<p class="careTxt4">* 주문완료 : 모바일쿠폰 발송이 진행중인 상태<br>
						* 발송완료 : 통신사로부터 발송결과가 모두 수신된 상태
						</p>
					</div>
					</form> -->
					<!-- /end:searchBox -->
					
						
						
					<!-- start:seld_list -->
					<p class="careTxt9">* 배송상품의 상세주문현황은 1:1문의 또는 고객센터를 통해 주문번호와 함께 접수해주시기 바랍니다.</p>
					<table summary="쿠폰 발송내역 조회 리스트" class="tbI">
				  	<colgroup>
				  		<col width="9%">
				  		<col width="8%">
				  		<col width="28%">
				  		<col width="5%">
				  		<col width="8%">
				  		<col width="7%">
				  		
				  		<col width="7%">
				  		<col width="7%">
				  		<col width="8%">
				  		<col width="13%">
				  	</colgroup>
					  <tbody>
						<tr>
						  <th>주문일자</th>
						  <th>주문번호</th>
						  <th>주문상품</th>
						  <th>수량</th>
						  <th>총 금액</th>
						  <th>이미지</th>
						  <th class="last">주문상태</th>
						  <th>전송 / 취소</th>
						</tr>
							<c:forEach var="list" items="${list}">
								<tr>
						 			<td ><fmt:formatDate value="${list.ORDER_DATE }" type="date"/></td>
						 			<td >${list.ORDER_NUM}</td>
						 			<td >${list.GOODS_NAME}</td>
						 			<td >${list.ORDER_AMOUNT_SUM }</td>
						 			<td >${list.ORDER_PAY_SUM }</td>
						 			<td ><img alt="this.src='/giftcon/images/XBox.png'" src="/giftcon/resources/file/goodsFile/${list.GOODS_IMG }" width="80" height="80" ></td>
						 			<td >${list.ORDER_PAYMENT }</td>
						 			<td><c:if test="${list.ORDER_PAYMENT eq 'N' }"><input style="width:60pt;height:20pt; color: BLACK;"  type="button" value="주문 취소"/></c:if>
						 				<c:if test="${list.ORDER_PAYMENT eq 'Y' }"><input style="width:60pt;height:20pt; color: BLACK;"  type="button" value="결제 취소"/> <input style="width:60pt;height:20pt; color:BLACK"  type="button" value="이메일 전송"/></c:if>
						 				<c:if test="${list.ORDER_PAYMENT eq 'E' }"><input style="width:60pt;height:20pt; color: BLACK;"  type="button" value="이메일 전송"/></c:if>
						 			</td>
								</tr>
							</c:forEach>							
						
					  </tbody>
					</table>
					<!-- /end:seld_list -->
					<!-- start:paginate -->
					<div class="paginate">
						<ul class="numList"></ul>
					</div>
					<!-- /end:paginate -->						

				</div>
			</div>
</body>
</html>
<%@include file="../module/footer.jsp"%>