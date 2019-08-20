<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/giftcon/css/sub.css">
<link rel="stylesheet" type="text/css" href="/giftcon/css/common.css">
<link rel="stylesheet" type="text/css" href="/giftcon/css/main.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="todayprodArea mb30">
				<div class="fixBox bestBox">
					<h2>인기상품 BEST</h2><span class="h2SubTit">오늘 가장 많이 팔린 상품을 한눈에!</span>
					<ul class="prodList">

						<c:forEach items="${bestList}" var="list">
						<c:url var="viewURL" value="goods/detail.conn"><c:param name="GOODS_NUM" value="${list.GOODS_NUM}" /></c:url>
						<li>
							<div class="prodBox">
								<p class="icoFlag">
										<span class="bestF"><em>Best</em></span>
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
									<li><a href="/giftcon/orderForm.conn?GOODS_NUM=${list.GOODS_NUM}" class="first"><span class="nowSend"></span><span class="sendTxt">바로발송</span></a></li>
									<li><a href="javascript:addCart(${list.GOODS_NUM});"><span class="cartPut"></span><span onclickclass="sendTxt">장바구니</span></a></li>
								</ul>
							</div>
						</li>
						</c:forEach>
						<input type="hidden" id="memberNum" value="${MEMBER_NUM}"/>
					</ul>					
				</div>
			</div>
</body>
<script>
function addCart(num)
{
	$.ajax({
		type:"POST",
		data:{"CART_AMOUNT": 1,
				"GOODS_NUM": num,
				"MEMBER_NUM": $("#memberNum").val()
		},
        url:"/giftcon/cart/addCart.conn",
       	error : function(erromr) {
			alert("서버가 응답하지 않습니다. \n다시 시도해주시기 바랍니다.");
		},
		success : function() {
			alert("장바구니에 등록되었습니다.");
			location.href="/giftcon/main.conn";
		}
	});
}
</script>
</html>
