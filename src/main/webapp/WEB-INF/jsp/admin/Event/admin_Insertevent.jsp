<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:useBean id="now" class="java.util.Date"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
</body>
</html>