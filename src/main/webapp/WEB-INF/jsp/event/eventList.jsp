<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../module/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</body>
</html>
<%@include file="../module/footer.jsp"%>