<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 등록하기</title>
</head>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/ui.css'/>" />
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
<div class="row" style="padding-left: 15px; width: 700px;">
	<h1 class="page-header">FAQ</h1>
</div>
<body>
	<div class="row" style="padding-left: 15px; width: 700px;">
		<div class="panel panel-default">
			<div class="panel-heading">FAQ 등록 페이지입니다.</div>
			<div class="panel-body">
				<form id="frm" >
					<table class="faq_view">
						<colgroup>
							<col width="15%">
							<col width="*" />
						</colgroup>	
						<caption>게시글 작성</caption>
										<br><br>
						<tbody>
							<tr>
								<th scope="row" >제목</th>
								<td>
									<input type="text" id="FAQ_TITLE" name="FAQ_TITLE" class="wdp_90" />
								</td>
							</tr>
							<div class="inputArea">
							<label>카테고리</label>
							<select class="faqCategorty"  id="FAQ_CATEGORY">
								<option value="회원">회원</option>
								<option value="상품">상품</option>
								<option value="주문">주문</option>
								<option value="환불">환불</option>
								<option value="기타">기타</option>
							</select>
							</div>
							<tr>
								<th scope="row" >내용</td>
								<td colspan="2" class="view_text">
									<textarea rows="20" cols="80" title="내용" id="FAQ_CNT" name="FAQ_CNT"></textarea>
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
					<input type="button" name="업로드" value="작성하기" id="insertFaq" class="btn btn-primary"/>
					<button type="button" onclick="onList()" id="faqList" class="btn btn-primary">목록</button>
				</form>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			$(document).ready(function() {
				$("#faqList").on("click", function(e) { //목록으로 버튼
					e.preventDefault();
					fn_faqList();
				});

				$("#insertFaq").on("click", function(e) { //작성하기 버튼
					e.preventDefault();
					fn_faqWrite();
					});
				});

				function fn_faqList() {
					var comSubmit = new ComSubmit();
					comSubmit.setUrl("<c:url value='/faq/adminFaqList.conn' />");
					comSubmit.submit();
				}

				function fn_faqWrite() {
					var comSubmit = new ComSubmit("frm");
					comSubmit.setUrl("<c:url value='/faq/adminWriteFaq.conn' />");
					comSubmit.addParam("FAQ_CATEGORY", $("#FAQ_CATEGORY").val());
					comSubmit.submit();
				}

				$('.searchOption').val($('.searchOptionVal').val());
				
				var onList = function() {
					location.href = 'adminFaqList.conn';
				};
		</script>
</body>
</html>