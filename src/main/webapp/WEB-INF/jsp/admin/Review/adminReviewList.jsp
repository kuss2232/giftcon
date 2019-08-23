<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<script src="/giftcon/css/jquery/jquery-1.12.4.min.js"></script>
<script src="/giftcon/js/common.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			<div class="row" style="padding-left: 15px; width: 900px;">
				<h1 class="page-header">리뷰리스트</h1>
			</div>
			<div class="row">
				<div class="panel panel-default">
					<div class="panel-heading">[리뷰 관리페이지] 리뷰를 검색, 삭제하는 페이지입니다.</div>
					<div class="panel-body">
						<div class="dataTable_wrapper">
							<div id="dataTables-example_wrapper"
								class="dataTables_wrapper form-inline dt-bootstrap no-footer">
								<div class="row" style="margin-bottom: 5px;">
									<div class="col-sm-6">
										<a href="/giftcon/adminReviewList.conn"><button
												type="button" class="btn btn-outline btn-default">전체</button></a>
										<!-- 							<select class="form-control" name="select" onchange="window.open(value,'_self');">
								<option value ="">--카테고리--</option>
								<option value ="/MODA/goods/goodsList?searchNum=2&isSearch=OUTER">OUTER</option>
								<option value ="/MODA/goods/goodsList?searchNum=2&isSearch=TOP">TOP</option>
								<option value ="/MODA/goods/goodsList?searchNum=2&isSearch=PANTS">PANTS</option>
								<option value ="/MODA/goods/goodsList?searchNum=2&isSearch=SHOES">SHOES</option>
								<option value ="/MODA/goods/goodsList?searchNum=2&isSearch=ACC">ACC</option>
							</select>
							<select class="form-control" name="select" onchange="window.open(value,'_self');">
								<option value ="">--상품구분--</option>
								<option value ="/MODA/goods/goodsList?searchNum=3&isSearch=0">판매중</option>
								<option value ="/MODA/goods/goodsList?searchNum=4&isSearch=">품절상품</option>
								<option value ="/MODA/goods/goodsList?searchNum=3&isSearch=1">비활성화</option>
							</select>			
							<select class="form-control" name="select" onchange="window.open(value,'_self');">
								<option value ="">--상품정렬--</option>
								<option value ="/MODA/goods/goodsList?searchNum=5&isSearch=GOODS_AMOUNT">판매수량순</option>
								<option value ="/MODA/goods/goodsList?searchNum=6&isSearch=GOODS_COUNT">조회순</option>
							</select> -->
									</div>
									<div class="col-sm-6" style="text-align: right;">
										<div class="dataTables_info" id="dataTables-example_info"
											role="status" aria-live="polite">총 상품수 : ${count}</div>
									</div>

								</div>
								<form id="frm">
									<div class="row">
										<div class="col-sm-12">
											<table
												class="table  table-bordered table-hover dataTable no-footer"
												id="dataTables-example" role="grid"
												aria-describedby="dataTables-example_info">
												<thead>
													<tr role="row" style="vertical-align: middle;">
														<th
															style="width: 5%; text-align: center; vertical-align: middle;">상품번호</th>
														<th
															style="width: 8%; text-align: center; vertical-align: middle;">상품
															사진</th>
														<th
															style="width: 8%; text-align: center; vertical-align: middle;">상품명</th>
														<th
															style="width: 8%; text-align: center; vertical-align: middle;">가격</th>
														<th
															style="width: 35%; text-align: center; vertical-align: middle;">리뷰</th>
														<th
															style="width: 8%; text-align: center; vertical-align: middle;">리뷰
															사진</th>
														<th
															style="width: 3%; text-align: center; vertical-align: middle;">평점</th>
														<th
															style="width: 8%; text-align: center; vertical-align: middle;">작성자</th>
														<th
															style="width: 10%; text-align: center; vertical-align: middle;">등록일</th>
														<th
															style="width: 13%; text-align: center; vertical-align: middle;">관리</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="reviewList" items="${reviewList}"
														varStatus="stat">
														<tr class="gradeA even" role="row">
															<td style="text-align: center; vertical-align: middle;">${reviewList.GOODS_NUM}</td>
															<td style="text-align: center; vertical-align: middle;"><img
																src="${reviewList.GOODS_IMG1}" width="60" height="60"
																alt="" onerror="this.src='/giftcon/images/XBox.png'" /></td>
															<td style="text-align: center; vertical-align: middle;">${reviewList.GOODS_NAME}</td>

															<c:if test="${reviewList.GOODS_DCPRICE != null}">
																<td style="text-align: center; vertical-align: middle;">
																	<del>
																		<fmt:formatNumber value="${reviewList.GOODS_PRICE}"
																			type="number" />
																		원<br />
																	</del> <fmt:formatNumber value="${reviewList.GOODS_DCPRICE}"
																		type="number" />원
																</td>
															</c:if>
															<c:if test="${reviewList.GOODS_DCPRICE == null}">
																<td style="text-align: center; vertical-align: middle;">
																	<fmt:formatNumber value="${reviewList.GOODS_PRICE}"
																		type="number" />원
																</td>
															</c:if>
															<td style="text-align: center; vertical-align: middle;">${reviewList.REVIEW_CNT}</td>
															<td style="text-align: center; vertical-align: middle;"><img
																src="/MODA/file/goodsFile/${reviewList.REVIEW_IMG}"
																width="60" height="60" alt=""
																onerror="this.src='/giftcon/images/XBox.png'" /></td>
															<td style="text-align: center; vertical-align: middle;">${reviewList.REVIEW_GRADE}</td>
															<td style="text-align: center; vertical-align: middle;">${reviewList.MEMBER_ID}</td>
															<td style="text-align: center; vertical-align: middle;"><fmt:formatDate
																	value="${reviewList.REVIEW_REGDATE}" pattern="YY.MM.dd" /></td>
															<td style="text-align: center; vertical-align: middle;">
																<!-- <a href="#" ><input type="image" src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Cog_font_awesome.svg/32px-Cog_font_awesome.svg.png"></a>&nbsp;&nbsp; -->
																<a href="#"
																onclick="reDelete('${reviewList.REVIEW_NUM}')"><input
																	type="image"
																	src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Trash_font_awesome.svg/32px-Trash_font_awesome.svg.png"
																	onclick="return delchk()"></a>
															</td>
														</tr>
													</c:forEach>

													<!--  등록된 상품이 없을때 -->
													<c:if test="${fn:length(reviewList) le 0}">
														<!-- reviewList가 0보다 작거나 같으면 -->
														<tr>
															<td colspan="11" style="text-align: center;">등록된 상품이
																없습니다</td>
														</tr>
													</c:if>
												</tbody>
											</table>
										</div>
									</div>
								</form>
								<div class="paging" align="center">${pagingHtml}</div>
								<div class="row">
									<div style="text-align: center;">
										<div id="dataTables-example_filter" class="dataTables_filter">
											<form action="/giftcon/adminReviewList.conn">
												<select class="form-control" name="searchNum" id="searchNum">
													<option value="0">상품명</option>
													<option value="1">ID</option>
												</select> <input class="form-control" type="text"
													name="SearchKeyword" id="SearchKeyword" /> <span>
													<button type="submit" class="btn btn-default">검색</button>
												</span>
											</form>
										</div>
									</div>

								</div>
							</div>
						</div>
						<!-- /.table-responsive -->
					</div>
				</div>
				<!-- /.panel -->
			</div>
			<script type="text/javascript">
function reDelete(reNum){
	if(confirm("삭제하시겠습니까?") == true){
		var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("/giftcon/adminReviewDelete.conn");
			comSubmit.addParam("REVIEW_NUM", reNum);
			comSubmit.submit();
	}
}

</script>

			<!-- // container -->
		</div>
		<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->


</body>
</html>