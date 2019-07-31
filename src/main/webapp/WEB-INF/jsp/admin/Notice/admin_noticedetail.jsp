<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>관리자 공지사항</title>

<!-- Service CSS -->
<link rel="stylesheet" type="text/css" href="/giftcon/css/common.css">
<link rel="stylesheet" type="text/css" href="/giftcon/css/jquery/swiper.min.css">
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
					<div class="subTit">[공지사항] 쉐어콘 서비스의 새로운 소식을 알려드립니다!</div>
					<!-- /end:sub_title -->
					<!-- start:contents -->
					<div class="viewBox">
						<div class="titTop">
							<span class="tit">${noticeDetail.NOTICE_TITLE}</span>
							<span class="infoTxt1">
								<span>조회 : ${noticeDetail.NOTICE_HITCOUNT}</span> | <span>날짜 : ${noticeDetail.NOTICE_REGDATE}</span>
							</span>
						</div>
						<div class="notiCont">${noticeDetail.NOTICE_CNT}</div>
						<div class="notiCont">
							<c:if test="${noticeDetail.NOTICE_IMG ne null}">
								<img src="/giftcon/file/noticeFile/${noticeDetail.NOTICE_IMG}" width="500">
							</c:if>
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
	(referrer.indexOf("/giftcon/notice.conn")+1) ? history.back() : document.location.href = "/giftcon/notice.conn";
}
</script>
</body>
</html>