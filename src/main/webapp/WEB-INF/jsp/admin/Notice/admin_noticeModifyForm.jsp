<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<script type="text/javascript" src="/giftcon/css/jquery/jquery-1.12.4.min.js"></script>
<script>
	function joinValidation(frm) {
		if (frm.NOTICE_TITLE.value == "") {
			alert("제목을 입력해 주세요.");
			return false;
		} else if (frm.NOTICE_CNT.value == "") {
			alert("내용을 입력해 주세요.");
			return false;
		}
		alert("수정되었습니다.")
	}

	$('.searchOption').val($('.searchOptionVal').val());

	var onList = function() {
		location.href = 'admin_notice';
	};
</script>
</head>
<!-- 메뉴 시작 -->
<div class="row" style="padding-left: 15px; width: 700px;">
	<h1 class="page-header">게시글 수정</h1>
</div>

<div class="row" style="padding-left: 15px; width: 700px;">
	<div class="panel panel-default">
		<div class="panel-heading">공지사항 수정 페이지입니다.</div>
		<div class="panel-body">
			<form:form id="notifyDetail" action="adminNotifyModify.conn"
				method="post" name="joinform" onsubmit="return joinValidation(this)"
				enctype="multipart/form-data">
				<input type="hidden" id="NOTICE_NUM" name="NOTICE_NUM"
					value="${notifyDetail.NOTICE_NUM}">
				<div class="form-group">
					<label>제목</label> <input type="text" class="form-control"
						id="NOTICE_TITLE" name="NOTICE_TITLE"
						value="${notifyDetail.NOTICE_TITLE}" style="width: 500px;" />
				</div>
				</br>
				<div class="form-group">
					<label>내용</label> <textarea rows="20"  class="form-control"
						id="NOTICE_CNT" name="NOTICE_CNT"
						style="width: 500px;">${notifyDetail.NOTICE_CNT}</textarea><br />
					 <br />
								</div>
				<div class="form-group">
					<label>등록일자</label>
					<fmt:formatDate value="${notifyDetail.NOTICE_REGDATE}"
						pattern="YY.MM.dd" />
				</div>
				<button type="submit" class="btn btn-success">수정</button>
				<button type="reset" class="btn btn-success">초기화</button>
				<button type="button" onclick="onList()" id="noticeList"
					class="btn btn-success">목록</button>
			</form:form>
		</div>
	</div>
</div>
