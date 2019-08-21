<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
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
	
	<script src="/giftcon/css/common.js" charset="utf-8"></script>
	<script src="/giftcon/css/jquery/jquery-1.12.4.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	function button2_click() {
		location.href = "adminQnaReplyDelete.conn?QNA_NUM=${qnaDetail.QNA_NUM}";
	}
	function goList(){
		location.href="/giftcon/adminQnaList.conn";
	}
	function do_Upate(qna_num){
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/adminQnaReplyForm.conn'/>");
		comSubmit.addParam("QNA_NUM", qna_num);
		comSubmit.submit();
	}
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
		<div id="page-wrapper">
			<!-- 메인container-->
			<div class="row" style="padding-left: 15px; width: 700px;">
	<h1 class="page-header">Q&A 상세보기</h1>
</div>

<div class="row" style="padding-left: 15px; width: 700px;">
	<div class="panel panel-default">
		<div class="panel-heading">Q&A 상세보기 페이지입니다.</div>
		<div class="panel-body">
				<form id="frm" name="frm">
				<div class="form-group">
					<label>QNA 글번호</label> 
					<input type="text" class="form-control" name="QNA_NUM" value="${qnaDetail.QNA_NUM}" style="width: initial;" readonly />
				</div>

				<div class="form-group">
					<label>QNA 카테고리</label> 
					<input type="text" class="form-control" id="QNA_CATEGORY" name="QNA_CATEGORY" value="${qnaDetail.QNA_CATEGORY}" style="width: initial;" readonly />
				</div>
				<div class="form-group">
					<label>제목</label> 
					<input type="text" class="form-control" id="QNA_TITLE" name="QNA_TITLE" value="${qnaDetail.QNA_TITLE}" style="width: initial;" readonly />
				</div>

				<div class="form-group">
					<label>회원 아이디</label> 
					<input type="text" class="form-control" id="MEMBER_ID" name="MEMBER_ID" value="${qnaDetail.MEMBER_ID}" style="width: 250px;" readonly />
				</div>
				<div class="form-group">
					<label>내용</label>
					<textarea class="form-control" id="QNA_CONTENT" name="QNA_CONTENT" rows="10" cols="30" readonly>${qnaDetail.QNA_CNT}</textarea>
				</div>
				<c:choose>
					<c:when test="${qnaDetail.QNA_FILE eq null}">
						<div class="form-group">
							<label>등록 이미지</label>
						</div>
						<div class="form-group">
						</div>
					</c:when>
				</c:choose>
				<div class="form-group">
					<label>문의날짜</label> 
					<input type="text" class="form-control" id="QNA_DATE" name="QNA_DATE"
						value="${qnaDetail.QNA_DATE}" style="width: initial;" readonly />
				</div>

				<div class="form-group">
					<label>답변</label>
					<textarea class="form-control" id="QNA_REPCONTENT" name="QNA_REPCONTENT" rows="10" cols="30" readonly>${qnaDetail.QNA_COMMENT}</textarea>
				</div>
				<c:if test="${qnaDetail.QNA_REDATE ne null}">
					<div class="form-group">
						<label>답변날짜</label> 
						<input type="text" class="form-control" id="QNA_REGDATE" name="QNA_REPDATE"
							value="${qnaDetail.QNA_REDATE}"	style="width: initial;" readonly />
					</div>
				</c:if>
				<c:if test="${qnaDetail.QNA_COMMENT eq null}">
					<button type="button" class="btn btn-success" onclick="do_Upate(${qnaDetail.QNA_NUM});">답변달기</button>
				</c:if>
				<c:if test="${qnaDetail.QNA_COMMENT ne null}">
					<button type="button" class="btn btn-success" onclick="do_Upate(${qnaDetail.QNA_NUM});">답변수정</button>
					<button type="button" class="btn btn-success" onclick="button2_click();">답변삭제</button>
				</c:if>
					<button type="button" class="btn btn-outline btn-default" onclick="goList()">목록으로</button>
			</form>
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