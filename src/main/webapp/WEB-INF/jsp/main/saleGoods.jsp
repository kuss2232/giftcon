<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/giftcon/css/sub.css">
<link rel="stylesheet" type="text/css" href="/giftcon/css/common.css">
<link rel="stylesheet" type="text/css" href="/giftcon/css/main.css">
<title>Insert title here</title>

</head>
<body>
<div class="todayprodArea mb30">
				<div class="fixBox bestBox">
					<h2>할인상품 </h2><span class="h2SubTit">할인중인 상품을 한눈에!</span>
					<ul class="prodList">
						<% for(int j=0; j<8; j++){ %>
						
						<li>
							<div class="prodBox">
								<p class="icoFlag">
										<span class="bestF"><em>Best</em></span>
								</p>
								<span class="prodImg"><a href="/goods/goodsDetail.do?goodsNo=13557"><img src="/3N1DATA01/donutbook/goods/z067506eximt.jpg" alt=""></a></span>
								<span class="brand">[스타벅스]</span>
								<span class="prodName">아이스 카페아메리카노 Tall</span>
								<span class="price">
									<span class="prodPrice" >4,100원</span>
								</span>
								<ul class="sendList">
									<li><a href="/order/order.do?goodsNo=13557" class="first"><span class="nowSend"></span><span class="sendTxt">바로발송</span></a></li>
									<li><a href="javascript:insertCart(13557);"><span class="cartPut"></span><span class="sendTxt">장바구니</span></a></li>
								</ul>
							</div>
						</li>
						<%} %>
					</ul>					
				</div>
			</div>

</body>
</html>