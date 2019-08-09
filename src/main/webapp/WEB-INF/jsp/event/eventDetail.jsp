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
					<!-- start:sub_title -->
					<div class="subTit">이벤트</div>
					<!-- /end:sub_title -->
					<!-- start:contents -->
					<div class="viewBox">
						<div class="titTop">
							<span class="tit">${map.EVENT_TITLE}</span>
							<span class="infoTxt1">
								<span>이벤트 기간 : <fmt:formatDate value="${map.EVENT_START}" pattern="yyyy.MM.dd"/>~
										<fmt:formatDate value="${map.EVENT_END}" pattern="yyyy.MM.dd"/></span>
							</span>
						</div>
							<!-- 일반 이벤트 -->
								<div class="notiCont">,<p style="text-align: center; ">
								<c:forEach var="IMG" items="${IMGLIST}">
                     <img src="/giftcon/resources/file/event/${IMG}" width="1100" height="700"  >
                     <br/>
                  </c:forEach>						
						</p>
						</div>
					</div>
					<!-- /end:contents -->
					<!-- start:btm -->
					<div class="btn2">
						<a href="/giftcon/eventList.conn" class="btnBigLineBlue2 w154">목록보기</a>
					</div>
					<!-- /end:btm -->
				</div>
			</div>
</body>
</html>
<%@include file="../module/footer.jsp"%>