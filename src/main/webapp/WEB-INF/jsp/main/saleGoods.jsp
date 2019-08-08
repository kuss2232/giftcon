<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
						<c:forEach items="${saleList}" var="list">
						<c:url var="viewURL" value="goods/detail.conn"><c:param name="GOODS_NUM" value="${list.GOODS_NUM}" /></c:url>
						<li>
							<div class="prodBox">
								<p class="icoFlag">
									<span class="downF"><em>SALE</em></span>
								</p>
								<span class="prodImg"><a href="${viewURL}"><img src="/giftcon/resources/file/goodsFile/${list.GOODS_IMG}"></a></span>
								<span class="brand">[${list.SMALL_CATEGORY}]</span>
								<span class="prodName">${list.GOODS_NAME}</span>
								<input type="hidden" id="GOOODS_NUM" value="${list.GOODS_NUM}"/>
								<c:if test="${!empty list.GOODS_DCPRICE}"><!-- 할인할 때 -->
									<span class="price">
										<span class="dcPrice">${list.GOODS_PRICE} 원</span>
										<span class="prodPrice">${list.GOODS_DCPRICE} 원</span>
									</span>
								</c:if>
								<c:if test="${empty list.GOODS_DCPRICE}"><!-- 할인 가격 없을 때 -->
									<span class="price"><span class="prodPrice" >${list.GOODS_PRICE} 원</span></span>
								</c:if>
								<ul class="sendList">
									<li><a href="/order/order.do?goodsNo=13557" class="first"><span class="nowSend"></span><span class="sendTxt">바로발송</span></a></li>
									<li><a href="javascript:insertCart(13557);"><span class="cartPut"></span><span class="sendTxt">장바구니</span></a></li>
								</ul>
							</div>
						</li>
						</c:forEach>
					</ul>					
				</div>
			</div>

</body>
</html>