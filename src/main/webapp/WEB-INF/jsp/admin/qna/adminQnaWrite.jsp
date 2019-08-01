<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<script src="/giftcon/css/jquery/jquery-1.12.4.min.js"></script>
	<link rel="stylesheet" type="text/css" href="/giftcon/css/bootstrapadmin.min.css">
	<script src="/giftcon/css/common.js" charset="utf-8"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="row" style="padding-left: 15px; width: 700px;">
	<h1 class="page-header">Q&A등록</h1>
</div>

<div class="row" style="padding-left: 15px; width: 700px;">
	<div class="panel panel-default">
		<div class="panel-heading">Q&A등록 페이지입니다.</div>
		<div class="panel-body">
		<form id="commonForm" name="commonForm">
				<input type="hidden" id="QNA_NUMBER" name="QNA_NUMBER" value="${qnaDetail.QNA_NUM}" />
				<input type="hidden" id="GOODS_NUMBER" name="GOODS_NUMBER" value="${qnaDetail.GOODS_NUM}" />
				<input type="hidden" id="MEMBER_NUMBER" name="MEMBER_NUMBER" value="${qnaDetail.MEMBER_NUM}" />
				<input type="hidden" class="form-control" id="QNA_IMAGE1" name="QNA_IMAGE1" value="${qnaDetail.QNA_FILE}" />
				<div class="form-group">
					<label>QNA 글번호</label> 
					<input type="text" class="form-control" id="QNA_NUM" value="${qnaDetail.QNA_NUM}" style="width: initial;" readonly />
				</div>
				<div class="form-group">
					<label>QNA 카테고리</label> 
					<input type="text" class="form-control" id="QNA_CATEGORY" name="QNA_CATEGORY" value="${qnaDetail.QNA_CATEGORY}" style="width: initial;" />
				</div>
				<div class="form-group">
					<label>제목</label> 
					<input type="text" class="form-control" id="QNA_TITLE" name="QNA_TITLE" value="${qnaDetail.QNA_TITLE}" style="width: initial;" />
				</div>
				<div class="form-group">
					<label>내용</label>
					<textarea class="form-control" id="QNA_CONTENT" name="QNA_CONTENT" rows="10" cols="30" readonly>${qnaDetail.QNA_CNT}</textarea>
				</div>

				<c:choose>
					<c:when test="${qnaDetail.QNA_FILE != null}">
						<div class="form-group">
							<label>등록 이미지</label>
						</div>
						<div class="form-group">
							<img src="/MODA/file/qnaFile/${qnaDetail.QNA_FILE}" alt="" onerror="this.src='/MODA/file/noimg_130.gif'" style="width: 650px;" />
						</div>
					</c:when>
				</c:choose>
				<div class="form-group">
					<label>답변</label>
					<textarea class="form-control" id="QNA_COMMENT" name="QNA_COMMENT" rows="10" cols="30" title="QNA_COMMENT"><c:if test="${qnaDetail.QNA_COMMENT != null }">${qnaDetail.QNA_COMMENT}</c:if></textarea>
				</div>

				<c:choose>
					<c:when test="${qnaDetail.QNA_COMMENT != null}">
						<button type="button" class="btn btn-success" id="btn1" onclick="button1_click();">수정</button>
					</c:when>
					<c:otherwise>
						<button type="button" class="btn btn-success" id="btn1" onclick="button1_click();">등록</button>
					</c:otherwise>
				</c:choose>
					<button type="button" class="btn btn-outline btn-default" onclick="goList()">목록으로</button>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">

	function goList(){
		location.href="/giftcon/adminQnaList.conn";
	}

	function button1_click(){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/adminQnaUpdate.conn'/>");
		alert("코멘트 : " + $("#QNA_COMMENT").val());
		comSubmit.addParam("QNA_COMMENT", $("#QNA_COMMENT").val());
		comSubmit.addParam("QNA_NUM",$("#QNA_NUM").val());
		comSubmit.submit();
	}
</script>
</body>
</html>