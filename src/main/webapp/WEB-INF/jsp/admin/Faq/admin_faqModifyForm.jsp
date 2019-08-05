<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>
<script type="text/javascript" src="/giftcon/css/jquery/jquery-1.12.4.min.js"></script>
</head>
<script src="/giftcon/js/common.js" charset="utf-8"></script>
<!-- 메뉴 시작 -->
<div class="row" style="padding-left: 15px; width: 700px;">
	<h1 class="page-header">FAQ 수정</h1>
</div>

<div class="row" style="padding-left: 15px; width: 700px;">
	<div class="panel panel-default">
		<div class="panel-heading">FAQ 수정 페이지입니다.</div>
		<div class="panel-body">
			<form id="frm" name="frm"  method="POST">
				<input type="hidden" id="FAQ_NUM" name="FAQ_NUM"
					value="${faqDetail.FAQ_NUM}">
				<div class="form-group">
				<label>카테고리</label>
							<select class="faqCategorty"  id="FAQ_CATEGORY"  name="FAQ_CATEGORY">
								<option value="회원">회원</option>
								<option value="상품">상품</option>
								<option value="주문">주문</option>
								<option value="환불">환불</option>
								<option value="기타">기타</option>
							</select>
							<br/>
							<br/>
					<label>제목</label> <input type="text" class="form-control"
						id="FAQ_TITLE" name="FAQ_TITLE"
						value="${faqDetail.FAQ_TITLE}" style="width: 500px;" />
				</div>
				</br>
				<div class="form-group">
					<label>내용</label> <textarea rows="20"  class="form-control"
						id="FAQ_CNT" name="FAQ_CNT"
						style="width: 500px;">${faqDetail.FAQ_CNT}</textarea><br />
					 <br />
								</div>
				
				<input type="button" name="수정하기"  value="수정" id="ModifyFaq"class="btn btn-success" />
				<button type="reset" class="btn btn-success">초기화</button>
				<button type="button" onclick="onList()" id="faqList"
					class="btn btn-success">목록</button>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
		$(document).ready(function() {
			$("#ModifyFaq").on("click", function(e) { //작성하기 버튼
				e.preventDefault();
				fn_modifyCheck();
				});
			});
		
		function fn_modifyCheck() {
			if (document.frm.FAQ_TITLE.value == "") {
				alert("제목을 입력해 주세요.");
				return false;
			} else if (document.frm.FAQ_CNT.value == "") {
				alert("내용을 입력해 주세요.");
				return false;
			}
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/faq/adminFaqModify.conn' />");
		comSubmit.addParam("FAQ_CATEGORY", $("#FAQ_CATEGORY").val());
		comSubmit.submit();
		alert("수정되었습니다.")
		}
		

		$('.searchOption').val($('.searchOptionVal').val());

		var onList = function() {
			location.href = 'adminFaqList.conn';
		};
</script>

		

