<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>ShareCon 관리자페이지</title>
<!-- Bootstrap Core CSS -->
<link href="/giftcon/css/jquery/bootstrapadmin.min.css" rel="stylesheet" type="text/css">
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
<script type="text/javascript" src="/giftcon/css/jquery/jquery-1.12.4.min.js"></script>
<script>
	function joinValidation(frm) {
		if (frm.NOTICE_TITLE.value == "") {
			alert("제목을 입력해 주세요.");
			return false;
		} else if (frm.NOTICE_CNT.value == "") {
			alert("내용을 입력해 주세요.");
			return false;
		}
		alert("수정되었습니다.")
	}

	$('.searchOption').val($('.searchOptionVal').val());

	var onList = function() {
		location.href = 'adminNotifyList.conn';
	};
</script>
</head>
<body>
<div id="wrapper">
		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0; background-color: #337AB7">
			<div class="navbar-header" style="background-color: #337AB7">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" style="color: #fff;" href="/giftcon/adminMain.conn"><strong>ShareCon 관리자페이지</strong></a>
			</div>
			<!-- /.navbar-header -->
			<div class="navbar-default sidebar" role="navigation">
				<div class="sidebar-nav navbar-collapse">
					<ul class="nav" id="side-menu">
						<li>
							<a href="/giftcon/adminMain.conn" style="background: #e7e7e7; border-bottom: 1px solid #F8F8F8;">
								<b class="fa fa-dashboard fa-fw">관리자홈</b>
							</a>
						</li>
						<li>
							<a href="/giftcon/main.conn" style="background: #e7e7e7; border-bottom: 1px solid #F8F8F8;">
								<b class="fa fa-dashboard fa-fw">홈으로 이동</b>
							</a>
						</li>
						<li class="active">
							<a href="#" style="background: #e7e7e7;">
								<b class="fa fa-bar-chart-o fa-fw">상품관리</b>
								<span class="fa arrow">▼</span>
							</a>
							<ul class="nav nav-second-level">
								<li><a href="/giftcon/goods/adminGoodsList.conn">- 상품목록</a></li>
								<li><a href="/giftcon/goods/goodsInsertForm.conn">- 상품등록</a></li>
							</ul>
						</li>
						<li class="active">
							<a href="#" style="background: #e7e7e7;">
								<b class="fa fa-dashboard fa-fw">회원관리</b>
								<span class="fa arrow">▼</span>
							</a>
							<ul class="nav nav-second-level">
								<li><a href="/giftcon/member/adminMemberList.conn">- 회원목록</a></li>
							</ul> <!-- /.nav-second-level -->
						</li>

						<li class="active">
							<a href="#" style="background: #e7e7e7;">
								<b class="fa fa-bar-chart-o fa-fw">주문관리</b>
								<span class="fa arrow">▼</span>
							</a>
							<ul class="nav nav-second-level">
								<li><a href="/giftcon/adminOrder.conn">- 주문목록&수정</a></li>
							</ul>
						</li>
						<li class="active">
							<a href="#" style="background: #e7e7e7;">
								<b class="fa fa-bar-chart-o fa-fw">게시판관리</b>
								<span class="fa arrow">▼</span>
							</a>
							<ul class="nav nav-second-level">
								<li><a href="/giftcon/notify/adminNotifyList.conn">- 공지사항</a></li>
								<li><a href="/giftcon/event/adminEventList.conn">- 이벤트</a></li>
								<li><a href="/giftcon/faq/adminFaqList.conn">- FAQ</a></li>
								<li><a href="/giftcon/adminQnaList.conn">- Q&A</a></li>
								<li><a href="/giftcon/adminCategory1.conn">- 카테고리추가</a></li>
								<li><a href="/giftcon/adminReviewList.conn">- 리뷰관리</a>
							</ul>
						</li>
					</ul>
				</div>
				<!-- /.sidebar-collapse -->
			</div>
			<!-- /.navbar-static-side -->
		</nav>
		<div id="page-wrapper" align="center">
			<!-- 메인container-->
			<div class="row" style="padding-left: 15px; width: 700px;">
	<h1 class="page-header">게시글 수정</h1>
</div>

<div class="row" style="padding-left: 15px; width: 700px;">
	<div class="panel panel-default">
		<div class="panel-heading">공지사항 수정 페이지입니다.</div>
		<div class="panel-body">
			<form:form id="notifyDetail" action="adminNotifyModify.conn"
				method="post" name="joinform" onsubmit="return joinValidation(this)"
				enctype="multipart/form-data">
				<input type="hidden" id="NOTICE_NUM" name="NOTICE_NUM"
					value="${notifyDetail.NOTICE_NUM}">
				<div class="form-group">
					<label>제목</label> <input type="text" class="form-control"
						id="NOTICE_TITLE" name="NOTICE_TITLE"
						value="${notifyDetail.NOTICE_TITLE}" style="width: 500px;" />
				</div>
				</br>
				<div class="form-group">
					<label>내용</label> <textarea rows="20"  class="form-control"
						id="NOTICE_CNT" name="NOTICE_CNT"
						style="width: 500px;">${notifyDetail.NOTICE_CNT}</textarea><br />
					 <br />
								</div>
				<div class="form-group">
					<label>등록일자</label>
					<fmt:formatDate value="${notifyDetail.NOTICE_REGDATE}"
						pattern="YY.MM.dd" />
				</div>
				<button type="submit" class="btn btn-success">수정</button>
				<button type="reset" class="btn btn-success">초기화</button>
				<button type="button" onclick="onList()" id="noticeList"
					class="btn btn-success">목록</button>
			</form:form>
		</div>
	</div>
</div>
			
			<!-- // container -->
		</div>
		<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->
</body>
</html>