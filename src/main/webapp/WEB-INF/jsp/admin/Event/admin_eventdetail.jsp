<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>EVENT</title>

<!-- Service CSS -->
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/jquery/swiper.min.css">
<link rel="stylesheet" type="text/css" href="/giftcon/css/sub.css">

</head>
<body>
<div id="container">
		<div class="contents">
			<!-- start:contents -->
			<div class="subWrap">
				<div class="subLayout">
					<!-- start:csTab -->
					<!-- /end:csTab -->
					<!-- start:sub_title -->
					<div class="subTit">[EVENT] 이벤트 게시판입니다</div>
					<!-- /end:sub_title -->
					<!-- start:contents -->
					<div class="viewBox">
						<div class="titTop">
							<span class="tit" ><h2> ${eventDetail.EVENT_TITLE}</h2></span>
							</br>
							<span class="infoTxt1">
								<td>이벤트 기간 :
				<fmt:formatDate value="${eventDetail.EVENT_START}" pattern="YY.MM.dd"/>~
				<fmt:formatDate value="${eventDetail.EVENT_END}" pattern="YY.MM.dd"/></td>
							</span>
						</div>
						<div class="notiCont" align="center">
						<c:forEach var="IMG" items="${IMGLIST}">
							<img src="/giftcon/resources/file/Eventfile/${IMG}" width="1100" height="700"  >
							<br/>
						</c:forEach>
						</div>
					
					</div>
					<!-- /end:contents -->
					<!-- start:btm -->
					<div class="btn2">
						<a href="#" class="btnBigLineBlue2 w154" onclick="javascript:goList(); return false;">목록보기</a>
					</div>
					<!-- /end:btm -->
				</div>
			</div>
			<!-- /end:contents -->
		</div>
	</div>
<script>
function goList() {
	var referrer =  document.referrer;
	(referrer.indexOf("/event/adminEventList.conn")+1) ? history.back() : document.location.href = "/event/adminEventList.conn";
}
</script>
</body>
</html>