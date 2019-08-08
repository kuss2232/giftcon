<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<script src="/giftcon/js/common.js" charset="utf-8"></script>
<script src="/giftcon/css/jquery/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" type="text/css" />
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
									<c:forEach var="eventList"  items="${eventList}" varStatus="stat">
									<tr class="gradeA even" role="row">
										<c:set var="i" value="0"/>
										<td style="text-align: center; vertical-align: middle;">${eventList.EVENT_NUM}</td>
										<c:set var="logo" value="${fn:split(eventList.EVENT_IMG,',')}"/>
										<c:forEach var="logo" items="${logo}">
										<c:if test="${i eq 0}">
										<td><img src="/giftcon/resources/file/Eventfile/${logo}" width="150" height="90" ></td>
										<c:set var="i" value="1"/>
										</c:if>
										</c:forEach>
										<td style="text-align: center; vertical-align: middle;">
										<a href=" #" onclick="goDetail(${eventList.EVENT_NUM});">${eventList.EVENT_TITLE}</a></td>
										<td style="text-align: center; vertical-align: middle;">관리자</td>
										<td style="text-align: center; vertical-align: middle;">
										<fmt:formatDate value="${eventList.EVENT_REGDATE}" pattern="YYYY.MM.dd" /></td>
										<td style="text-align: center; vertical-align: middle;">
										<fmt:formatDate value="${eventList.EVENT_START}" pattern="YY.MM.dd"/>~<fmt:formatDate value="${eventList.EVENT_END}" pattern="YY.MM.dd"/></td>
										<td style="text-align: center; vertical-align: middle;">
										<c:url var="viewURL"  value="/event/adminEventModifyForm.conn">
										<c:param name="EVENT_NUM"
														value="${eventList.EVENT_NUM }" /> 
												</c:url>
						<a href="${viewURL}" > 
						<input type="image"
	src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Cog_font_awesome.svg/32px-Cog_font_awesome.svg.png"
						>
					</a>&nbsp;&nbsp;
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
					<div class="paging">${pagingHtml}</div>
									<div class="row">
						<div style="text-align: center;">
							<div id="dataTables-example_filter" class="dataTables_filter">
						</div>
						<div style="text-align: left;" class="col-sm-6">
														<button id="EventAdd"
									class="btn btn-outline btn-default">이벤트 등록</button>
						</div>
					</div>
				</div>
			</div>
			<!-- /.table-responsive -->
		</div>
	</div>
	<!-- /.panel -->
</div>