<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../module/header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
						<c:set var="NUM" value="0" />
					<c:forEach var="list" items="${list}">
						<c:if test="${NUM ne list.ORDER_NUM}">
							<c:url var="Detail" value="/orderDetail.conn" >
								<c:param name="ORDER_NUM" value="${list.ORDER_NUM }" />
							</c:url>
							<c:set var="NUM" value="${list.ORDER_NUM}" />
							<tr>
								<td><fmt:formatDate value="${list.ORDER_DATE }"
										type="date" /></td>
								<td>${list.ORDER_NUM}</td>
								<td><a href="${Detail}">${list.GOODS_NAME}<c:if test="${list.COUNTS > 1}">외 ${list.COUNTS-1}개</c:if></a></td>
								<td>${list.ORDER_AMOUNT_SUM }</td>
								<td>${list.ORDER_PAY_SUM }</td>
								<td><img alt="this.src='/giftcon/images/XBox.png'"
									src="/giftcon/resources/file/goodsFile/${list.GOODS_IMG }"
									width="80" height="80"></td>
								<td><c:if test="${list.ORDER_PAYMENT eq 'N' }">결제 대기중</c:if>
									<c:if test="${list.ORDER_PAYMENT eq 'Y' }">결제 완료</c:if> 
									<c:if test="${list.ORDER_PAYMENT eq 'E' }">전송 완료</c:if>
									<c:if test="${list.ORDER_PAYMENT eq 'W' }">취소 대기중</c:if>
									<c:if test="${list.ORDER_PAYMENT eq 'C' }">취소 완료</c:if></td>
								<td><c:if test="${list.ORDER_PAYMENT eq 'N' }">
										<input style="width: 60pt; height: 20pt; color: BLACK;"	type="button" value="주문 취소" onclick="fn_restoreAmount(${list.ORDER_NUM})" />
									</c:if> 
									<c:if test="${list.ORDER_PAYMENT eq 'Y' }">
										<input style="width: 60pt; height: 20pt; color: BLACK;" type="button" value="결제 취소" onclick="fn_paymentCancle(${list.ORDER_NUM})" />
										<input style="width: 60pt; height: 20pt; color: BLACK;" type="button" value="이메일 전송" onclick="fn_emailSend(${list.ORDER_NUM})" />
									</c:if> 
									<c:if test="${list.ORDER_PAYMENT eq 'E' }">
										<input style="width: 60pt; height: 20pt; color: BLACK;" type="button" value="이메일 전송" onclick="fn_emailSend(${list.ORDER_NUM})" />
									</c:if>
								</td>
							</tr>
						</c:if>
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
<script>
function fn_emailSend(num)
{	
	if(confirm("이메일 전송을 하시면 결제 취소가 어렵습니다.\n정말로 전송하시겠습니까?")){
		$.ajax({
			type : "POST",
			url : "/giftcon/send_email.conn",
			data :  {"ORDER_NUM":num},
			success : function() {
				alert("이메일이 발송되었습니다.");
				location.href="/giftcon/orderList.conn";
			},
			error : function(e) {
				alert('error' + e);
			}
		});
	} else {
		alert("이메일 전송이 취소되었습니다!")
		return false;
	}
}

function fn_paymentCancle(num)
{	
	if(confirm("정말 결제를 취소 하시겠습니까?")){
		$.ajax({
			type : "POST",
			url : "/giftcon/paymentCancleWait.conn",
			data : {"ORDER_NUM":num},
			success : function() {
				alert("결제취소 신청하였습니다.");
				location.href="/giftcon/orderList.conn";
			},
			error : function(e) {
				alert('error' + e);
			}
		});	
	} else {
		alert("결제 취소가 중단되었습니다!")
		return false;
	}
		
}

function fn_restoreAmount(num)
{	
	if(confirm("정말 주문을 취소 하시겠습니까?")){
		$.ajax({
			type : "POST",
			url : "/giftcon/restoreAmount.conn",
			data : {"ORDER_NUM":num},
			success : function() {
				alert("주문취소 성공");
				location.href="/giftcon/orderList.conn";
			},
			error : function(e) {
				alert('error' + e);
			}
		});	
	} else {
			alert('주문 취소가 중단되었습니다!')
			return false;
	}
}
</script>
</html>
<%@include file="../module/footer.jsp"%>