<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
								<th scope="row" >제목</th>
								<td>
									<input type="text" id="EVENT_TITLE" name="EVENT_TITLE" class="wdp_90" />
								</td>
							</tr>
							<tr>
								<th scope="row" >메인 이미지</td> 
								<td colspan="2" class="view_Image">
									<input type="file" id="imgInput" title="메인이미지"  />
									<img id="image_section" src="#"  alt="your image"/>	
								</td>
							</tr>
							<!-- <tr>
								<th scope="row">첨부<br/>파일</th>
								<td><input type="file" id="NOTICE_IMG" name="NOTICE_IMG" style="width: initial;" /></td>
							</tr> -->
						</tbody>
					</table>
					<br/>
					<!-- <input type="file" id="NOTIFY_IMAGE" name="NOTIFY_IMAGE" style="width: initial;" /> <br/> -->
					<input type="submit" name="업로드" value="작성하기" id="insertEvent" class="btn btn-primary"/>
					<button type="button" onclick="onList()" id="noticeList" class="btn btn-primary">목록</button>
				</form>
				</div>
			</div>
		</div>
		<script type="text/javascript">
		function readURL(input) {
			 if (input.files && input.files[0]) {
			  var reader = new FileReader();
			  
			  reader.onload = function (e) {
			   $('#image_section').attr('src', e.target.result);  
			  }
			  
			  reader.readAsDataURL(input.files[0]);
			  }
			}
			
			$("#imgInput").change(function(){
				readURL(this);
			});
		
			$(document).ready(function() {
				$("#EventList").on("click", function(e) { //목록으로 버튼
					e.preventDefault();
					fn_noticeList();
				});

				$("#insertEvent").on("click", function(e) { //작성하기 버튼
					e.preventDefault();
					fn_EventInsert();
					});
				});

				function fn_EventList() {
					var comSubmit = new ComSubmit();
					comSubmit.setUrl("<c:url value='/event/adminNotifyList.conn' />");
					comSubmit.submit();
				}

				function fn_notifyWrite() {
					var comSubmit = new ComSubmit("frm");
					comSubmit.setUrl("<c:url value='/notify/adminInsertNotify.conn' />");
					//comSubmit.addO
					comSubmit.submit();
				}

				$('.searchOption').val($('.searchOptionVal').val());
				
				var onList = function() {
					location.href = 'adminNotifyList.conn';
				};
		</script>
</body>
</html>