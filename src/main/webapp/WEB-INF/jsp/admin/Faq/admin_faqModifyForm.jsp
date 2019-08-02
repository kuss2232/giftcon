<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<script type="text/javascript" src="/giftcon/css/jquery/jquery-1.12.4.min.js"></script>
<script>
	function joinValidation(frm) {
		if (frm.FAQ_TITLE.value == "") {
			alert("제목을 입력해 주세요.");
			return false;
		} else if (frm.FAQ_CNT.value == "") {
			alert("내용을 입력해 주세요.");
			return false;
		}
		alert("수정되었습니다.")
	}

	$('.searchOption').val($('.searchOptionVal').val());

	var onList = function() {
		location.href = 'adminFaqList.conn';
	};
</script>
</head>
<!-- 메뉴 시작 -->
<div class="row" style="padding-left: 15px; width: 700px;">
	<h1 class="page-header">FAQ 수정</h1>
</div>

<div class="row" style="padding-left: 15px; width: 700px;">
	<div class="panel panel-default">
		<div class="panel-heading">FAQ 수정 페이지입니다.</div>
		<div class="panel-body">
			<form:form id="faqDetail" action="adminFaqModify.conn"
				method="post" name="joinform" onsubmit="return joinValidation(this)"
				enctype="multipart/form-data">
				<input type="hidden" id="FAQ_NUM" name="FAQ_NUM"
					value="${faqDetail.FAQ_NUM}">
				<div class="form-group">
				<label>카테고리</label>
							<select class="faqCategorty"  id="FAQ_CATEGORY">
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
				
				<button type="submit" class="btn btn-success">수정</button>
				<button type="reset" class="btn btn-success">초기화</button>
				<button type="button" onclick="onList()" id="faqList"
					class="btn btn-success">목록</button>
			</form:form>
		</div>
	</div>
</div>
