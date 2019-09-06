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



	<style>
	.quick{position:absolute; right:100px; top:280px; width:90px;}
	.quicktop{}
	.quicktop span{display:inline-block; width:88px; height:21px; text-align:center; color:#999999; font-size:12px; border:solid 1px #d9d9d9; margin-bottom:1px; cursor:pointer; background:#fff;}
	.quicktop span.on{display:inline-block; width:88px; height:20px; margin-bottom:11px; text-align:center; color:#fff; background:#333333; font-weight:normal;}

	.quick_in{width:69px;overflow:hidden; border:solid 1px #d9d9d9;margin:0 auto; margin-bottom:10px; background: #fff;}
	.quick_in ul{}
	.quick_in ul li{border-bottom:solid 1px #d9d9d9;}
	.quick_in ul li:last-child, .quick_in ul li.last {border-bottom:none;}
	.quick_in ul li img{width:58px; height:auto; margin-left:5px; padding: 5px 0;}
	.quickbt{}
	.quickbt span{display:inline-block;}
	.quickbt span:first-child{margin-right:9px;}
	.quick_etcbt{display:block; width:88px; height:18px; text-align:center; border:solid 1px #d9d9d9; color:#999999; font-size:12px; padding:3px 0 0 0; margin-bottom:1px; }
	</style>
	
<style>
#floatdiv{z-index:9999;}
#floatdiv {
	position: absolute;
	width: 100px;
	height: 100px;
	left: 50px;
	top: 10px;	
}
</style>

<script>
$(document).ready(function() {

	// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
	var floatPosition = parseInt($("#floatMenu").css('top'));
	// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

	$(window).scroll(function() {
		// 현재 스크롤 위치를 가져온다.
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + floatPosition + "px";

		/* 애니메이션 없이 바로 따라감
		 $("#floatMenu").css('top', newPosition);
		 */

		$("#floatMenu").stop().animate({
			"top" : newPosition
		}, 500);
	}).scroll();

});
</script>
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
					<c:url var="viewURL1" value=""><c:param name="big" value="1" /></c:url>
					<c:url var="viewURL2" value=""><c:param name="big" value="2" /></c:url>
					<c:url var="viewURL3" value=""><c:param name="big" value="3" /></c:url>
					<c:url var="viewURL4" value=""><c:param name="big" value="4" /></c:url>
					<c:url var="viewURL5" value=""><c:param name="big" value="5" /></c:url>
				<li><a href="${viewURL1}" id="BIG_CATEGORY" class="">
				<img src="/giftcon/images/big/aajjw8f85icn.jpg" alt="치킨/피자/버거"></a></li>
				<li><a href="${viewURL2}" id="BIG_CATEGORY" class="">
				<img src="/giftcon/images/big/gjjl0p6cze8h.jpg" alt="커피/음료"></a></li>
				<li><a href="${viewURL3}" id="BIG_CATEGORY" class="">
				<img src="/giftcon/images/big/gtdp4l4fvwl9.jpg" alt="아이스크림/빙수"></a></li>
				<li><a href="${viewURL4}" id="BIG_CATEGORY" class="">
				<img src="/giftcon/images/big/ban.png" alt="베이커리/도넛"></a></li>
				<li><a href="${viewURL5}" id="BIG_CATEGORY" class="">
				<img src="/giftcon/images/big/he4t8c1h5kyy.jpg" alt="편의점/마트"></a></li>
			</ul>
		</div>
		<div class="searchCate">
		<form action="" method="get" id="categoryform">
			<input type="hidden" id="currentPage" name="currentPage">
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
			<li><a href="/giftcon/goods/hotList.conn" >인기순<input type="hidden" id="memberNum" value="${MEMBER_NUM}"/></a></li>
			<li><a href="/giftcon/goods/gradeList.conn" >평점순</a></li>
			<li><a href="/giftcon/goods/lowList.conn" >할인상품(낮은가격순)</a></li>
			<li class="last"><a href="/giftcon/goods/highList.conn" class="lineNone">할인상품(높은가격순)</a></li>
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
						<c:if test="${list.GOODS_HITCOUNT>100}"><span class="bestF"><em>Best</em></span></c:if>
						<c:if test="${!empty list.GOODS_DCPRICE}"><span class="downF"><em>SALE</em></span></c:if>
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
						
						
						
						
						<%if(session.getAttribute("MEMBER_ID") != null){ %>
						<li><a href="/giftcon/orderForm.conn?GOODS_NUM=${list.GOODS_NUM}" class="first"><span class="nowSend"></span><span class="sendTxt">바로발송</span></a></li>
						<li><a href="#"><span class="cartPut"></span><span onclick="addCart(${list.GOODS_NUM})" class="sendTxt">장바구니</span></a></li>
						<%} else { %>
						<li><a href="/giftcon/loginForm.conn" class="first"><span class="nowSend"></span><span class="sendTxt">바로발송</span></a></li>
						<li><a href="/giftcon/loginForm.conn"><span class="icoOneAsk"></span><span class="cartPut"></span>
						<span class="sendTxt">장바구니</span></a></li>
						<%} %>
					
					</ul>
				</div>
			</li>
			</c:forEach>
		</ul>					
		</div>
		<div>
			<div class="paginate"><ul class="numList">${pagingHtml}</ul></div>
		</div>
	</div>
</div>
</div>
</div>
</div>
<script>
$(document).ready(function(){
    $("#brandCheckAll").click(function () {
		$(".check").prop('checked', $(this).prop('checked'));
	});
	
	$(".check").click(function() {
		if ($(".check").length == $(".check:checked").length) {
			$("#brandCheckAll").prop('checked', true);
		} else {
			$("#brandCheckAll").prop('checked', false);
		}
	});
	
	
	$("#brandCheckAll").prop('checked', true);
	$(".check").prop('checked', true);
});

/* function setCategory(categoryNo) {
	var big = document.getElementById("BIG_CATEGORY").firstChild.nodeValue;
	if( categoryNo == 1 ) {
		document.location.href = "/giftcon/goods/list.conn";
	} else {
		$("#brandCheckAll").prop('checked', false);
		$(".check").prop('checked', false);
		
		var form = document.goodsForm;
		form.pageNo.value = 1;
		form.categoryNo.value = categoryNo;
		form.action = "/giftcon/goods/list.conn";
		form.submit();
	}
} */
function formSubmit()
{
document.getElementById("categoryform").submit();
}

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
<div class="quick" id="floatMenu" style="top: 280px;">

<a href="/giftcon/eventList.conn" title="이벤트" style="display:block; margin-bottom:4px;">
	<img src="/giftcon/images/download.jpg" width="100" alt="추천상품보기" style="margin-left: 5px;"><br>
	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button"value="이벤트" style="font-size:14px; color:black;">
</a>
<a href="/giftcon/cart/cartlist.conn">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="장바구니"  style="font-size:14px; color:black;"></a>

</div>
</body>
</html>
<%@include file="../module/footer.jsp"%>