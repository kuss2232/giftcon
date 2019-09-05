<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../module/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style>
#floatMenu {
	position: absolute;
	width: 200px;
	height: 200px;
	left: 50px;
	top: 10px;
	background-color: #606060;
	color: #fff;
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
		
	
	<div style="height:5px">

</div>
<div id="floatMenu">
플로팅 메뉴
</div>
	
</body>
</html>
<%@include file="../module/footer.jsp"%>