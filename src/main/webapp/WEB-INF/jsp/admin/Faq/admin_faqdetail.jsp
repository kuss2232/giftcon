<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>ShareCon 관리자페이지</title>
<!-- Bootstrap Core CSS -->
<link href="/giftcon/css/jquery/bootstrapadmin.min.css" rel="stylesheet"
	type="text/css">
<style type="text/css">
@media ( min-width :768px) {
	#page-wrapper {
		margin: 0 0 0 250px !important;
	}
}
</style>

<!-- Custom CSS -->
<link href="/giftcon/css/jquery/sb-admin-2.css" rel="stylesheet">
<!-- jQuery -->

<script src="/giftcon/css/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="/giftcon/css/jquery/bootstrap.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="/giftcon/css/jquery/sb-admin-2.js"></script>
<title>관리자 FAQ</title>

<!-- Service CSS -->
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/jquery/swiper.min.css">
<link rel="stylesheet" type="text/css" href="/giftcon/css/sub.css">

</head>
<body>
	<div id="wrapper">
		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0; background-color: #337AB7">
			<div class="navbar-header" style="background-color: #337AB7">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" style="color: #fff;"
					href="/giftcon/adminMain.conn"><strong>ShareCon
						관리자페이지</strong></a>
			</div>
			<!-- /.navbar-header -->
			<div class="navbar-default sidebar" role="navigation">
				<div class="sidebar-nav navbar-collapse">
					<ul class="nav" id="side-menu">
						<li><a href="/giftcon/adminMain.conn"
							style="background: #e7e7e7; border-bottom: 1px solid #F8F8F8;">
								<b class="fa fa-dashboard fa-fw">관리자홈</b>
						</a></li>
						<li><a href="/giftcon/main.conn"
							style="background: #e7e7e7; border-bottom: 1px solid #F8F8F8;">
								<b class="fa fa-dashboard fa-fw">홈으로 이동</b> 
						</a></li>
						<li class="active"><a href="#" style="background: #e7e7e7;">
								<b class="fa fa-bar-chart-o fa-fw">상품관리</b> <span
								class="fa arrow">▼</span>
						</a>
							<ul class="nav nav-second-level">
								<li><a href="/giftcon/goods/adminGoodsList.conn">-
										상품목록</a></li>
								<li><a href="/giftcon/goods/goodsInsertForm.conn">-
										상품등록</a></li>
							</ul></li>
						<li class="active"><a href="#" style="background: #e7e7e7;">
								<b class="fa fa-dashboard fa-fw">회원관리</b> <span class="fa arrow">▼</span>
						</a>
							<ul class="nav nav-second-level">
								<li><a href="/giftcon/member/adminMemberList.conn">-
										회원목록</a></li>
							</ul> <!-- /.nav-second-level --></li>

						<li class="active"><a href="#" style="background: #e7e7e7;">
								<b class="fa fa-bar-chart-o fa-fw">주문관리</b> <span
								class="fa arrow">▼</span>
						</a>
							<ul class="nav nav-second-level">
								<li><a href="/giftcon/adminOrder.conn">- 주문목록&수정</a></li>
							</ul></li>
						<li class="active"><a href="#" style="background: #e7e7e7;">
								<b class="fa fa-bar-chart-o fa-fw">게시판관리</b> <span
								class="fa arrow">▼</span>
						</a>
							<ul class="nav nav-second-level">
								<li><a href="/giftcon/notify/adminNotifyList.conn">-
										공지사항</a></li>
								<li><a href="/giftcon/event/adminEventList.conn">- 이벤트</a></li>
								<li><a href="/giftcon/faq/adminFaqList.conn">- FAQ</a></li>
								<li><a href="/giftcon/adminQnaList.conn">- Q&A</a></li>
								<li><a href="/giftcon/adminCategory1.conn">- 카테고리추가</a></li>
								<li><a href="/giftcon/adminReviewList.conn">- 리뷰관리</a>
							</ul></li>
					</ul>
				</div>
				<!-- /.sidebar-collapse -->
			</div>
			<!-- /.navbar-static-side -->
		</nav>
		<div id="page-wrapper">
			<!-- 메인container-->
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
									<span class="tit"> ${faqDetail.FAQ_TITLE}</span> <span
										class="infoTxt1"> <span>카테고리 :
											${faqDetail.FAQ_CATEGORY} | 조회 : ${faqDetail.FAQ_HITCOUNT}</span>
									</span>
								</div>
								<div class="notiCont"><pre>${faqDetail.FAQ_CNT}</pre></div>
							</div>
							<!-- /end:contents -->
							<!-- start:btm -->
							<div class="btn2">
								<a href="#" class="btnBigLineBlue2 w154"
									onclick="javascript:goList(); return false;">목록보기</a>
							</div>
							<!-- /end:btm -->
						</div>
					</div>
					<!-- /end:contents -->
				</div>
			</div>
			<script>
				function goList() {
					var referrer = document.referrer;
					(referrer.indexOf("/faq/adminFaqList.conn") + 1) ? history.back(): document.location.href = "/faq/adminFaqList.conn";
				}
			</script>

			<!-- // container -->
		</div>
		<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->

</body>
</html>