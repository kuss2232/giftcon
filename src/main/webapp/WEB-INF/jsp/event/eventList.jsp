<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../module/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
								<a href="/giftcon/eventDetail.conn?EVENT_NUM=${eventList.EVENT_NUM}"><img src="/3N1DATA01/donutbook/contents/event/7fw41n4tcwsb867v2hf7.png" alt=""></a>
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
							<li class=" ">
								<span class="finishStamp"></span><img src="/3N1DATA01/donutbook/contents/event/hj2ftt90p8ae7ebgdkkf.jpg" alt="">
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