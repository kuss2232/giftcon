<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../module/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="/giftcon/css/jquery/jquery.blockUI.js"></script>
<!-- <script src="/giftcon/js/kakaoSdk.js"></script> -->
<link rel="stylesheet" type="text/css" href="/giftcon/css/sub.css">
<link rel="stylesheet" type="text/css" href="/giftcon/css/common.css">
<link rel="stylesheet" type="text/css" href="/giftcon/css/main.css">
<script type="text/javascript">
		$(document).ready(function(){
			$("#orderBtn").on("click", function(e){
				e.preventDefault();
				fn_order();
				fn_amount(num);
			});
			if(! /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
	            $('#kakaoMobile').attr('disabled', 'disabled');
	            $('#kakaoMobile').removeClass('btn_pay_hover');
	            $('#kakaoMobile').css('cursor','no-drop');
	        }

		});
		
		
		function fn_order(){
			
			var i = $("#number").val();
			var gname = $("#gnames").val();
			var type = $("input[name='ORDER_PAYMENT']:checked").val();
			var IMP = window.IMP; 
	        IMP.init('imp97218771'); 
	        var msg;
	        if(i > 1)
				gname += "외 " + (i-1) + "건";
			var comSubmit = new ComSubmit("order");
			if( type.length==0){  
			      alert("결제방식 선택 안됨");
			      return;
			}
			
			if(type == "pc")
				fn_Kpay(gname,i,$("#totalPrice1").val()); 
			else
				fn_DbAdd();
			<%-- 
			alert(gname);
			
			if($("input[name='ORDER_PAYMENT']:checked").val() == "pc")
			{
				IMP.request_pay({
		            pg : 'kakaopay',
		            pay_method : 'card',
		            merchant_uid : 'merchant_' + new Date().getTime(),
		            name : gname ,   // 상품명
		            amount : $("#totalPrice1").val(),         // 금액
		            buyer_email : 'TEST@naver.com',
		            buyer_name : 'TEST',
		            buyer_tel : '01000000000',
		            buyer_addr : '123',
		            buyer_postcode : '123-456',
		        }, function(rsp) {
		        	if ( rsp.success ) {
		        		fn_DbAdd();
		            } else {
		                msg = '결제에 실패하였습니다. 다시 시도해주십시오.';
		                msg += '\n내용 : ' + rsp.error_msg;
		                alert(msg);
		                location.href = "<%=request.getContextPath()%>/main.conn";
		            }

		        });
			}
			else
			{
				fn_DbAdd();
			} --%>
			
		}
		var win;
		function fn_DbAdd()
		{
			var i = $("#number").val();
			var url = "";
			var order_num = 0;
			var total = 0;
			var payment = "";
			if($("#type").val() != "")
				url = "/giftcon/insertCartOrder.conn";
			else
				url = "/giftcon/insertOrder.conn";
			
			if($("input[name='ORDER_PAYMENT']:checked").val() == "pc")
				payment = "Y";
			else
				payment = "N";
			
			total = $("#totalPrice1").val();
			
			$.ajax({
				type : "POST",
				url : "/giftcon/lastOrderNum.conn",
				data : {},
				success : function(result){
					order_num = result;
				},
				complete : function(e){
					for(var j=1;j<=i;j++)
					{
						$.ajax({
							type : "POST",
							url : url,
							data : {"ORDER_NUM":order_num,
								"ORDER_AMOUNT":$("#CART_AMOUNT"+j).val(),
								"MEMBER_ID":$("#MEMBER_ID"+j).val(),
								"GOODS_NUM":$("#GOODS_NUM"+j).val(),
								"CART_NUM":$("#CART_NUM"+j).val(),
								"ORDER_PRICE":$("#totalPrice"+j).val(),
								"ORDER_PAYMENT":payment
							},
							error : function(e) {
								alert("서버가 응답하지 않습니다. \n다시 시도해주시기 바랍니다.");
							},
							complete : function(e){
								location.href="/giftcon/main.conn";
							}
						})
					}
				}
			})
		}
		
  		function fn_Kpay(agent,i,price)
		{
  			//잠깐 나타났다가 사라지는 함수
			//$.growlUI('타이틀', '내용'); 
			var ReturnValue;
			
 			$.ajax({
 				type : "POST",
 				url : "/giftcon/kakaos.conn",
 				data : {
 	 				"item_name": agent,
 	 				"quantity": i,
 	 				"total_amount": price,
 	 				"tax_free_amount": "0"
 				},
 				dataType : "Json",
 				success : function(data){
					if(win == null || win.closed)
						win = window.open(data.next_redirect_pc_url, "","width=500, height=600, directories=0, history=no, resizable=0, status=no, scrollbars=no, toolbar=no, menubar=no, location=0, channelmode=1");
					else 
						win.focus();
 				},
 				error : function(request,status,error){
 					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
 				}
 			})
		} 
  		function fn_window()
  		{
  			fn_DbAdd();
  		}
		
		function fn_Amount(num) 
		{
		    $("#CART_AMOUNT"+num).val($("#AMOUNT"+num).val());
		    
		    var price = $("#gp").text()*1;
		    var amount = $("#AMOUNT"+num).val()*1;
		    var disPrice = $("#gdp").text()*1;
		    var q = price*amount;
		    var w = disPrice*amount;
		    var e = (price-disPrice)*amount;
		
			$("#priceOne1").text(q);
			$("#priceOne2").text(w);
			$("#priceOne2_1").text(w);
			$("#priceOne2_2").text(w);
			$("#disPrice").text(e)
			$(".totalP").val(w);
		}

	      

	</script>
</head>
<body>
<div class="subWrap">
	<input type="hidden" id="type" value="${type }"/>
				<div class="subLayout">
				<form id="order"></form>
				<form id="orders">
				 <span id="gp" style="display:none">${GOODS_PRICE}</span>
           			 <span id="gdp" style="display:none" >${GOODS_DCPRICE}</span>
				
				
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
							<c:set var="gname" value="a"/>
							<c:forEach items="${list}" var="goods">
								<tr>
									<c:set var="i" value="${i+1}"/>
									<td class="alignC"><img src="/giftcon/resources/file/goodsFile/${goods.GOODS_IMG}" alt="">
										<c:if test="${i == 1}"><c:set var="gname" value="${goods.GOODS_NAME}"/></c:if>
									<input type="hidden" value="${totalPrice}" id="totalPrice${i}" class="totalP">
									<input type="hidden" value="${MEMBER_ID}" id="MEMBER_ID${i}">
									<input type="hidden" value="${goods.GOODS_NUM}" id="GOODS_NUM${i}">
									<input type="hidden" value="${goods.CART_NUM}" id="CART_NUM${i}">
									<c:if test="${not empty goods.CART_AMOUNT}"><input type="hidden" value="${goods.CART_AMOUNT}" id="CART_AMOUNT${i}"></c:if>
									<c:if test="${empty goods.CART_AMOUNT}"><input type="hidden" value="1" id="CART_AMOUNT${i}"></c:if>
									</td>
									<td>[${goods.SMALL_CATEGORY}] ${goods.GOODS_NAME}</td>
									<td class="alignC" id="price">
									<c:if test="${not empty goods.CART_AMOUNT}">${goods.CART_AMOUNT}</c:if>
									<c:if test="${empty goods.CART_AMOUNT}">
										<select id="AMOUNT${i}" onchange="fn_Amount(${i})">
											<c:forEach var="j" begin="1" end="${goods.GOODS_AMOUNT}">
												<option value="${j}">${j}개</option>
											</c:forEach>
										</select>
									</c:if>개</td>
									<td class="alignC" id="price"><del>${goods.GOODS_PRICE}</del><br/>▶${goods.GOODS_DCPRICE}</td>
									<td class="alignC last">90일</td>
								</tr>
							</c:forEach>
						  </tbody>
						</table>
						<input type="hidden" value="${gname}" id="gnames"/>
						<input type="hidden" value="${i}" id="number"/>
						<p class="priceOne">발송금액 :<span id="priceOne2_1">${totalPrice}</span>원</p>
						
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
									<span class="txt mtNone"><span id="priceOne2_2">${totalPrice}</span>원</span>
								</li>
								<li>
									<span class="tit">결제수단선택</span>
									<div class="payMethod">
										<input type="radio" name="ORDER_PAYMENT" id="ORDER_PAYMENT" value="N" >
										<p><span class="icoPay1"></span></p>
										<span class="txtMethod">무통장입금</span>
									</div>
 									<div class="payMethod">
										<input type="radio" class="btn_pay btn_pay_hover" name="ORDER_PAYMENT" id="kakaoPC" value="pc">
										<p><span class="icoPay3"></span></p>
										<span class="txtMethod">카카오페이 PC</span>
									</div>
<!-- 									<div class="payMethod">
										<input type="radio" class="btn_pay btn_pay_hover" name="ORDER_PAYMENT" id="kakaoMobile" value="mobile">
										<p><span class="icoPay2"></span></p>
										<span class="txtMethod">카카오페이 모바일</span>
									</div> 
-->
<!-- 									<div class="payMethod last">
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
											<span class="txt"><span id="priceOne1">${price}</span>원</span>
										</p>
										<p class="contInfo">
											<span class="tit">할인금액</span>
											<span class="txt">(-)<span id="disPrice">${price - totalPrice}</span>원</span>
										</p>

									</div>
									<div class="lastPayMoney">
										<p class="contInfo">
											<span class="tit">결제금액</span>
											<span class="txt"><span id="priceOne2">${totalPrice}</span>원</span>
										</p>
									</div>
								</div>
							</div>
							<!-- /end:total_pay -->
						</div>
					</div>
					<!-- /end:send_step03 -->
					<!-- start:btn_more -->
					
					<div class="btn1"><a href="javascript:goOrder();" id="orderBtn" class="btnBigBgBlue4 w300">주문하기</a></div>
					<!-- /end:btn_more -->
					</form>
				</div>
			</div>
</body>
</html>
<%@include file="../module/footer.jsp"%>