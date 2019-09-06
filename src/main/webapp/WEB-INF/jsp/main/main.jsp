<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../module/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
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

<title>메인</title>
<%@include file="main-banner.jsp"%>
<%@include file="bestGoods.jsp"%>
<%@include file="saleGoods.jsp"%>
<%@include file="banner.jsp"%>
<%@include file="cscenter.jsp"%>
</head>
<body>
<%if(session.getAttribute("MEMBER_ID") != null) { %>
	<%if(Integer.valueOf(session.getAttribute("MEMBER_STATE").toString()) == 2){%>
		<script>
			alert("탈퇴한 회원이거나 삭제된 회원입니다.");
			document.location.href="/giftcon/logout.conn";
		</script>
	<%}	}%>
		
	

<div class="quick" id="floatMenu" style="top: 280px;">

<a href="/giftcon/goods/list.conn" title="추천상품바로가기" style="display:block; margin-bottom:4px;">
	<img src="/giftcon/images/download.jpg" width="100" alt="추천상품보기" style="margin-left: 5px;"><br>
	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button"value="전체상품" style="font-size:14px; color:black;">
</a>
<a href="/giftcon/cart/cartlist.conn">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button"value="장바구니" style="font-size:14px; color:black;"></a>

</div>

</body>
</html>
<%@include file="../module/footer.jsp"%>