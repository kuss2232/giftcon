<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<script src="/giftcon/js/common.js" charset="utf-8"></script>
<script src="/giftcon/css/jquery/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" type="text/css" />
<style type="text/css">
 {
    margin:0; padding:0
}
body {
    font-family: '맑은 고딕' 돋움; font-size:0.75em; color:#333
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
								var comSubmit = new ComSubmit(); 
								alert("삭제되었습니다");
							comSubmit.setUrl("<c:url value='/event/adminDeleteEvent.conn' />");
							comSubmit.addParam("EVENT_NUM", event_num);
							comSubmit.submit(); 
					}
						else{
							return ;}}

				function onWrite(){
					location.href="/giftcon/event/adminEventForm.conn";
					}
				
				function goDetail(event_num) {
					var comSubmit = new ComSubmit(); 
				comSubmit.setUrl("<c:url value='/event/adminEventDetail.conn' />");
				comSubmit.addParam("EVENT_NUM", event_num);
				comSubmit.submit(); 
				
				}  
				
				$(document).ready(function(){
				        
				    });
</script>

</head>

<div class="row" style="padding-left: 15px; width: 900px;">
	<h1 class="page-header">EVENT</h1>
</div>
<div class="row">
	<div class="panel panel-default">
		<div class="panel-heading">EVENT 등록, 수정, 삭제 기능하는 페이지입니다.</div>
		<div class="panel-body">
			<div class="dataTable_wrapper">
				<div id="dataTables-example_wrapper"
					class="dataTables_wrapper form-inline dt-bootstrap no-footer">
					<div class="row" style="margin-bottom: 5px;">
						</br></br>
						<div class="col-sm-6" style="text-align: right;">
							<div class="dataTables_info" id="dataTables-example_info"
								role="status" aria-live="polite">총 게시물수 : ${totalCount}</div>
						</div>
					</div>
			 <div class="tab-box">
 	<ul class="tabs" >
		<li><a href="/giftcon/event/adminEventList.conn" class="on">	진행중 이벤트</a></li>
		<li><a href="/giftcon/event/adminEndEventList.conn" class="on">종료된 이벤트</a></li>
	</ul>		
		 <div class="row">
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
								<form id="commonForm" name="commonForm"></form>
								<tbody>
									<c:forEach var="endEventList"  items="${endEventList}" varStatus="stat">
									<tr class="gradeA even" role="row">
										<c:set var="i" value="0"/>
										<td style="text-align: center; vertical-align: middle;">${endEventList.EVENT_NUM}</td>
										<c:set var="logo" value="${fn:split(endEventList.EVENT_IMG,',')}"/>
										<c:forEach var="logo" items="${logo}">
										<c:if test="${i eq 0}">
										<td><img src="/giftcon/resources/file/Eventfile/${logo}" width="150" height="90" ></td>
										<c:set var="i" value="1"/>
										</c:if>
										</c:forEach>
										<td style="text-align: center; vertical-align: middle;">
										<a href=" #" onclick="goDetail(${endEventList.EVENT_NUM});">${endEventList.EVENT_TITLE}</a></td>
										<td style="text-align: center; vertical-align: middle;">관리자</td>
										<td style="text-align: center; vertical-align: middle;">
										<fmt:formatDate value="${endEventList.EVENT_REGDATE}" pattern="YYYY.MM.dd" /></td>
										<td style="text-align: center; vertical-align: middle;">
										<fmt:formatDate value="${endEventList.EVENT_START}" pattern="YY.MM.dd"/>~<fmt:formatDate value="${endEventList.EVENT_END}" pattern="YY.MM.dd"/></td>
										<td style="text-align: center; vertical-align: middle;">
													<c:url var="viewURL"  value="/event/adminEventForm.conn">
										<c:param name="EVENT_NUM"
														value="${eventList.EVENT_NUM }" /> 
												</c:url>
						<a href="${viewURL}">
				<input type="image" src="/giftcon/resources/images/answer.png" >
					</a>&nbsp;&nbsp;
					<a onclick="fn_eventDelete(${endEventList.EVENT_NUM})">  
				<input type="image"
					src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Trash_font_awesome.svg/32px-Trash_font_awesome.svg.png" >
					</a>
						</td>
									</tr>
										</c:forEach>
									<!--  등록된 상품이 없을때 -->
									<c:if test="${fn:length(endEventList) le 0}">
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

				
				
				
   			<div class="paging" align="center">${pagingHtml}</div>
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