<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../module/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/giftcon/css/sub.css">
<link rel="stylesheet" type="text/css" href="/giftcon/css/common.css">
<link rel="stylesheet" type="text/css" href="/giftcon/css/main.css">
</head>
<body>
<div class="subWrap">
				<div class="subLayout">
					<!-- start:sub_title -->
					<div class="subTit">쿠폰 발송하기</div>
					<!-- /end:sub_title -->
					<!-- start:send_step01 -->
					<div class="stepArea">
						<!-- start:step_title -->
						<p class="stepBox">
							<span class="stepTxt s1">Step 01</span>
							<span class="stepTit">상품정보확인</span>
							
						</p>
						<!-- /end:step_title -->
						<!-- start:product_list -->
						<table summary="쿠폰 발송할 상품정보 확인 리스트" class="tbA">
					  	<colgroup>
					  		<col width="20%">
					  		<col width="40%">
					  		<col width="10%">
					  		<col width="10%">
					  		<col width="10%">
					  	</colgroup>
						  <tbody>
							<tr>
							  <th class="alignC">상품</th>
							  <th class="alignC">발송상품명</th>
							  <th class="alignC">상품가격</th>
							  <th class="alignC">수량</th>
							  <th class="alignC last">유효기간</th>
							</tr>
							<c:forEach items="${goods}" var="goods">
								<tr>
								  <td class="alignC"><img src="${goods.GOODS_IMG1}" alt=""></td>
								  <td>[${goods.SMALL_CATEGORY] ${goods.GOODS_NAME}</td>
								  <td class="alignC" id="price">${goods.GOODS_PRICE}</td>
								  <td class="alignC">수량 받아오기</td>
								  <td class="alignC last">90일</td>
								</tr>
							</c:forEach>
						  </tbody>
						</table>
						<p class="priceOne">1건당 발송금액 : 원</p>
						<!-- /end:product_list -->
					</div>
					<!-- /end:send_step01 -->
					<!-- start:send_step02 -->
					<div class="stepArea">
						<!-- start:step_title -->
						<p class="stepBox">
							<span class="stepTxt s2">Step 02</span>
							<span class="stepTit">수신정보입력</span>
						</p>
						<!-- /end:step_title -->
						<!-- start:send_name -->
						<div class="sendName">
							<p class="sendSetting">
								<label for="sending_num">수신자</label>
								<span class="writeBox">
									<input type="text" name="userName" id="userName" class="ipt6 w206" value="${member.MEMBER_NAME}" maxlength="12" readonly="">
								</span>
							</p>
							<p class="sendSetting">
								<label for="sending_num">수신 E-mail</label>
								<span class="writeBox">
									<input type="text" name="sendPhone" id="sendPhone" class="ipt6 w206" value="${memeber.MEMBER_EMAIL }" maxlength="12" readonly="">
								</span>
							</p>
							<p class="sendSetting">
								<label for="send_name">보낼 메시지</label>
								<span class="writeBox">
									<input type="text" id="orderName" name="orderName" class="ipt5 w972" placeholder="** 프로모션 관리용(수신자에게 전달되지 않는 메시지입니다 ex)12월 도넛북 리그램 이벤트) 최대40byte **">
									<span class="byteNum">(<em id="orderNameByte">2</em>/40byte)</span>
								</span>
							</p>
							
						</div>

						<!-- /end:res_send -->
					</div>
					<!-- /end:send_step02 -->
					<!-- start:send_step03 -->
					<div class="stepArea">
						<!-- start:step_title -->
						<!-- start:step_title -->
						<p class="stepBox">
							<span class="stepTxt s3">Step 03</span>
							<span class="stepTit">결제하기</span>
						</p>
						<!-- /end:step_title -->
						<div class="payBox">
							<!-- start:pay_info -->
							<ul class="payInfo">
								<li>
									<span class="tit mtNone">총 결제금액</span>
									<span class="txt mtNone"><span id="totalPriceTxt">0</span>원</span>
								</li>
								<li>
									<span class="tit">결제수단선택</span>
									<div class="payMethod">
										<input type="radio" name="payMethod" id="payMethod" value="C" checked="">
										<p><span class="icoPay1"></span></p>
										<span class="txtMethod">무통장입금</span>
									</div>
									<div class="payMethod">
										<input type="radio" name="payMethod" id="payMethod" value="P">
										<p><span class="icoPay2"></span></p>
										<span class="txtMethod">휴대폰결제</span>
									</div>
									<div class="payMethod last">
										<input type="radio" name="payMethod" id="payMethod" value="A">
										<p><span class="icoPay3"></span></p>
										<span class="txtMethod">신용카드</span>
									</div>
								</li>
								
							</ul>
							<!-- /end:pay_info -->
							<!-- start:total_pay -->
							<div class="totalPay">
								<p class="lastPay">최종결제내역</p>
								<div class="lastPayInfo">
									<div class="lastDetail">
										<p class="contInfo">
											<span class="tit">총 결제금액</span>
											<span class="txt"><span id="totalAmtTxt">0</span>원</span>
										</p>
										<p class="contInfo">
											<span class="tit">할인금액</span>
											<span class="txt">(-)<span id="usePointAmtTxt">0</span>원</span>
										</p>

									</div>
									<div class="lastPayMoney">

										<p class="contInfo">
											<span class="tit">결제금액</span>
											<span class="txt"><span id="billAmtTxt">0</span>원</span>
										</p>
									</div>
								</div>
							</div>
							<!-- /end:total_pay -->
						</div>
					</div>
					<!-- /end:send_step03 -->
					<!-- start:btn_more -->
					<div class="btn1"><a href="javascript:goOrder();" id="btnOrder" class="btnBigBgBlue4 w300">주문하기</a></div>
					<!-- /end:btn_more -->
				</div>
			</div>
</body>
</html>
<%@include file="../module/footer.jsp"%>