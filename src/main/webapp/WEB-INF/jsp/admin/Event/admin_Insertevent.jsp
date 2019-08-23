<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:useBean id="now" class="java.util.Date"/>
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
<title>이벤트 등록하기</title>
</head>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/ui.css'/>" />
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
<script>



</script>
<div class="row" style="padding-left: 15px; width: 700px;">
	<h1 class="page-header">이벤트</h1>
</div>
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
				<h1 class="page-header">EVENT</h1>
			<div class="row" style="padding-left: 15px; width: 700px;">
		<div class="panel panel-default">
			<div class="panel-heading">이벤트 등록 페이지입니다.</div>
			<div class="panel-body">
				<form id="frm" enctype="multipart/form-data" onsubmit="return joinValidation(this)">
					<table class="event_view">
						<colgroup>
							<col width="15%">
							<col width="*" />
						</colgroup>	
						
						<caption>이벤트 등록</caption>
										<br><br>
						<tbody>
							<tr>
								<th style="width: 20px;">제목</th>
								<td style="width: *;">
									<input type="text" id="EVENT_TITLE" name="EVENT_TITLE" class="wdp_90" />
								</td>
							</tr>
							<th style="width: 20px;">이벤트 기간</th>
						<td style="width: *;">

				<input type="date" id="EVENT_START" name="EVENT_START" class="wdp_90" />
				부터
				<input type="date" id="EVENT_END" name="EVENT_END" class="wdp_90" />까지
					</td>
						<tr>
							 <th scope="row">	메인이미지</th>						
								<td colspan="2" class="view_Image"  >
								
									<div id="fileDiv">
							<input type="file" id="imgInput" title="메인이미지"  name="image_section" onchange="readURL(this)"/>
									<img id="image_section"  class="input" src="#"  alt="your image" width=700px height=500px />	
								</td>
							</tr>
						</div>
						</tbody>
					</table>
					<br/>
					<a href="#this" class="btn"  id="addFile">파일 추가</a>
				<input type="button" name="업로드" value="작성하기" id="insertEvent" class="btn btn-primary"/>
					<button type="button" onclick="onList()" id="eventList" class="btn btn-primary">목록</button>
				</form>
				</div>
			</div>
		</div>
		<script type="text/javascript">
		function readURL(input) {
			 if (input.files && input.files[0]) {
			  var reader = new FileReader();
			  
			  reader.onload = function (e) {
			   $('#' + input.name).attr('src', e.target.result);  
			  }
			  
			  reader.readAsDataURL(input.files[0]);
			  }
			}
			
					
		var gfv_count = 1;
			$(document).ready(function() {
				
		 	$("#eventList").on("click", function(e) { //목록으로 버튼
						e.preventDefault();
						fn_eventList();
					});	 
				
			$("#insertEvent").on("click", function(e) { //작성하기 버튼
					e.preventDefault();
					fn_eventInsert();
					});
				
			
			$("#addFile").on("click", function(e){//파일 추가 버튼
					e.preventDefault();
					fn_addFile();
			});
			
			$("a[name='delete']").on("click", function(e){ //삭제 버튼 
				e.preventDefault(); 
				fn_deleteFile($(this)); 
			});
			
		});
			
		 	function fn_eventList() {
				var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='/event/adminEventList.conn' />");
				comSubmit.submit();
			}
						
				function fn_eventInsert() {
				/* 	if (document.frm.EVENT_TITLE.value == "") {
						alert("제목을 입력해 주세요.");
						return false;
					} else if (document.frm.EVENT_IMG1.value == "") {
						alert("이미지를 등록해 주세요.");
						return false;
					} */
					var comSubmit = new ComSubmit("frm");
					comSubmit.setUrl("<c:url value='/event/adminEventInsert.conn' />");
					//comSubmit.addO
					comSubmit.submit();
					alert("등록되었습니다.");
					}
				
				function fn_addFile(){ 
					var str = "<td colspan='2'><p><input type='file' id='imgInput"+(gfv_count++)+"' name='image_section"+
					(gfv_count-1) +"' onchange='readURL(this)'><img id='image_section"+ 
					(gfv_count-1) +"' src='#' /><a href='#this' class='btn' name='delete'>삭제</a></p></td>"; 
					$("#fileDiv").append(str); 
					$("a[name='delete']").on("click", function(e){ //삭제 버튼 
						e.preventDefault(); 
					fn_deleteFile($(this)); 
				}); 
			} 
				
				function fn_deleteFile(obj){ 
					obj.parent().parent().remove(); 
					}
						

				$('.searchOption').val($('.searchOptionVal').val());
				
				function onList() {
					location.href = 'adminEventList.conn';
				}
		</script>
			
			<!-- // container -->
		</div>
		<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->
</body>
</html>