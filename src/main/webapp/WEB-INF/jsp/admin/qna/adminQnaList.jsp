<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.paging{text-align:center;height:32px;margin-top:5px;margin-bottom:15px;}
.paging a,
.paging strong{display:inline-block;width:36px;height:32px;line-height:28px;font-size:14px;border:1px solid #e0e0e0;margin-left:5px;
-webkit-border-radius:3px;
   -moz-border-radius:3px;
		border-radius:3px;
-webkit-box-shadow:1px 1px 1px 0px rgba(235,235,235,1);
	-moz-box-shadow:1px 1px 1px 0px rgba(235,235,235,1);
		  box-shadow:1px 1px 1px 0px rgba(235,235,235,1);
}
.paging a:first-child{margin-left:0;}
.paging strong{color:#fff;background:#337AB7;border:1px solid #337AB7;}
.paging .page_arw{font-size:11px;line-height:30px;}
</style>
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
<style>
div.paginate>div>a.disabled:hover {
	border: 1px solid #ddd;
}
</style>

<script src="/giftcon/css/common.js" charset="utf-8"></script>
<script src="/giftcon/css/jquery/jquery-1.12.4.min.js"></script>
<title>관리자Q&amp;A리스트</title>

<script type="text/javascript">

function fn_qnaDelete(qna_num){ 
	if(confirm("정말 삭제하시겠습니까 ?") == true){
		var comSubmit = new ComSubmit(); 
		alert("삭제되었습니다");
		comSubmit.setUrl("<c:url value='/adminQnaReplyDelete.conn' />");
		comSubmit.addParam("QNA_NUM", qna_num);
		comSubmit.submit(); 
		
		}
	 else{
		return ;
	 }
}

function fn_qnaDetail(qna_num){
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/adminQnaDetail.conn'/>");
	comSubmit.addParam("QNA_NUM", qna_num);
	comSubmit.submit();
}


</script>
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
								<li><a href="/giftcon/adminOut.conn"onClick ="alert('C:data1로 가서 확인하세요!');">- 상품조회정보 생성</a></li>
							</ul></li>
					</ul>
				</div>
				<!-- /.sidebar-collapse -->
			</div>
			<!-- /.navbar-static-side -->
		</nav>
		<div id="page-wrapper" align="center">
			<!-- 메인container-->
			<h1 class="page-header">Q&A</h1>
			<div class="row" align="center">
				<div class="panel panel-default">
					<div class="panel-heading">Q&amp;A 검색, 수정, 삭제 기능하는 페이지입니다.</div>
					<div class="panel-body">
						<div class="dataTable_wrapper">
							<div id="dataTables-example_wrapper"
								class="dataTables_wrapper form-inline dt-bootstrap no-footer">
								<div class="row" style="margin-bottom: 5px;">
						
								</div>
								<div class="row">
									<div class="col-sm-12">
										<table
											class="table table-striped table-bordered table-hover dataTable no-footer"
											id="dataTables-example" role="grid"
											aria-describedby="dataTables-example_info">
											<thead>
												<tr role="row">
													<th style="width: 6%; text-align: center;">글번호</th>
													<th style="width: 11%; text-align: center;">카테고리</th>
													<th style="width: 8%; text-align: center;">아이디</th>
													<th style="width: 35%; text-align: center;">글제목</th>
													<th style="width: 10%; text-align: center;">문의날짜</th>
													<th style="width: 10%; text-align: center;">답변상태</th>
													<th style="width: 10%; text-align: center;">답변날짜</th>
													<th style="width: 10%; text-align: center;">관리</th>
												</tr>
											</thead>

											<form id="commonForm" name="commonForm"></form>
											<tbody>

												<c:forEach var="adQnaList" items="${adQnaList}">

													<tr class="gradeA even" role="row">
														<td style="text-align: center; vertical-align: middle;">${adQnaList.QNA_NUM}</td>
														<td style="text-align: center; vertical-align: middle;">${adQnaList.QNA_CATEGORY}</td>
														<td style="text-align: center; vertical-align: middle;">${adQnaList.MEMBER_ID}</td>
														<td style="text-align: center; vertical-align: middle;">
										<a href=" #" onclick="fn_qnaDetail(${adQnaList.QNA_NUM });">${adQnaList.QNA_TITLE}</a></td>
														<td style="text-align: center; vertical-align: middle;">
															<fmt:formatDate value="${adQnaList.QNA_DATE}"
																pattern="YY.MM.dd HH:mm" />
														</td>
														<td style="text-align: center; vertical-align: middle;">${adQnaList.QNA_CHECK }</td>
														<td style="text-align: center; vertical-align: middle;">
															<fmt:formatDate value="${adQnaList.QNA_REDATE}"
																pattern="YY.MM.dd HH:mm" />
														</td>
														<td style="text-align: center; vertical-align: middle;">

									 <a onclick="fn_qnaDetail(${adQnaList.QNA_NUM})">
																<input type="image"
																src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Cog_font_awesome.svg/32px-Cog_font_awesome.svg.png">
														</a> <a onclick="fn_qnaDelete(${adQnaList.QNA_NUM})"> <input
																type="image"
																src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Trash_font_awesome.svg/32px-Trash_font_awesome.svg.png">
														</a>

														</td>
													</tr>
												</c:forEach>

												<!-- Q&A가 없을때 -->

											</tbody>
										</table>
									</div>
								</div>
								<div class="row">
									<div style="text-align: center;">
										<div id="dataTables-example_filter" class="dataTables_filter">
											<form action="">
												<select class="form-control" name="searchNum" id="searchNum">
													<option value="0">아이디</option>
													<option value="1">제목</option>
												</select> <input class="form-control" type="text"
													name="SearchKeyword" id="SearchKeyword"> <span>
													<button type="submit" class="btn btn-default">검색</button>
												</span>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- /.table-responsive -->
						<div class="paging" align="center">${pagingHtml}</div>
					</div>
				</div>

				<!-- /.panel -->

			</div>

			<!-- // container -->
		</div>
		<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->


</body>
</html>