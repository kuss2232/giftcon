<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../module/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>title</title>
<link rel="stylesheet" type="text/css" href="/giftcon/css/sub.css">
<link rel="stylesheet" type="text/css" href="/giftcon/css/common.css">
<link rel="stylesheet" type="text/css" href="/giftcon/css/main.css">
<script type="text/javascript" src="/giftcon/css/common.js"></script>
<script src="/giftcon/css/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
</head>
<body>
<div id="container">
<div class="contents">
<div class="subWrap">
<div class="subLayout">
	<div class="subTit">상품검색</div>
	
	<div class="prodSearchArea">
		<div class="searchCate searchCate3">
			<p class="tit">카테고리</p>
			<ul>
				<li><a href="javascript:setCategory(0);" class="on">
				<img src="/giftcon/images/big/ico_cate1_on.jpg" alt="전체">
				</a></li>
				<li><a href="javascript:setCategory(1);" class="">
				<img src="/giftcon/images/big/ako37p8p00i0.jpg" alt="상품권/금액권">
				</a></li>
				<li><a href="javascript:setCategory(2);" class="">
				<img src="/giftcon/images/big/gjjl0p6cze8h.jpg" alt="커피/음료">
				</a></li>
				<li><a href="javascript:setCategory(3);" class="">
				<img src="/giftcon/images/big/gnn08t6enp04.jpg" alt="떡/베이커리">
				</a></li>
				<li><a href="javascript:setCategory(4);" class="">
				<img src="/giftcon/images/big/gtdp4l4fvwl9.jpg" alt="아이스크림/빙수">
				</a></li>
				<li><a href="javascript:setCategory(5);" class="">
				<img src="/giftcon/images/big/he4t8c1h5kyy.jpg" alt="편의점/마트">
				</a></li>
				<li><a href="javascript:setCategory(6);" class="">
				<img src="/giftcon/images/big/km8aom8h5dyh.jpg" alt="외식/레스토랑">
				</a></li>
				<li><a href="javascript:setCategory(7);" class="">
				<img src="/giftcon/images/big/t7laa794a1dx.jpg" alt="문화/생활/기타">
				</a></li>
			</ul>
		</div>
		<div class="searchCate">
		<form action="" method="get" id="categoryform">
			<p class="tit">브랜드</p>
			<ul class="brandCheck">
				<li><input type="checkbox" id="brandCheckAll"> 전체</li>
			<c:forEach items="${smallcategoryList}" var="list">
				<li><input type="checkbox" class="check" name="category" value="${list.CATEGORY_NUM}">${list.SMALL_CATEGORY}</li>
			</c:forEach>
			</ul>
			<div class="btn">
			<a href="/giftcon/goods/list.conn" class="btnBigLineBlue2 w163 mr10">초기화</a>
			<a href="#" class="btnBigBgBlue2 w163" onclick="formSubmit(); return false;">상품검색</a>
			</div>
		</form>
		</div>
	</div>

	<div class="subTit1">
		<span class="resultTxt">All<em>(${goodsCount}건)</em></span>
		<ul class="txtTab">
			<li><a href="javascript:goOrder('OD001');">인기순</a></li>
			<li><a href="javascript:goOrder('OD002');">최신등록순</a></li>
			<li><a href="javascript:goOrder('OD003');">낮은가격순</a></li>
			<li class="last"><a href="javascript:goOrder('OD004');" class="lineNone">높은가격순 </a></li>
		</ul>
	</div>
	<div class="todayprodArea mb30">
		<div class="fixBox bestBox">
		<h2>전체 상품</h2>
		<ul class="prodList">

			<c:forEach items="${goodsList}" var="list">
			<c:url var="viewURL" value="detail.conn"><c:param name="GOODS_NUM" value="${list.GOODS_NUM}" /></c:url>
			<li>
				<div class="prodBox">
					<p class="icoFlag">
					</p>
					<span class="prodImg"><a href="${viewURL}"><img src="/giftcon/images/email.png<%-- ${list.GOODS_IMG1} --%>"></a></span>
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
</div>
</div>
</div>
</div>
<script>
$(document).ready(function(){
	//전체를 체크하면 나머지도 전부 체크
    $("#brandCheckAll").click(function(){
        if($("#brandCheckAll").prop("checked")){
            $("input[name=category]").prop("checked",true);
        }else{
            $("input[name=category]").prop("checked",false);
        }
    })
})

function setCategory(categoryNo) {
	if( categoryNo == 0 ) {
		document.location.href = "/giftcon/goods/list.conn";
	} else {
		$("#brandCheckAll").prop('checked', false);
		$(".check").prop('checked', false);
		
		var form = document.goodsForm;
		form.pageNo.value = 1;
		form.categoryNo.value = categoryNo;
		form.priceSearchStart.value = 0;
		form.priceSearchEnd.value = 0;
		form.action = "/giftcon/goods/list.conn";
		form.submit();
	}
}
function formSubmit()
{
document.getElementById("categoryform").submit();
}
</script>
</body>
</html>
<%@include file="../module/footer.jsp"%>