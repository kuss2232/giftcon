<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../module/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/giftcon/js/common.js" charset="utf-8"></script>
<script src="/giftcon/css/jquery/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" type="text/css" href="/giftcon/css/sub.css">
<link rel="stylesheet" type="text/css" href="/giftcon/css/common.css">
<link rel="stylesheet" type="text/css" href="/giftcon/css/main.css">
<script type="text/javascript">
		$(document).ready(function(){
			$("#btnOrder").on("click", function(e){
				e.preventDefault();
				fn_order();
			});

		});
		
		function fn_order(){
			var i = $("#number").val();
			var url = "";
			
			var comSubmit = new ComSubmit("order");
			if( $("input[name='ORDER_PAYMENT']:checked").length==0){  
			      alert("결제방식 선택 안됨");
			      return;
			}
			alert("결제되었습니다.");
			if(i>=2)
				url = "/giftcon/insertCartOrder.conn";
			else
				url = "/giftcon/insertOrder.conn";
			for(var j=1;j<=i;j++)
			{
				$.ajax({
					type : "POST",
					url : url,
					data : {"ORDER_AMOUNT":$("#CART_AMOUNT"+j).val(),
						"MEMBER_ID":$("#MEMBER_ID"+j).val(),
						"GOODS_NUM":$("#GOODS_NUM"+j).val(),
						"CART_NUM":$("#CART_NUM"+j).val(),
						"ORDER_PRICE":$("#totalPrice"+j).val(),
						"ORDER_PAYMENT":$("#ORDER_PAYMENT").val()
						},
					//data : userData,
					error : function(erromr) {
						alert("서버가 응답하지 않습니다. \n다시 시도해주시기 바랍니다.");
					}
				})
			}
			location.href="/giftcon/main.conn";
			
		}

	</script>
</head>
<body>
<div class="subWrap">
				<div class="subLayout">
				<form id="order"></form>
				<form id="orders">
				
				
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
							  <th class="alignC">상품수량</th>
							  <th class="alignC">상품가격</th>
							  <th class="alignC last">유효기간</th>
							</tr>
							<c:set var="i" value="0"/>
							<c:forEach items="${list}" var="goods">
								<tr>
									<c:set var="i" value="${i+1}"/>
									<td class="alignC"><img src="${goods.GOODS_IMG}" alt="">
									<input type="hidden" value="${totalPrice}" id="totalPrice${i}">
									<input type="hidden" value="${MEMBER_ID}" id="MEMBER_ID${i}">
									<input type="hidden" value="${GOODS_NUM}" id="GOODS_NUM${i}">
									<input type="hidden" value="${goods.CART_NUM}" id="CART_NUM${i}">
									<c:if test="${not empty goods.CART_AMOUNT}"><input type="hidden" value="${goods.CART_AMOUNT}" id="CART_AMOUNT${i}"></c:if><c:if test="${empty goods.CART_AMOUNT}"><input type="hidden" value="1" id="CART_AMOUNT${i}"></c:if>
									</td>
									<td>[${goods.SMALL_CATEGORY}] ${goods.GOODS_NAME}</td>
									<td class="alignC" id="price">${goods.CART_AMOUNT}</td>
									<td class="alignC" id="price">${goods.GOODS_PRICE}</td>
									<td class="alignC last">90일</td>
								</tr>
							</c:forEach>
						  </tbody>
						</table>
						<input type="hidden" value="${i}" id="number"/>
						<p class="priceOne">1건당 발송금액 :${totalPrice}원</p>
						<!-- /end:product_list -->
					</div>
					<!-- /end:send_step01 -->
					<!-- start:send_step02 -->
					<div class="stepArea">
						<!-- start:step_title -->
						<p class="stepBox">
							<span class="stepTxt s2">Step 02</span>
							<span class="stepTit">수신정보</span>
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
									<input type="text" name="sendPhone" id="sendPhone" class="ipt6 w206" value="${member.MEMBER_EMAIL}" maxlength="12" readonly="">
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
									<span class="txt mtNone"><span id="totalPriceTxt">${totalPrice}</span>원</span>
								</li>
								<li>
									<span class="tit">결제수단선택</span>
									<div class="payMethod">
										<input type="radio" name="ORDER_PAYMENT" id="ORDER_PAYMENT" value="N" >
										<p><span class="icoPay1"></span></p>
										<span class="txtMethod">무통장입금</span>
									</div>
<!-- 									<div class="payMethod">
										<input type="radio" name="payMethod" id="payMethod" value="P">
										<p><span class="icoPay2"></span></p>
										<span class="txtMethod">휴대폰결제</span>
									</div>
									<div class="payMethod last">
										<input type="radio" name="payMethod" id="payMethod" value="A">
										<p><span class="icoPay3"></span></p>
										<span class="txtMethod">신용카드</span>
									</div> 
-->
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
											<span class="txt"><span id="totalAmtTxt">${price}</span>원</span>
										</p>
										<p class="contInfo">
											<span class="tit">할인금액</span>
											<span class="txt">(-)<span id="usePointAmtTxt">${price - totalPrice}</span>원</span>
										</p>

									</div>
									
									<div class="lastPayMoney">
										
										<p class="contInfo">
											<span class="tit">결제금액</span>
											<span class="txt"><span id="totalP">${totalPrice}</span>원</span>
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
					</form>
				</div>
			</div>
</body>
</html>
<%@include file="../module/footer.jsp"%>