<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>관리자 공지사항</title>

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
					<div class="subTit">[FAQ] 자주 묻는 질문들</div>
					<!-- /end:sub_title -->
					<!-- start:contents -->
					<div class="viewBox">
						<div class="titTop">
							<span class="tit"> ${faqDetail.FAQ_TITLE}</span>
							<span class="infoTxt1">
								<span>카테고리 : ${faqDetail.FAQ_CATEGORY}  | 조회 : ${faqDetail.FAQ_HITCOUNT}</span>
							</span>
						</div>
						<div class="notiCont">${faqDetail.FAQ_CNT}</div>
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
	(referrer.indexOf("/faq/adminFaqList.conn")+1) ? history.back() : document.location.href = "/notify/adminNotifyList.conn";
}
</script>
</body>
</html>