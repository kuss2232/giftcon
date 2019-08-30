<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>관리자 페이지</title>

<script src="/giftcon/css/jquery/jquery-1.12.4.min.js"></script>
<script src="/giftcon/js/common.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
<script>
		
	function fn_login(num){
		var comSubmit = new ComSubmit("brandForm");
			comSubmit.setUrl("/giftcon/adminCategory1.conn");
			comSubmit.addParam("BIG_CATEGORY",num);
			comSubmit.submit();
		}
	function fn_delete(category){
		if(confirm("삭제하시겠습니가?") == true){
			var comSubmit = new ComSubmit("category");
			comSubmit.setUrl("/giftcon/adminCategoryDelete.conn");
			alert("삭제되었습니다.");
			comSubmit.addParam("SMALL_CATEGORY",category);
			comSubmit.submit();	
		}
		else {
			alert("취소되었습니다.");
		}
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
							</ul></li>
					</ul>
				</div>
				<!-- /.sidebar-collapse -->
			</div>
			<!-- /.navbar-static-side -->
		</nav>
		<div id="page-wrapper">
		<h1 class="page-header">카테고리 관리</h1>
			<!-- 메인container-->
			<form id="brandForm" name="brandForm" action="/bigCategoryList.conn">
				<div class="subWrap">
					<div class="subLayout">
						<!-- start:sub_title -->
						<div class="subTit">브랜드 카테고리</div>
						<!-- /end:sub_title -->
						<!-- start:product_search -->
						<div class="searchCate2 mt6">

							<a href="javascript:fn_login('전체')"><font size="3px">전체</font></a>&nbsp;&nbsp;&nbsp;/

							<a href="javascript:fn_login('치킨/피자/버거')"><font size="3px">치킨/피자/버거</font></a>&nbsp;&nbsp;&nbsp;/

							<a href="javascript:fn_login('아이스크림/빙수')"> <font size="3px">아이스크림/빙수</font></a>&nbsp;&nbsp;&nbsp;/

							<a href="javascript:fn_login('베이커리/도넛')"><font size="3px">베이커리/도넛</font></a>&nbsp;&nbsp;&nbsp;/

							<a href="javascript:fn_login('편의점/마트')"> <font size="3px">편의점/마트</font></a>&nbsp;&nbsp;&nbsp;/

							<a href="javascript:fn_login('커피/음료')"><font size="3px">커피/음료</font></a>&nbsp;&nbsp;&nbsp;

						</div>
						<!-- /end:product_search -->
						<div class="subTit1 mt44">
							<span class="resultTxt"><em>상품: ${totalCount}</em></span>
						</div>
						<!-- start:search_product -->
						<div class="brandLogo">
							<ul class="brandList" id="brandListAppend">

							</ul>

						</div>
						<!-- /end:search_product -->
					</div>
				</div>
			</form>

			<br>

			<div class="box box-primary" align="center">
				<div class="box-header with-border">
					<h2 class="box-title" align="center">목록</h2>
					<div align="right">
						<a href="/giftcon/admincategoryInsertForm.conn"><input
							type="image" src="/giftcon/resources/images/answer.png"><br/>추가</a>
					</div>


				</div>
				<br />
				<br />
				<form id="category" name="category">
					<div class="content">
						<table id="category_table"
							class="table table-striped table-bordered" style="width: 100%">
							<thead>
								<tr>
									<th style="width: 10%; text-align: center;">번호</th>
									<th style="width: 12%; text-align: center;">카테고리</th>
									<th style="width: 20%; text-align: center;">브랜드 로고</th>
									<th style="width: 12%; text-align: center;">브랜드 명</th>
									<th style="width: 12%; text-align: center;">관리</th>
								</tr>
							</thead>
							<tbody>


								<%-- <c:forEach var="faqList"  items="${faqList}" varStatus="stat"> --%>
								<c:forEach items="${list}" var="list">



									<tr class="gradeA even" role="row">
										<td style="text-align: center; vertical-align: middle;">${list.CATEGORY_NUM}</td>
										<td style="text-align: center; vertical-align: middle;">${list.BIG_CATEGORY}</td>
										<td align="center"><img width="80" height="80"
											src="/giftcon/images/category/${list.CATEGORY_IMG}"></td>
										<td style="text-align: center; vertical-align: middle;">${list.SMALL_CATEGORY}</td>
										<td style="text-align: center; vertical-align: middle;">
											<a href=""><input type="image"
												onclick="fn_delete('${list.SMALL_CATEGORY}')"
												src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Trash_font_awesome.svg/32px-Trash_font_awesome.svg.png"></a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</form>
			</div>
			<div class="row">
				<div style="text-align: center;">
					<div id="dataTables-example_filter" class="dataTables_filter">
						<form action="">
							<select  name="searchNum" id="searchNum">
								<option value="0">브랜드 명</option>
								<option value="1">카테고리</option>
								
							</select> <input  type="text" name="SearchKeyword"
								id="SearchKeyword" /> <span>
								<button type="submit" >검색</button>
							</span>
							<div class="paging" align="center">${pagingHtml}</div>
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