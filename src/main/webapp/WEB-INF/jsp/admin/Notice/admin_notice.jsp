<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>


<%
	String curDate = new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>
<script src="/giftcon/js/common.js" charset="utf-8"></script>
<script src="/giftcon/css/jquery/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" type="text/css"  href="/giftcon/css/NotictList.css"/>
		  <script>
		$(document).ready(function(){
			
					$("#noticeAdd").on("click",function(e){
				e.preventDefault();
				onWrite();
			})
			});

		
		function fn_notifyDelete(notice_num){ 
			if(confirm("정말 삭제하시겠습니까 ?") == true){
				var comSubmit = new ComSubmit(); 
				alert("삭제되었습니다");
				comSubmit.setUrl("<c:url value='/notify/adminDeleteNotify.conn' />");
				comSubmit.addParam("NOTICE_NUM", notice_num);
				comSubmit.submit(); 
				
				}
			 else{
				return ;
			 }
			}
		
		function onWrite(){
			location.href="/giftcon/notify/adminNotifyForm.conn";
		}
	
		
  	function locationHref() {
		comSubmit.setUrl("<c:url value='/giftcon/notify/adminNoticeModifyForm.conn' />");
		comSubmit.addParam("NOTICE_NUM", $("#NOTICE_NUM").val());
		comSubmit.submit(); 
		 location.href="/notify/adminNoticeModifyForm.conn"; 
		}  
	
</script>

</head>
<div class="row" style="padding-left: 15px; width: 900px;">
	<h1 class="page-header">공지사항</h1>
</div>
<div class="row">
	<div class="panel panel-default">
		<div class="panel-heading">공지사항 검색, 등록, 수정, 삭제 기능하는 페이지입니다.</div>
		<div class="panel-body">
			<div class="dataTable_wrapper">
				<div id="dataTables-example_wrapper"
					class="dataTables_wrapper form-inline dt-bootstrap no-footer">
					<div class="row" style="margin-bottom: 5px;">
						<div class="col-sm-6">
													</div>
													</br></br>
						<div class="col-sm-6" style="text-align: right;">
							<div class="dataTables_info" id="dataTables-example_info"
								role="status" aria-live="polite">총 게시글 수 : ${totalCount}</div>
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
										<th style="width: 12%; text-align: center;">번호</th>
										<th style="width: 45%; text-align: center;">제목</th>
										<th style="width: 12%; text-align: center;">작성자</th>
										<th style="width: 12%; text-align: center;">등록일자</th>
										<th style="width: 8%; text-align: center;">조회수</th>
										<th style="width: 12%; text-align: center;">관리</th>
									</tr>
								</thead>
								<form id="commonForm" name="commonForm"></form>
								<tbody>
									<c:forEach var="noticeList" items="${noticeList}"
										varStatus="stat">
										<c:url var="viewURL" value="/notify/adminNotifyList.conn">
											<c:param name="NOTICE_NUM"
												value="${noticeList.NOTICE_NUM}" />
										</c:url>
										<tr class="gradeA even" role="row">
											<td style="text-align: center; vertical-align: middle;">${noticeList.NOTICE_NUM}</td>
										<td style="text-align: center; vertical-align: middle;" ><a href="/giftcon/notify/adminNoticeDetail.conn">${noticeList.NOTICE_TITLE}</a></td>
											<td style="text-align: center; vertical-align: middle;">관리자</td>
											<td style="text-align: center; vertical-align: middle;">
												<fmt:formatDate value="${noticeList.NOTICE_REGDATE}"
													pattern="YY.MM.dd" />
											</td>
											<td style="text-align: center; vertical-align: middle;">${noticeList.NOTICE_HITCOUNT}</td>
											<td style="text-align: center; vertical-align: middle;">
											<c:url var="viewURL"
													value="/notify/adminNoticeModifyForm.conn">
													<c:param name="NOTICE_NUM"
														value="${noticeList.NOTICE_NUM }" />
												</c:url>
												<a href="${viewURL}" > <input type="image"
													src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Cog_font_awesome.svg/32px-Cog_font_awesome.svg.png"
													onclick="locationHref();">
											</a>&nbsp;&nbsp; 
												
											<a onclick="fn_notifyDelete(${noticeList.NOTICE_NUM})"> <input type="image"
													src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Trash_font_awesome.svg/32px-Trash_font_awesome.svg.png" >
											</a>
											</td>
										</tr>
									</c:forEach>
									<!--  등록된 글이 없을때 -->
									<c:if test="${fn:length(noticeList) le 0}">
										<tr>
											<td colspan="9" style="text-align: center;">등록된 공지사항이
												없습니다.</td>
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
								<form action="">
									<select class="form-control" name="searchNum" id="searchNum">
										<option value="0">제목</option>
										<option value="1">내용</option>
									</select> <input class="form-control" type="text" name="isSearch"
										id="isSearch" /> <span>
										<button type="submit" class="btn btn-default">검색</button>
									</span>
								</form>
							</div>
							<div style="text-align: left;" class="col-sm-6">
														<button id="noticeAdd"
									class="btn btn-outline btn-default">공지사항 등록</button>
									
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