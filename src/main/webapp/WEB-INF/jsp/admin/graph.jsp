<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
.selectBody {
    padding-left: 6px;
    width: 160px;
    height: 28px;
    border: 1px solid #ccc;
    vertical-align: top;
}
</style>
<script src="/giftcon/css/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script type="text/javascript">
$(document).ready(function(){
$("#btn").on("click",function() {
	google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawChart);
	
    var startDate = $("#startDate").val();
    var endDate = $("#endDate").val();
    var category = $("#category").val();
    var ages = $("#ages").val();

    function drawChart() {
    	var jsonData = $.ajax({
    	url: "/giftcon/graphing.conn",
    		dataType:"json",
    		data:{"startDate":startDate,
    				"endDate":endDate,
    				"category":category,
    				"ages": ages},
    		async:false,
    		success:function(data){
    			alert("성공");
    		}
    	}).responseText;
//	alert(jsonData);	
	var data = new google.visualization.DataTable(jsonData);
   	
	var options = {
		title: '클릭수(상대값)',
		hAxis: {title: 'Month',  titleTextStyle: {color: '#333'}},
		vAxis: {minValue: 0}
	};

	var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
	chart.draw(data, options);

    }
	});
});
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
								<li><a href="/giftcon/adminReviewList.conn">- 리뷰관리</a></li>
								<li><a href="/giftcon/adminOut.conn"onClick ="alert('C:data1로 가서 확인하세요!');">- 상품조회정보 생성</a></li>
								<li><a href="/giftcon/graph.conn">- 그래프</a></li>
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
			<div id="page-wrapper">
		<!-- 메인container-->
		<h1 class="page-header">EVENT</h1>
		<div class="row" style="padding-left: 15px; width: 700px;">
			<div class="panel panel-default">
				<div class="panel-heading">연령별 남녀 검색량 비교</div>
				<div class="panel-body">
					<form id="frm" enctype="multipart/form-data"
						onsubmit="return joinValidation(this)">
						<table class="event_view">
							<colgroup>
								<col width="15%">
								<col width="*" />
							</colgroup>
							<caption>분야 통계</caption>
							<tbody>
							<br/><br/>
								<tr>
									<th >연령</th>
									<td style="width:250px;">
										<select class="selectBody" id="ages" name="ages">
											<option value>선택</option>
											<option value="10">10대</option>
											<option value="20">20대</option>
											<option value="30">30대</option>
											<option value="40">40대</option>
											<option value="50">50대</option>
											<option value="60">60대</option>
										</select>
									</td>
									<th style="width: 40px;">분야</th>
									<td>
										<select class="selectBody" id="category">
											<option value>선택</option>
											<option value="50001865">아이스크림</option>
											<option value="50000149">과자</option>
											<option value="50000148">음료</option>
											<option value="50000160">농산물</option>
											<option value="50000026">간편조리식품</option>
											<option value="50000150">가공식품</option>
										</select>
									</td>
								</tr>
								<th style="width: 20px;">기간</th>
								<td style="width: *;"><input type="date" id="startDate"
									 class="wdp_90" /> 부터 <input type="date"
									id="endDate" class="wdp_90" />까지</td>
								
							</tbody>
						</table>
						<br />
						<button id="btn" type="button">실행</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div id="chart_div" style="width: 100%; height: 500px;"></div>
			
			<!-- // container -->
		</div>
		<!-- /#page-wrapper -->
	</div>
	
	
	
	
	
</body>
</html>