<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../module/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<title>이벤트</title>

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

</head>
<body>
<div class="subWrap">
				<div class="subLayout">
					<!-- start:Tab -->
					<ul class="subTabMb40 subTab">
						<li><a href="#" class="on" id="btnGoEvent">진행중인 이벤트</a></li>
						<li><a href="#" class="" id="btnGoEndEvent">종료된 이벤트</a></li>
					</ul>
					<!-- /end:Tab -->
					<!-- start:event_list -->
					<div id="divEventList">
						<ul class="eventList">
							<c:forEach var="eventList" items="${eventList}" varStatus="stat">						
							<li class="mbNone" style="margin-right: 5px;">
								<c:if test="${not empty eventList.EVENT_IMG}">
								<c:set var="i" value="0"/>
								<c:set var="logo" value="${fn:split(eventList.EVENT_IMG,',')}"/>
								<c:forEach var="logo" items="${logo}">
								<c:if test="${i eq 0}">
								<a href="/giftcon/eventDetail.conn?EVENT_NUM=${eventList.EVENT_NUM}"><img src="/giftcon/resources/file/event/${logo}" alt=""></a>
								<c:set var="i" value="1"/>
								</c:if>
								</c:forEach>
								</c:if>
								
								<span class="eventTit">${eventList.EVENT_TITLE} </span>
								<span class="eventTxt">이벤트 기간 : <fmt:formatDate value="${eventList.EVENT_START}" pattern="yyyy.MM.dd"/>~
										<fmt:formatDate value="${eventList.EVENT_END}" pattern ="yyyy.MM.dd"/></span>
							</li>
							</c:forEach>
						</ul>
					</div>
					<div id="divEndEventList" style="display:none;">
						<ul class="eventList">
							<c:forEach var="endEventList" items="${endEventList}" >
							<li class="mbNone" style="margin-right: 5px;" >
								<c:set var="i" value="0"/>
								<c:if test="${not empty endEventList.EVENT_IMG}">
								<c:set var="logo" value="${fn:split(endEventList.EVENT_IMG,',')}"/>
								<c:forEach var="logo" items="${logo}">
								<c:if test="${i eq 0}">
								<span class="finishStamp" style="display: inline-block; width: 354px; height: 218px; background: url(/giftcon/images/ico_event.png) no-repeat 0 -273px; position: absolute; top: 1px; left: 1px;"></span>
								<a href="/giftcon/eventDetail.conn?EVENT_NUM=${endEventList.EVENT_NUM}"></a>
								<img src="/giftcon/resources/file/event/${logo}" alt="">
								<c:set var="i" value="1"/>
								</c:if>
								</c:forEach>
								</c:if>
								<span class="eventTit">${endEventList.EVENT_TITLE}</span>
								<span class="eventTxt">이벤트 기간 : <fmt:formatDate value="${endEventList.EVENT_START}" pattern="yyyy.MM.dd"/>~
										<fmt:formatDate value="${endEventList.EVENT_END}" pattern="yyyy.MM.dd"/></span>
							</li>
							</c:forEach>
						</ul>
					</div>
					<!-- /end:event_list -->
				</div>
			</div>
<script type="text/javascript">
$(document).ready(function() {
	$("#btnGoEvent").click(function () {
		$(this).attr("class","on");
		$("#btnGoEndEvent").attr("class","");
		$("#divEventList").show();
		$("#divEndEventList").hide();
		return false;
	});
	
	$("#btnGoEndEvent").click(function () {
		$(this).attr("class","on");
		$("#btnGoEvent").attr("class","");
		$("#divEventList").hide();
		$("#divEndEventList").show();
		return false;
	});
});
</script>
<div class="quick" id="floatMenu" style="top: 280px;">

<a href="/giftcon/goods/list.conn" title="추천상품" style="display:block; margin-bottom:4px;">
	<img src="/giftcon/images/download.jpg" width="100" alt="추천상품보기" style="margin-left: 5px;"><br>
	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button"value="전체상품" style="font-size:14px; color:black;">
</a>
<a href="/giftcon/cart/cartlist.conn">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="장바구니"  style="font-size:14px; color:black;"></a>
</div>
</body>
</html>
<%@include file="../module/footer.jsp"%>