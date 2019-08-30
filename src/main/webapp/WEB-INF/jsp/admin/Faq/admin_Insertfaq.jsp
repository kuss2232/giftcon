<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FAQ 등록하기</title>
<script type="text/javascript" src="/giftcon/css/jquery/jquery-1.12.4.min.js"></script>
</head>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/ui.css'/>" />
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
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
				<h1 class="page-header">FAQ</h1>
				<div class="row" style="padding-left: 15px; width: 700px;">
		<div class="panel panel-default">
			<div class="panel-heading">FAQ 등록 페이지입니다.</div>
			<div class="panel-body">
				<form id="frm" name="frm" >
					<table class="faq_view">
						<colgroup>
							<col width="15%">
							<col width="*" />
						</colgroup>	
						<caption>게시글 작성</caption>
										<br><br>
						<tbody>
							<tr>
								<th scope="row" >제목</th>
								<td>
									<input type="text" id="FAQ_TITLE" name="FAQ_TITLE" class="wdp_90" />
								</td>
							</tr>
							<div class="inputArea">
							<label>카테고리</label>
							<select class="faqCategorty"  id="FAQ_CATEGORY">
								<option value="회원">회원</option>
								<option value="상품">상품</option>
								<option value="주문">주문</option>
								<option value="환불">환불</option>
								<option value="기타">기타</option>
							</select>
							</div>
							<tr>
								<th scope="row" >내용</td>
								<td colspan="2" class="view_text">
									<textarea rows="20" cols="80" title="내용" id="FAQ_CNT" name="FAQ_CNT"></textarea>
								</td>
							</tr>
							<!-- <tr>
								<th scope="row">첨부<br/>파일</th>
								<td><input type="file" id="NOTICE_IMG" name="NOTICE_IMG" style="width: initial;" /></td>
							</tr> -->
						</tbody>
					</table>
					<br/>
					<!-- <input type="file" id="NOTIFY_IMAGE" name="NOTIFY_IMAGE" style="width: initial;" /> <br/> -->
					<input type="button" name="업로드" value="작성하기" id="insertFaq" class="btn btn-primary"  />
					<button type="button" onclick="onList()" id="faqList" class="btn btn-primary">목록</button>
				</form>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			$(document).ready(function() {

				$("#insertFaq").on("click", function(e) { //작성하기 버튼
					e.preventDefault();
					fn_faqWrite();
					});
				});

				function fn_faqWrite() {
					if (document.frm.FAQ_TITLE.value == "") {
						alert("제목을 입력해 주세요.");
						return false;
					} else if (document.frm.FAQ_CNT.value == "") {
						alert("내용을 입력해 주세요.");
						return false;
					}
					var comSubmit = new ComSubmit("frm");
					comSubmit.setUrl("<c:url value='/faq/adminWriteFaq.conn' />");
					comSubmit.addParam("FAQ_CATEGORY", $("#FAQ_CATEGORY").val());
					comSubmit.submit();
					alert("등록되었습니다.")
				}
				
				
				
								$('.searchOption').val($('.searchOptionVal').val());
				
				var onList = function() {
					location.href = 'adminFaqList.conn';
				}; 
		 </script>
			
			<!-- // container -->
		</div>
		<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->
</body>
</html>