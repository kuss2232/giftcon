<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<!-- Custom CSS -->
<link href="/giftcon/css/jquery/sb-admin-2.css" rel="stylesheet">
<!-- jQuery -->

<script src="/giftcon/css/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="/giftcon/css/jquery/bootstrap.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="/giftcon/css/jquery/sb-admin-2.js"></script>
<script src="/giftcon/css/jquery/jquery-1.12.4.min.js"></script>
<script src="/giftcon/js/common.js" charset="utf-8"></script>

<link rel="stylesheet" type="text/css" />
<style type="text/css">
 {
    margin:0; padding:0
}


ul li{
         list-style-type: none;
}

a{text-decoration:none}

.tab-box{

         margin: 50px auto 0 auto;

         width:1100px;
         
         position:relative;
         right: 50px;

}

.tab-box ul{

         height:30px;

}


.tab-box li{

         float:left;

         width:100px;

         height:30px;      

         line-height:30px;          /* 중앙정렬 */

         margin-right: 2px;

         text-align: center;

         background-color: #ccc;

         border-radius:3px 3px 0 0;

cursor: pointer;

}
</style>
<script type="text/javascript">
$(document).ready(function(){

		$("#EventAdd").on("click",function(e){
			e.preventDefault();
			onWrite();
		})
});

function fn_eventDelete(event_num){ 
	if(confirm("정말 삭제하시겠습니까 ?") == true){
			var comSubmit = new ComSubmit("submit"); 
			alert("삭제되었습니다");
		comSubmit.setUrl("/giftcon/event/adminDeleteEvent.conn");
		comSubmit.addParam("EVENT_NUM", event_num);
		comSubmit.submit(); 
	}
}

function onWrite(){
	location.href="/giftcon/event/adminEventForm.conn";
}
	
function goDetail(event_num) {
	var comSubmit = new ComSubmit("submit"); 
comSubmit.setUrl("<c:url value='/event/adminEventDetail.conn' />");
comSubmit.addParam("EVENT_NUM", event_num);
comSubmit.submit(); 
}  
	
$(document).ready(function(){
        
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
								<li><a href="/giftcon/adminReviewList.conn">- 리뷰관리</a>
								<li><a href="/giftcon/adminOut.conn"onClick ="alert('C:data1로 가서 확인하세요!');">- 상품조회정보 생성</a></li>
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
			<div class="row" align="center" style="padding-left: 15px; width: 900px;">
	<h1 class="page-header">EVENT</h1>
</div>
<div class="row" align="center" >
	<div class="panel panel-default">
		<div class="panel-heading">EVENT 등록, 수정, 삭제 기능하는 페이지입니다.</div>
		<div class="panel-body">
			<div class="dataTable_wrapper">
				<div id="dataTables-example_wrapper"
					class="dataTables_wrapper form-inline dt-bootstrap no-footer">
					<div class="row" style="margin-bottom: 5px;">
						</br></br>
						<div class="col-sm-6" style="text-align: right;">
							
						</div>
					</div>
					
	
		 <div class="tab-box" >
 	<ul class="tabs"  style="list-style-type:square;">
		<li><a href="/giftcon/event/adminEventList.conn" class="on">진행중 이벤트</a></li>
		<li><a href="/giftcon/event/adminEndEventList.conn" class="on">종료된 이벤트</a></li>
		<li class="on" style="margin-left:738px;">총 게시물수 : ${totalCount}</li>
		
	</ul>
			<c:url var="viewURL"  value="/event/adminEventForm.conn">
			</c:url>
			<div style="margin-left:1000px;">
	        <a href="${viewURL}"><input type="image" src="/giftcon/resources/images/answer.png" ><br/>이벤트등록</a>
	        </div>
					<div class="col-sm-12">
							<table
								class="table table-striped table-bordered table-hover dataTable no-footer"
								id="dataTables-example" role="grid"
								aria-describedby="dataTables-example_info">
								<thead>
									<tr role="row">
										<th style="width: 10%; text-align: center;">번호</th>
										<th style="width: 5%;   text-align: center;">이미지</th>
										<th style="width: 10%; text-align: center;">제목</th>
										<th style="width: 10%; text-align: center;">작성자</th>
										<th style="width: 10%; text-align: center;">등록일자</th>
										<th style="width: 10%; text-align: center;">이벤트 기간</th>
										<th style="width: 10%; text-align: center;">관리</th>
									</tr>
								</thead>
								<form id="submit">
								</form>
								<tbody>
									<c:forEach var="eventList"  items="${eventList}" varStatus="stat">
									<tr class="gradeA even" role="row">
										<c:set var="i" value="0"/>
										<td style="text-align: center; vertical-align: middle;">${eventList.EVENT_NUM}</td>
										<c:set var="logo" value="${fn:split(eventList.EVENT_IMG,',')}"/>
										<c:forEach var="logo" items="${logo}">
										<c:if test="${i eq 0}">
										<td><img src="/giftcon/resources/file/event/${logo}" width="150" height="90" ></td>
										<c:set var="i" value="1"/>
										</c:if>
										</c:forEach>
										<td style="text-align: center; vertical-align: middle;">
										<a href="#" onclick="goDetail(${eventList.EVENT_NUM});">${eventList.EVENT_TITLE}</a></td>
										<td style="text-align: center; vertical-align: middle;">관리자</td>
										<td style="text-align: center; vertical-align: middle;">
										<fmt:formatDate value="${eventList.EVENT_REGDATE}" pattern="YYYY.MM.dd" /></td>
										<td style="text-align: center; vertical-align: middle;">
										<fmt:formatDate value="${eventList.EVENT_START}" pattern="YY.MM.dd"/>~<fmt:formatDate value="${eventList.EVENT_END}" pattern="YY.MM.dd"/></td>
										<td style="text-align: center; vertical-align: middle;">
										<c:url var="viewURL"  value="/event/adminEventForm.conn">
										<c:param name="EVENT_NUM"
														value="${eventList.EVENT_NUM }" /> 
												</c:url>
					<a onclick="fn_eventDelete(${eventList.EVENT_NUM})">  
				<input type="image"
					src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Trash_font_awesome.svg/32px-Trash_font_awesome.svg.png" >
					</a>
						</td>
									</tr>
										</c:forEach>
									<!--  등록된 상품이 없을때 -->
									<c:if test="${fn:length(eventList) le 0}">
										<tr>
											<td colspan="9" style="text-align: center;">등록된 이벤트가
												없습니다</td>
										</tr>
									</c:if>
								</tbody>
								
							</table>
						</div>
					</div>
				</div>
	  			
									<div class="row">
						<div style="text-align: center;">
							<div id="dataTables-example_filter" class="dataTables_filter">
						</div>
					</div>
				</div>
			</div>
			<!-- /.table-responsive -->
		</div>
	</div>
	<!-- /.panel -->
</div>
<div class="paging" align="center">${pagingHtml}</div>
			
			<!-- // container -->
		</div>
		<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->
</body>
</html>