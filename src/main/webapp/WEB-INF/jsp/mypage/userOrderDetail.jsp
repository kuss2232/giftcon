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
				<li><a href="/giftcon/myQnalist.conn">나의 문의 이력</a></li>
				<li><a href="/giftcon/orderList.conn" class="on">주문 내역</a></li>
			</ul>
			<!-- start:seld_list -->
			<table summary="쿠폰 발송내역 조회 리스트" class="tbI">
				<colgroup>
			  		<col width="7%">
			  		<col width="27%">
			  		<col width="13%">
			  		<col width="13%">
			  		<col width="7%">
			  		<col width="8%">
			  		<col width="7%">
			  		<col width="7%">
			  		<col width="14%">
			  	</colgroup>
					  <tbody>
						<tr>
							<th style="text-align: center; vertical-align: middle;">주문번호</th>
							<th style="text-align: center; vertical-align: middle;">상품 이미지</th>
							<th style="text-align: center; vertical-align: middle;">상품이름</th>
							<th style="text-align: center; vertical-align: middle;">간략설명</th>
							<th style="text-align: center; vertical-align: middle;">수량</th>
							<th style="text-align: center; vertical-align: middle;">금액</th>
							<th style="text-align: center; vertical-align: middle;">합계</th>
							<th style="text-align: center; vertical-align: middle;">주문상태</th>
							<th style="text-align: center; vertical-align: middle;">주문일자</th>
						</tr>
						<c:forEach var="orderList" items="${orderList}">
							<tr>
								<!-- 주문번호 -->
							<td style="text-align: center; vertical-align: middle;">${orderList.ORDER_NUM}</td>
							<!-- 상품이미지 -->
							<td style="text-align: center; vertical-align: middle;"><img src="/giftcon/resources/file/goodsFile/${orderList.GOODS_IMG }"></td>
							<!-- 상품이름 -->
							<td style="text-align: center; vertical-align: middle;">${orderList.GOODS_NAME}</td>
							<!-- 상품간략설명 -->
							<td style="text-align: center; vertical-align: middle;">${orderList.GOODS_SIMPLE}</td>
							<!-- 상품구매수량 -->
							<td style="text-align: center; vertical-align: middle;">${orderList.ORDER_AMOUNT}</td>
							<!-- 상품1개당금액 -->
							<td style="text-align: center; vertical-align: middle;">${orderList.GOODS_PRICE}원</td>
							<!-- 상품 총 금액 -->
							<td style="text-align: center; vertical-align: middle;">${orderList.GOODS_PRICE * orderList.ORDER_AMOUNT}원</td>
								<c:set var="SUM" value="${SUM + (orderList.GOODS_PRICE * orderList.ORDER_AMOUNT)}" />
							<!-- 주문상태 -->
							<td style="text-align: center; vertical-align: middle;">
								<c:if test="${orderList.ORDER_PAYMENT eq 'N'}">입금 대기</c:if>
								<c:if test="${orderList.ORDER_PAYMENT eq 'Y' }">결제 완료</c:if> 
								<c:if test="${orderList.ORDER_PAYMENT eq 'E' }">전송 완료</c:if>
								<c:if test="${orderList.ORDER_PAYMENT eq 'W' }">취소 대기중</c:if>
								<c:if test="${orderList.ORDER_PAYMENT eq 'C' }">취소 완료</c:if></td>
							<!-- 주문일자 -->
							<td style="text-align: center; vertical-align: middle;">${orderList.ORDER_DATE}</td>
							</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="adad" align="right"><h1>총 합계 : ${SUM}</h1></div>
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