<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include-header.jspf" %>
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




<script type="text/javascript">
$(document).ready(function() {
	$("#deleteBtn").on("click", function(e) {
		e.preventDefault();
		fn_delete();
	});

});
function fn_delete()
{
	var ORDER_NUM = $("#ORDER_NUM").val();
	var GOODS_NUM = $("#GOODS_NUM").val();
	$.ajax({
		type : 'POST',
		url : '/giftcon/orderDelete.conn',
		data : {"ORDER_NUM":ORDER_NUM,
				"GOODS_NUM":GOODS_NUM},
		
		success : function(result) {
				alert("삭제되었습니다.");
				location.href="/giftcon/adminOrderDetail.conn?ORDER_NUM="+ORDER_NUM;
		},
		error:function(request, error) {
			alert("서버오류");
			// error 발생 이유를 알려준다.
			/* alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); */
		}
	})
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
			<div class="row" style="padding-left:15px;width:900px;">    
	<h1 class="page-header">주문상세</h1>
</div>
<div class="row">
	<div class="panel panel-default">
		<div class="panel-heading">
			주문 상세 페이지입니다.
        </div>
        <div class="panel-body">
			<div class="dataTable_wrapper">
				<div id="dataTables-example_wrapper"
					class="dataTables_wrapper form-inline dt-bootstrap no-footer">
					<div class="row" style="margin-bottom:5px;">
						<div class="col-sm-6" style="text-align:right;">
							<div class="dataTables_info" id="dataTables-example_info" role="status" aria-live="polite">총 주문 상품수 : ${OrderCount}</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<table
								class="table  table-bordered table-hover dataTable no-footer"
								id="dataTables-example" role="grid"
								aria-describedby="dataTables-example_info">
								<thead>
									<tr role="row" style="vertical-align:middle;">
										<th style="width: 7%; text-align:center;vertical-align:middle;">주문번호</th>
										<th style="width: 10%; text-align:center;vertical-align:middle;">상품 이미지</th>						
										<th style="width: 10%; text-align:center;vertical-align:middle;">상품이름</th>
										<th style="width: 15%; text-align:center;vertical-align:middle;">간략설명</th>
										<th style="width: 8%; text-align:center;vertical-align:middle;">회원ID</th>
										<th style="width: 5%; text-align:center;vertical-align:middle;">수량</th>
										<th style="width: 8%; text-align:center;vertical-align:middle;">금액</th>
										<th style="width: 8%; text-align:center;vertical-align:middle;">합계</th>
										<th style="width: 8%; text-align:center;vertical-align:middle;">주문상태</th>
										<th style="width: 8%; text-align:center;vertical-align:middle;">주문일자</th>								
										<th style="width: 13%; text-align:center;vertical-align:middle;">관리</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="orderList"  items="${orderList}" varStatus="stat">		
									<tr class="gradeA even" role="row" height="30px">
										<td style="text-align:center;vertical-align:middle;">${orderList.ORDER_NUM}</td>	<!-- 주문번호 -->							
										<td style="text-align:center;vertical-align:middle;"><img src="/giftcon/resources/file/goodsFile/${orderList.GOODS_IMG }"></td>	<!-- 상품이미지 -->
										<td style="text-align:center;vertical-align:middle;">${orderList.GOODS_NAME}</td>	<!-- 상품이름 -->
										<td style="text-align:center;vertical-align:middle;">${orderList.GOODS_SIMPLE}</td>	<!-- 상품간략설명 -->
										<td style="text-align:center;vertical-align:middle;">${orderList.MEMBER_ID}</td>	<!-- 회원ID -->
										<td style="text-align:center;vertical-align:middle;">${orderList.ORDER_AMOUNT}</td>	<!-- 상품구매수량 -->
										<td style="text-align:center;vertical-align:middle;">${orderList.GOODS_PRICE}원<%-- <fmt:formatNumber value="${orderList.order_sum_money}" type="number"/> --%></td>	<!-- 상품1개당금액 -->
										<td style="text-align:center;vertical-align:middle;">${orderList.GOODS_PRICE * orderList.ORDER_AMOUNT}원</td>
										<c:set var="SUM" value="${SUM + (orderList.GOODS_PRICE * orderList.ORDER_AMOUNT)}" />
										<td style="text-align:center;vertical-align:middle;"><c:if test="${orderList.ORDER_PAYMENT eq 'N'}">입금 대기</c:if><c:if test="${orderList.ORDER_PAYMENT eq 'Y'}">결제 완료</c:if></td>		<!-- 주문상태 -->
										<td style="text-align:center;vertical-align:middle;">${orderList.ORDER_DATE}<%-- <fmt:formatDate value="${orderList.order_date}" pattern="YY.MM.dd HH:mm" /> --%></td><!-- 주문일자 -->									
										<td style="text-align:center;vertical-align:middle;">	<!-- 관리 -->
											<input type="hidden" id="ORDER_NUM" value="${orderList.ORDER_NUM}"/>
											<input type="hidden" id="GOODS_NUM" value="${orderList.GOODS_NUM}"/>
										<a href="#"><input type="image" id="deleteBtn" src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Trash_font_awesome.svg/32px-Trash_font_awesome.svg.png"></a></td>									
									</tr>
								</c:forEach>
									<tr>
										<td colspan="11" style="text-align:right; vertical-align:middle;"><h2>총 합계금액 : ${SUM}원</h2></td>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- /.table-responsive -->							
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