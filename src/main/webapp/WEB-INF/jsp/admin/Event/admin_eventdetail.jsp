<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
							<span class="tit"> ${eventDetail.EVENT_TITLE}</span>
						</div>
						<div class="notiCont">${eventDetail.EVENT_IMG1}</div>
						<div class="notiCont">${eventDetail.EVENT_IMG2}</div>
						<div class="notiCont">${eventDetail.EVENT_IMG3}</div>
						<div class="notiCont">${eventDetail.EVENT_IMG4}</div>
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